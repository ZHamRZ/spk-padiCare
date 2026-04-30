<?php

namespace App\Services;

use App\Models\Rekomendasi;

class RecommendationService
{
    public function __construct(
        private SAWService $sawEngine,
        private CertaintyFactorEngine $cfEngine
    ) {}

    public function previewForDisease(int $diseaseId, array $preferences = []): array
    {
        return $this->sawEngine->preview($diseaseId, $preferences);
    }

    public function saveForUser(int $userId, int $diseaseId, array $preferences = []): Rekomendasi
    {
        return $this->sawEngine->hitung($userId, $diseaseId, $preferences);
    }

    public function getPreferencePresets(): array
    {
        return $this->sawEngine->getPreferencePresets();
    }

    /**
     * Hitung rekomendasi dengan integrasi preferensi user yang mempengaruhi CF
     * Preferensi dapat berupa preset (hemat, efisien, seimbang) atau custom criteria weights
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
        // Dapatkan base CF dari diagnosis dengan symptom weights
        $baseResult = $this->sawEngine->preview($diseaseId, [
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
            'custom' => 'Preferensi custom berdasarkan bobot kriteria yang Anda tentukan.',
            default => 'Preferensi standar dengan penyesuaian minimal.',
        };
    }
}
