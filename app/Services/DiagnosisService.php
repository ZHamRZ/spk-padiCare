<?php

namespace App\Services;

use App\Models\Penyakit;

class DiagnosisService
{
    public function identify(array $symptomIds): array
    {
        $symptomIds = collect($symptomIds)
            ->map(fn ($id) => (int) $id)
            ->unique()
            ->values()
            ->all();

        $diagnoses = [];
        $diseases = Penyakit::with('gejala')->get();

        foreach ($diseases as $disease) {
            $diseaseSymptoms = $disease->gejala->pluck('id')->map(fn ($id) => (int) $id)->all();
            $matched = array_values(array_intersect($symptomIds, $diseaseSymptoms));
            $totalSymptoms = count($diseaseSymptoms);

            if ($totalSymptoms === 0 || empty($matched)) {
                continue;
            }

            $confidence = round(count($matched) / $totalSymptoms, 4);

            $diagnoses[] = [
                'penyakit' => $disease,
                'cocok' => count($matched),
                'total' => $totalSymptoms,
                'persen' => round($confidence * 100),
                'confidence' => $confidence,
                'matched_gejala_ids' => $matched,
            ];
        }

        usort($diagnoses, fn ($left, $right) => $right['confidence'] <=> $left['confidence']);

        return [
            'diagnoses' => $diagnoses,
            'summary' => [
                'top_diagnosis' => $diagnoses[0] ?? null,
                'total_matches' => count($diagnoses),
                'selected_symptom_total' => count($symptomIds),
            ],
        ];
    }
}
