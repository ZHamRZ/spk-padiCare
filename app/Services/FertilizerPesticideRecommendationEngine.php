<?php

namespace App\Services;

use App\Models\Gejala;
use App\Models\Pupuk;
use App\Models\Pestisida;
use Illuminate\Support\Collection;

/**
 * FertilizerPesticideRecommendationEngine
 * 
 * Engine khusus untuk rekomendasi pupuk dan pestisida menggunakan metode Certainty Factor (CF)
 * dengan memperhatikan perbedaan makna antara penyebab (pupuk) dan solusi (pestisida).
 * 
 * KONSEP DASAR:
 * =============
 * 1. Certainty Factor: CF = MB - MD
 * 2. Interpretasi CF:
 *    - CF > 0  → mendukung hipotesis
 *    - CF = 0  → netral
 *    - CF < 0  → menolak hipotesis
 * 
 * PERBEDAAN MAKNA DATA:
 * =====================
 * A. PUPUK (SEBAGAI PENYEBAB)
 *    - CF menunjukkan seberapa besar pupuk menyebabkan gejala
 *    - CF positif → pupuk memperparah kondisi (tidak direkomendasikan)
 *    - CF negatif → pupuk tidak menyebabkan atau membantu (direkomendasikan)
 *    - Transformasi: CF_rekomendasi = -CF_penyebab
 * 
 * B. PESTISIDA (SEBAGAI SOLUSI)
 *    - CF menunjukkan efektivitas terhadap gejala
 *    - CF positif → efektif (direkomendasikan)
 *    - CF negatif → tidak efektif (tidak direkomendasikan)
 *    - Tidak ada transformasi: CF_rekomendasi = CF_asli
 * 
 * RUMUS KOMBINASI CF MULTI-GEJALA:
 * =================================
 * - Jika kedua CF positif: CFcombine = CF1 + CF2 * (1 - CF1)
 * - Jika kedua CF negatif: CFcombine = CF1 + CF2 * (1 + CF1)
 * - Jika berbeda tanda: CFcombine = (CF1 + CF2) / (1 - min(|CF1|, |CF2|))
 */
class FertilizerPesticideRecommendationEngine
{
    public function __construct(
        private CertaintyFactorEngine $cfEngine
    ) {}

    /**
     * Hitung rekomendasi pupuk berdasarkan gejala yang dipilih
     * 
     * @param array $symptomIds ID gejala yang dipilih user
     * @return array Hasil rekomendasi dengan CF yang sudah ditransformasi
     */
    public function calculateFertilizerRecommendations(array $symptomIds): array
    {
        if (empty($symptomIds)) {
            return [];
        }

        $symptomIds = collect($symptomIds)
            ->map(fn ($id) => (int) $id)
            ->unique()
            ->values()
            ->all();

        // Load semua pupuk yang memiliki relasi dengan gejala terpilih
        $fertilizers = Pupuk::with([
            'gejala' => function ($query) use ($symptomIds) {
                $query->whereIn('gejala.id', $symptomIds)
                    ->withPivot(['mb', 'md'])
                    ->orderBy('gejala.kode');
            }
        ])
        ->whereHas('gejala', function ($query) use ($symptomIds) {
            $query->whereIn('gejala.id', $symptomIds);
        })
        ->get();

        $recommendations = [];

        foreach ($fertilizers as $fertilizer) {
            $matchedSymptoms = $fertilizer->gejala;

            if ($matchedSymptoms->isEmpty()) {
                continue;
            }

            // Hitung CF penyebab dari semua gejala yang cocok
            $cfValues = [];
            $symptomDetails = [];

            foreach ($matchedSymptoms as $symptom) {
                $mb = (float) ($symptom->pivot->mb ?? 0.7);
                $md = (float) ($symptom->pivot->md ?? 0.1);

                // Validasi konsistensi MB dan MD
                if ($mb + $md > 1.0) {
                    $total = $mb + $md;
                    $mb = $mb / $total;
                    $md = $md / $total;
                }

                // CF = MB - MD (ini adalah CF penyebab)
                $cfPenyebab = $this->cfEngine->calculateCf($mb, $md);

                $cfValues[] = $cfPenyebab;
                $symptomDetails[] = [
                    'id' => $symptom->id,
                    'kode' => $symptom->kode,
                    'nama_gejala' => $symptom->nama_gejala,
                    'mb' => round($mb, 3),
                    'md' => round($md, 3),
                    'cf_penyebab' => round($cfPenyebab, 4),
                ];
            }

            // Kombinasi semua CF penyebab dari multi-gejala
            $cfPenyebabTotal = $this->cfEngine->combineMultipleCf($cfValues);

            // TRANSFORMASI: CF_rekomendasi = -CF_penyebab
            // CF negatif (penyebab) → menjadi positif (rekomendasi)
            // CF positif (penyebab) → menjadi negatif (tidak direkomendasikan)
            $cfRekomendasi = -$cfPenyebabTotal;

            // Normalisasi ke range [-1, 1]
            $cfRekomendasi = $this->cfEngine->normalizeToRange($cfRekomendasi, -1, 1);

            // Dapatkan label interpretasi
            $interpretation = $this->getRecommendationLabel($cfRekomendasi);

            $recommendations[] = [
                'id' => $fertilizer->id,
                'kode' => $fertilizer->kode,
                'nama' => $fertilizer->nama,
                'kandungan' => $fertilizer->kandungan,
                'kandungan_detail' => $fertilizer->kandungan_detail,
                'fungsi_utama' => $fertilizer->fungsi_utama,
                'harga_per_kg' => $fertilizer->harga_per_kg,
                'satuan' => $fertilizer->satuan,
                'takaran' => $fertilizer->takaran,
                'cara_aplikasi' => $fertilizer->cara_aplikasi,
                'frekuensi_aplikasi' => $fertilizer->frekuensi_aplikasi,
                'efek_penggunaan' => $fertilizer->efek_penggunaan,
                'gambar_url' => $fertilizer->gambar_url ?? null,
                'cf_penyebab_total' => round($cfPenyebabTotal, 4),
                'cf_rekomendasi' => round($cfRekomendasi, 4),
                'cf_percentage' => round($this->cfEngine->toPercentage($cfRekomendasi), 2),
                'interpretation' => $interpretation,
                'symptom_details' => $symptomDetails,
                'matched_symptoms_count' => $matchedSymptoms->count(),
            ];
        }

        // Urutkan berdasarkan CF rekomendasi tertinggi
        usort($recommendations, fn ($a, $b) => $b['cf_rekomendasi'] <=> $a['cf_rekomendasi']);

        // Tambahkan peringkat
        foreach ($recommendations as $index => &$item) {
            $item['peringkat'] = $index + 1;
        }

        return $recommendations;
    }

    /**
     * Hitung rekomendasi pestisida berdasarkan gejala yang dipilih
     * 
     * @param array $symptomIds ID gejala yang dipilih user
     * @return array Hasil rekomendasi dengan CF asli (tanpa transformasi)
     */
    public function calculatePesticideRecommendations(array $symptomIds): array
    {
        if (empty($symptomIds)) {
            return [];
        }

        $symptomIds = collect($symptomIds)
            ->map(fn ($id) => (int) $id)
            ->unique()
            ->values()
            ->all();

        // Load semua pestisida yang memiliki relasi dengan gejala terpilih
        $pesticides = Pestisida::with([
            'gejala' => function ($query) use ($symptomIds) {
                $query->whereIn('gejala.id', $symptomIds)
                    ->withPivot(['mb', 'md'])
                    ->orderBy('gejala.kode');
            }
        ])
        ->whereHas('gejala', function ($query) use ($symptomIds) {
            $query->whereIn('gejala.id', $symptomIds);
        })
        ->get();

        $recommendations = [];

        foreach ($pesticides as $pesticide) {
            $matchedSymptoms = $pesticide->gejala;

            if ($matchedSymptoms->isEmpty()) {
                continue;
            }

            // Hitung CF solusi dari semua gejala yang cocok
            $cfValues = [];
            $symptomDetails = [];

            foreach ($matchedSymptoms as $symptom) {
                $mb = (float) ($symptom->pivot->mb ?? 0.7);
                $md = (float) ($symptom->pivot->md ?? 0.1);

                // Validasi konsistensi MB dan MD
                if ($mb + $md > 1.0) {
                    $total = $mb + $md;
                    $mb = $mb / $total;
                    $md = $md / $total;
                }

                // CF = MB - MD (ini adalah CF solusi/efektivitas)
                $cfSolusi = $this->cfEngine->calculateCf($mb, $md);

                $cfValues[] = $cfSolusi;
                $symptomDetails[] = [
                    'id' => $symptom->id,
                    'kode' => $symptom->kode,
                    'nama_gejala' => $symptom->nama_gejala,
                    'mb' => round($mb, 3),
                    'md' => round($md, 3),
                    'cf_solusi' => round($cfSolusi, 4),
                ];
            }

            // Kombinasi semua CF solusi dari multi-gejala
            $cfSolusiTotal = $this->cfEngine->combineMultipleCf($cfValues);

            // TIDAK ADA TRANSFORMASI untuk pestisida
            // CF_rekomendasi = CF_asli
            $cfRekomendasi = $cfSolusiTotal;

            // Normalisasi ke range [-1, 1]
            $cfRekomendasi = $this->cfEngine->normalizeToRange($cfRekomendasi, -1, 1);

            // Dapatkan label interpretasi
            $interpretation = $this->getRecommendationLabel($cfRekomendasi);

            $recommendations[] = [
                'id' => $pesticide->id,
                'kode' => $pesticide->kode,
                'nama' => $pesticide->nama,
                'bahan_aktif' => $pesticide->bahan_aktif,
                'kandungan_detail' => $pesticide->kandungan_detail,
                'fungsi' => $pesticide->fungsi,
                'dosis' => $pesticide->dosis,
                'harga' => $pesticide->harga,
                'satuan_harga' => $pesticide->satuan_harga,
                'cara_aplikasi' => $pesticide->cara_aplikasi,
                'frekuensi_aplikasi' => $pesticide->frekuensi_aplikasi,
                'efek_penggunaan' => $pesticide->efek_penggunaan,
                'gambar_url' => $pesticide->gambar_url ?? null,
                'cf_solusi_total' => round($cfSolusiTotal, 4),
                'cf_rekomendasi' => round($cfRekomendasi, 4),
                'cf_percentage' => round($this->cfEngine->toPercentage($cfRekomendasi), 2),
                'interpretation' => $interpretation,
                'symptom_details' => $symptomDetails,
                'matched_symptoms_count' => $matchedSymptoms->count(),
            ];
        }

        // Urutkan berdasarkan CF rekomendasi tertinggi
        usort($recommendations, fn ($a, $b) => $b['cf_rekomendasi'] <=> $a['cf_rekomendasi']);

        // Tambahkan peringkat
        foreach ($recommendations as $index => &$item) {
            $item['peringkat'] = $index + 1;
        }

        return $recommendations;
    }

    /**
     * Hitung rekomendasi lengkap (pupuk + pestisida) berdasarkan gejala
     * 
     * @param array $symptomIds ID gejala yang dipilih user
     * @param int|null $topN Batasi hasil top N (default: null = semua)
     * @param bool $onlyPositive Hanya tampilkan CF > 0
     * @return array Hasil rekomendasi lengkap
     */
    public function calculateAllRecommendations(
        array $symptomIds,
        ?int $topN = null,
        bool $onlyPositive = true
    ): array {
        $fertilizerRecs = $this->calculateFertilizerRecommendations($symptomIds);
        $pesticideRecs = $this->calculatePesticideRecommendations($symptomIds);

        // Filter hanya CF > 0 jika diminta
        if ($onlyPositive) {
            $fertilizerRecs = array_filter($fertilizerRecs, fn ($item) => $item['cf_rekomendasi'] > 0);
            $pesticideRecs = array_filter($pesticideRecs, fn ($item) => $item['cf_rekomendasi'] > 0);
            
            // Re-index arrays after filtering
            $fertilizerRecs = array_values($fertilizerRecs);
            $pesticideRecs = array_values($pesticideRecs);

            // Re-calculate peringkat setelah filter
            foreach ($fertilizerRecs as $index => &$item) {
                $item['peringkat'] = $index + 1;
            }
            foreach ($pesticideRecs as $index => &$item) {
                $item['peringkat'] = $index + 1;
            }
        }

        // Batasi top N jika diminta
        if ($topN !== null && $topN > 0) {
            $fertilizerRecs = array_slice($fertilizerRecs, 0, $topN);
            $pesticideRecs = array_slice($pesticideRecs, 0, $topN);
        }

        return [
            'pupuk' => $fertilizerRecs,
            'pestisida' => $pesticideRecs,
            'summary' => [
                'total_gejala' => count($symptomIds),
                'total_pupuk_direkomendasikan' => count($fertilizerRecs),
                'total_pestisida_direkomendasikan' => count($pesticideRecs),
                'filter_positive_only' => $onlyPositive,
                'top_n' => $topN,
            ],
            'method_info' => [
                'pupuk_transformation' => 'CF_rekomendasi = -CF_penyebab',
                'pestisida_transformation' => 'CF_rekomendasi = CF_solusi (tanpa perubahan)',
                'combination_formula' => 'CFcombine = CF1 + CF2 * (1 - CF1) untuk same sign',
            ],
        ];
    }

    /**
     * Dapatkan label rekomendasi berdasarkan nilai CF
     * 
     * @param float $cf Nilai Certainty Factor
     * @return array Label, color, dan description
     */
    public function getRecommendationLabel(float $cf): array
    {
        $cf = $this->cfEngine->normalizeToRange($cf, -1, 1);

        if ($cf > 0.7) {
            return [
                'label' => 'Sangat Direkomendasikan',
                'color' => 'success',
                'icon' => '✓✓',
                'description' => 'Rekomendasi sangat kuat berdasarkan analisis gejala.',
                'badge_class' => 'bg-success',
            ];
        } elseif ($cf > 0.4) {
            return [
                'label' => 'Direkomendasikan',
                'color' => 'primary',
                'icon' => '✓',
                'description' => 'Rekomendasi kuat berdasarkan analisis gejala.',
                'badge_class' => 'bg-primary',
            ];
        } elseif ($cf > 0.1) {
            return [
                'label' => 'Cukup',
                'color' => 'warning',
                'icon' => '~',
                'description' => 'Rekomendasi moderat, pertimbangkan alternatif lain.',
                'badge_class' => 'bg-warning text-dark',
            ];
        } elseif ($cf > 0) {
            return [
                'label' => 'Kurang Direkomendasikan',
                'color' => 'info',
                'icon' => '?',
                'description' => 'Rekomendasi lemah, gunakan dengan pertimbangan.',
                'badge_class' => 'bg-info text-dark',
            ];
        } else {
            return [
                'label' => 'Tidak Direkomendasikan',
                'color' => 'danger',
                'icon' => '✗',
                'description' => 'Tidak direkomendasikan berdasarkan analisis gejala.',
                'badge_class' => 'bg-danger',
            ];
        }
    }

    /**
     * Hitung detail CF untuk satu pupuk tertentu
     * 
     * @param int $fertilizerId ID pupuk
     * @param array $symptomIds ID gejala yang dipilih
     * @return array|null Detail CF atau null jika tidak ada relasi
     */
    public function calculateSingleFertilizerDetail(int $fertilizerId, array $symptomIds): ?array
    {
        $fertilizer = Pupuk::with([
            'gejala' => function ($query) use ($symptomIds) {
                $query->whereIn('gejala.id', $symptomIds)
                    ->withPivot(['mb', 'md']);
            }
        ])->find($fertilizerId);

        if (!$fertilizer || $fertilizer->gejala->isEmpty()) {
            return null;
        }

        $cfValues = [];
        $symptomDetails = [];

        foreach ($fertilizer->gejala as $symptom) {
            $mb = (float) ($symptom->pivot->mb ?? 0.7);
            $md = (float) ($symptom->pivot->md ?? 0.1);

            if ($mb + $md > 1.0) {
                $total = $mb + $md;
                $mb = $mb / $total;
                $md = $md / $total;
            }

            $cfPenyebab = $this->cfEngine->calculateCf($mb, $md);
            $cfValues[] = $cfPenyebab;

            $symptomDetails[] = [
                'id' => $symptom->id,
                'kode' => $symptom->kode,
                'nama_gejala' => $symptom->nama_gejala,
                'mb' => round($mb, 3),
                'md' => round($md, 3),
                'cf_penyebab' => round($cfPenyebab, 4),
            ];
        }

        $cfPenyebabTotal = $this->cfEngine->combineMultipleCf($cfValues);
        $cfRekomendasi = -$cfPenyebabTotal;
        $cfRekomendasi = $this->cfEngine->normalizeToRange($cfRekomendasi, -1, 1);

        return [
            'fertilizer' => [
                'id' => $fertilizer->id,
                'kode' => $fertilizer->kode,
                'nama' => $fertilizer->nama,
            ],
            'cf_penyebab_total' => round($cfPenyebabTotal, 4),
            'cf_rekomendasi' => round($cfRekomendasi, 4),
            'interpretation' => $this->getRecommendationLabel($cfRekomendasi),
            'symptom_details' => $symptomDetails,
            'calculation_steps' => $this->buildCalculationSteps($cfValues, 'pupuk'),
        ];
    }

    /**
     * Hitung detail CF untuk satu pestisida tertentu
     * 
     * @param int $pesticideId ID pestisida
     * @param array $symptomIds ID gejala yang dipilih
     * @return array|null Detail CF atau null jika tidak ada relasi
     */
    public function calculateSinglePesticideDetail(int $pesticideId, array $symptomIds): ?array
    {
        $pesticide = Pestisida::with([
            'gejala' => function ($query) use ($symptomIds) {
                $query->whereIn('gejala.id', $symptomIds)
                    ->withPivot(['mb', 'md']);
            }
        ])->find($pesticideId);

        if (!$pesticide || $pesticide->gejala->isEmpty()) {
            return null;
        }

        $cfValues = [];
        $symptomDetails = [];

        foreach ($pesticide->gejala as $symptom) {
            $mb = (float) ($symptom->pivot->mb ?? 0.7);
            $md = (float) ($symptom->pivot->md ?? 0.1);

            if ($mb + $md > 1.0) {
                $total = $mb + $md;
                $mb = $mb / $total;
                $md = $md / $total;
            }

            $cfSolusi = $this->cfEngine->calculateCf($mb, $md);
            $cfValues[] = $cfSolusi;

            $symptomDetails[] = [
                'id' => $symptom->id,
                'kode' => $symptom->kode,
                'nama_gejala' => $symptom->nama_gejala,
                'mb' => round($mb, 3),
                'md' => round($md, 3),
                'cf_solusi' => round($cfSolusi, 4),
            ];
        }

        $cfSolusiTotal = $this->cfEngine->combineMultipleCf($cfValues);
        $cfRekomendasi = $cfSolusiTotal;
        $cfRekomendasi = $this->cfEngine->normalizeToRange($cfRekomendasi, -1, 1);

        return [
            'pesticide' => [
                'id' => $pesticide->id,
                'kode' => $pesticide->kode,
                'nama' => $pesticide->nama,
            ],
            'cf_solusi_total' => round($cfSolusiTotal, 4),
            'cf_rekomendasi' => round($cfRekomendasi, 4),
            'interpretation' => $this->getRecommendationLabel($cfRekomendasi),
            'symptom_details' => $symptomDetails,
            'calculation_steps' => $this->buildCalculationSteps($cfValues, 'pestisida'),
        ];
    }

    /**
     * Bangun langkah-langkah perhitungan untuk transparansi
     */
    private function buildCalculationSteps(array $cfValues, string $type): array
    {
        $steps = [];
        
        if (empty($cfValues)) {
            return $steps;
        }

        $steps[] = [
            'step' => 1,
            'description' => 'Hitung CF individual untuk setiap gejala',
            'formula' => 'CF = MB - MD',
            'values' => $cfValues,
        ];

        if (count($cfValues) > 1) {
            $combined = $cfValues[0];
            $combinationSteps = [];

            for ($i = 1; $i < count($cfValues); $i++) {
                $cf1 = $combined;
                $cf2 = $cfValues[$i];
                
                if ($cf1 >= 0 && $cf2 >= 0) {
                    $formula = 'CF1 + CF2 * (1 - CF1)';
                    $result = $cf1 + $cf2 * (1 - $cf1);
                } elseif ($cf1 <= 0 && $cf2 <= 0) {
                    $formula = 'CF1 + CF2 * (1 + CF1)';
                    $result = $cf1 + $cf2 * (1 + $cf1);
                } else {
                    $minAbs = min(abs($cf1), abs($cf2));
                    $formula = '(CF1 + CF2) / (1 - min(|CF1|, |CF2|))';
                    $denominator = 1 - $minAbs;
                    $result = $denominator != 0 ? ($cf1 + $cf2) / $denominator : 0;
                }

                $combinationSteps[] = [
                    'iteration' => $i,
                    'cf1' => round($cf1, 4),
                    'cf2' => round($cf2, 4),
                    'formula' => $formula,
                    'result' => round($result, 4),
                ];

                $combined = $result;
            }

            $steps[] = [
                'step' => 2,
                'description' => 'Kombinasi CF secara sequential',
                'combination_steps' => $combinationSteps,
                'final_combined' => round($combined, 4),
            ];
        }

        if ($type === 'pupuk') {
            $finalCf = end($cfValues);
            if (count($cfValues) > 1) {
                // Recalculate to get final combined
                $finalCf = $this->cfEngine->combineMultipleCf($cfValues);
            }
            $steps[] = [
                'step' => 3,
                'description' => 'Transformasi CF untuk pupuk (penyebab → rekomendasi)',
                'formula' => 'CF_rekomendasi = -CF_penyebab',
                'cf_penyebab' => round($finalCf, 4),
                'cf_rekomendasi' => round(-$finalCf, 4),
            ];
        } else {
            $finalCf = end($cfValues);
            if (count($cfValues) > 1) {
                $finalCf = $this->cfEngine->combineMultipleCf($cfValues);
            }
            $steps[] = [
                'step' => 3,
                'description' => 'CF pestisida langsung digunakan (tanpa transformasi)',
                'formula' => 'CF_rekomendasi = CF_solusi',
                'cf_rekomendasi' => round($finalCf, 4),
            ];
        }

        return $steps;
    }
}
