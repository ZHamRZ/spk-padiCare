<?php

namespace App\Services;

use App\Models\Rekomendasi;

class RecommendationService
{
    public function __construct(
        private CertaintyFactorService $cfService,
        private CertaintyFactorEngine $cfEngine,
        private FertilizerPesticideRecommendationEngine $fpEngine
    ) {}
    
    /**
     * Preview rekomendasi dengan logika CF yang benar
     */
    public function previewForDisease(int $diseaseId, array $preferences = []): array
    {
        // Ekstrak gejala terpilih dari preferensi
        $gejalaIds = collect($preferences['gejala_terpilih'] ?? [])
            ->pluck('id')
            ->map(fn($id) => (int) $id)
            ->unique()
            ->values()
            ->all();
        
        // Jika ada gejala terpilih, gunakan FertilizerPesticideRecommendationEngine
        // untuk mendapatkan rekomendasi dengan logika CF yang benar
        if (!empty($gejalaIds)) {
            return $this->fpEngine->calculateAllRecommendations(
                $gejalaIds,
                topN: null,
                onlyPositive: true
            );
        }
        
        // Fallback ke metode lama jika tidak ada gejala
        return $this->cfService->preview($diseaseId, $preferences);
    }

    public function saveForUser(int $userId, int $diseaseId, array $preferences = []): Rekomendasi
    {
        return $this->cfService->hitung($userId, $diseaseId, $preferences);
    }

    public function getPreferencePresets(): array
    {
        return $this->cfService->getPreferencePresets();
    }

    /**
     * Hitung rekomendasi dengan integrasi preferensi user yang mempengaruhi CF
     * Menggunakan FertilizerPesticideRecommendationEngine untuk logika CF yang benar
     * 
     * @param int $diseaseId ID penyakit
     * @param string $presetType Tipe preset preferensi
     * @param array $criteriaWeights Bobot kriteria custom dari user
     * @param array $symptomWeights Bobot keyakinan user untuk setiap gejala
     */
    public function calculateWithPreferences(
        int $diseaseId,
        string $presetType = 'seimbang',
        array $criteriaWeights = [],
        array $symptomWeights = []
    ): array {
        // Ekstrak gejala terpilih dari symptom weights atau preferensi lain
        $gejalaIds = array_keys($symptomWeights);
        
        // Jika ada gejala, gunakan FertilizerPesticideRecommendationEngine
        if (!empty($gejalaIds)) {
            // Hitung rekomendasi dasar dengan fpEngine (logika CF sudah benar)
            $fpResult = $this->fpEngine->calculateAllRecommendations(
                $gejalaIds,
                topN: null,
                onlyPositive: true
            );
            
            // Apply preference adjustment jika diperlukan
            // Catatan: adjustment ini bersifat opsional dan tidak mengubah logika dasar CF
            if ($presetType !== 'seimbang' || !empty($criteriaWeights)) {
                $fpResult = $this->applyPreferenceToFPResult($fpResult, $presetType, $criteriaWeights, $symptomWeights);
            }
            
            return $fpResult;
        }
        
        // Fallback ke metode lama jika tidak ada gejala
        $baseResult = $this->cfService->preview($diseaseId, [
            'preset' => $presetType,
            'kriteria' => $criteriaWeights,
            'gejala_weights' => $symptomWeights,
        ]);

        // Apply preference adjustment ke setiap alternatif pupuk
        $adjustedPupuk = collect($baseResult['pupuk'])->map(function ($item) use ($presetType, $criteriaWeights, $symptomWeights) {
            $baseCf = $item['vi'];
            
            // Apply preference adjustment berdasarkan preset dan kriteria
            $adjustedCf = $this->cfEngine->applyPreferenceAdjustment(
                $baseCf,
                $presetType,
                $criteriaWeights,
                ['harga' => data_get($item, 'meta.harga_per_kg', 0)]
            );
            
            // Tambahkan adjustment dari symptom weights jika ada
            if (!empty($symptomWeights)) {
                $symptomAdjustment = $this->calculateSymptomWeightAdjustment(
                    $item['id'],
                    $symptomWeights,
                    data_get($item, 'meta.gejala_cocok', [])
                );
                $adjustedCf = $this->cfEngine->normalizeToRange($adjustedCf + $symptomAdjustment, -1, 1);
            }

            $item['vi'] = $adjustedCf;
            $item['cf_akhir'] = $adjustedCf;
            $item['preference_applied'] = true;
            $item['adjustment_info'] = [
                'preset_boost' => round($adjustedCf - $baseCf, 4),
                'symptom_adjustment' => !empty($symptomWeights) ? round($symptomAdjustment, 4) : 0,
            ];
            
            return $item;
        })->sortByDesc('vi')->values()->all();

        // Apply preference adjustment ke setiap alternatif pestisida
        $adjustedPestisida = collect($baseResult['pestisida'])->map(function ($item) use ($presetType, $criteriaWeights, $symptomWeights) {
            $baseCf = $item['vi'];
            
            $adjustedCf = $this->cfEngine->applyPreferenceAdjustment(
                $baseCf,
                $presetType,
                $criteriaWeights,
                ['harga' => data_get($item, 'meta.harga', 0)]
            );
            
            // Tambahkan adjustment dari symptom weights jika ada
            if (!empty($symptomWeights)) {
                $symptomAdjustment = $this->calculateSymptomWeightAdjustment(
                    $item['id'],
                    $symptomWeights,
                    data_get($item, 'meta.gejala_cocok', [])
                );
                $adjustedCf = $this->cfEngine->normalizeToRange($adjustedCf + $symptomAdjustment, -1, 1);
            }

            $item['vi'] = $adjustedCf;
            $item['cf_akhir'] = $adjustedCf;
            $item['preference_applied'] = true;
            $item['adjustment_info'] = [
                'preset_boost' => round($adjustedCf - $baseCf, 4),
                'symptom_adjustment' => !empty($symptomWeights) ? round($symptomAdjustment, 4) : 0,
            ];
            
            return $item;
        })->sortByDesc('vi')->values()->all();

        // Update peringkat setelah adjustment
        foreach ($adjustedPupuk as $index => &$item) {
            $item['peringkat'] = $index + 1;
        }
        foreach ($adjustedPestisida as $index => &$item) {
            $item['peringkat'] = $index + 1;
        }

        return [
            ...$baseResult,
            'pupuk' => $adjustedPupuk,
            'pestisida' => $adjustedPestisida,
            'preference_info' => [
                'preset' => $presetType,
                'criteria_weights' => $criteriaWeights,
                'symptom_weights' => $symptomWeights,
                'description' => $this->getPreferenceDescription($presetType),
                'applied' => true,
            ],
        ];
    }

    /**
     * Hitung adjustment berdasarkan bobot gejala user
     * Gejala dengan weight tinggi akan memberikan boost kecil pada alternatif yang mendukung gejala tersebut
     */
    private function calculateSymptomWeightAdjustment(
        int $alternativeId,
        array $symptomWeights,
        array $matchedSymptoms
    ): float {
        if (empty($matchedSymptoms) || empty($symptomWeights)) {
            return 0.0;
        }

        $totalAdjustment = 0.0;
        $maxPossibleAdjustment = 0.0;

        foreach ($matchedSymptoms as $symptom) {
            $symptomId = data_get($symptom, 'id');
            $weight = $symptomWeights[$symptomId] ?? 100;
            
            // Normalisasi weight ke 0-1
            $normalizedWeight = min(1, $weight / 100);
            
            // Adjustment per gejala: max 0.02 per gejala dengan weight penuh
            $symptomContribution = 0.02 * $normalizedWeight;
            $totalAdjustment += $symptomContribution;
            $maxPossibleAdjustment += 0.02;
        }

        // Cap total adjustment di 0.08 (8%) untuk menghindari dominasi berlebihan
        return min(0.08, $totalAdjustment);
    }

    private function getPreferenceDescription(string $preset): string
    {
        return match ($preset) {
            'hemat' => 'Preferensi ini memprioritaskan alternatif dengan biaya lebih rendah.',
            'efisiensi' => 'Preferensi ini memperkuat alternatif dengan keyakinan pakar tertinggi.',
            'seimbang' => 'Preferensi ini memberikan penyesuaian moderat untuk semua alternatif.',
            default => 'Preferensi standar dengan penyesuaian minimal.',
        };
    }
    
    /**
     * Apply preference adjustment ke hasil dari FertilizerPesticideRecommendationEngine
     * Tanpa mengubah logika dasar CF (transformasi sudah dilakukan oleh fpEngine)
     */
    private function applyPreferenceToFPResult(
        array $fpResult,
        string $presetType,
        array $criteriaWeights,
        array $symptomWeights
    ): array {
        // Untuk saat ini, kembalikan hasil fpEngine tanpa modifikasi
        // karena transformasi CF sudah benar dilakukan oleh fpEngine
        // Preference adjustment dapat ditambahkan di sini jika diperlukan
        // dengan tetap menjaga integritas transformasi CF
        
        if (empty($criteriaWeights) && $presetType === 'seimbang') {
            return $fpResult;
        }
        
        // Apply minor adjustment untuk pupuk dan pestisida
        $adjustedPupuk = collect($fpResult['pupuk'])->map(function ($item) use ($presetType, $criteriaWeights) {
            $baseCf = $item['cf_rekomendasi'];
            
            // Adjustment kecil berdasarkan preset (tidak mengubah sign CF)
            $adjustment = $this->getPresetAdjustmentValue($presetType, $item);
            $adjustedCf = $this->cfEngine->normalizeToRange($baseCf + $adjustment, -1, 1);
            
            $item['cf_rekomendasi'] = round($adjustedCf, 4);
            $item['cf_percentage'] = round($this->cfEngine->toPercentage($adjustedCf), 2);
            $item['interpretation'] = $this->fpEngine->getRecommendationLabel($adjustedCf);
            $item['preference_applied'] = true;
            
            return $item;
        })->sortByDesc('cf_rekomendasi')->values();
        
        $adjustedPestisida = collect($fpResult['pestisida'])->map(function ($item) use ($presetType, $criteriaWeights) {
            $baseCf = $item['cf_rekomendasi'];
            
            $adjustment = $this->getPresetAdjustmentValue($presetType, $item);
            $adjustedCf = $this->cfEngine->normalizeToRange($baseCf + $adjustment, -1, 1);
            
            $item['cf_rekomendasi'] = round($adjustedCf, 4);
            $item['cf_percentage'] = round($this->cfEngine->toPercentage($adjustedCf), 2);
            $item['interpretation'] = $this->fpEngine->getRecommendationLabel($adjustedCf);
            $item['preference_applied'] = true;
            
            return $item;
        })->sortByDesc('cf_rekomendasi')->values();
        
        // Re-calculate peringkat setelah adjustment
        foreach ($adjustedPupuk as $index => &$item) {
            $item['peringkat'] = $index + 1;
        }
        foreach ($adjustedPestisida as $index => &$item) {
            $item['peringkat'] = $index + 1;
        }
        
        return [
            'pupuk' => $adjustedPupuk->all(),
            'pestisida' => $adjustedPestisida->all(),
            'summary' => $fpResult['summary'],
            'method_info' => $fpResult['method_info'],
            'preference_info' => [
                'preset' => $presetType,
                'criteria_weights' => $criteriaWeights,
                'symptom_weights' => $symptomWeights,
                'description' => $this->getPreferenceDescription($presetType),
                'applied' => true,
            ],
        ];
    }
    
    /**
     * Dapatkan nilai adjustment berdasarkan preset
     * Nilai adjustment kecil untuk tidak mengubah sign CF
     */
    private function getPresetAdjustmentValue(string $presetType, array $item): float
    {
        return match ($presetType) {
            'hemat' => data_get($item, 'meta.harga_per_kg', data_get($item, 'meta.harga', 0)) < 50000 ? 0.03 : -0.02,
            'efisiensi' => data_get($item, 'cf_rekomendasi', 0) > 0.7 ? 0.02 : 0,
            'seimbang' => 0,
            default => 0,
        };
    }
}
