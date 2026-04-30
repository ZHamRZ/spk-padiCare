<?php

namespace App\Services;

use App\Models\Rekomendasi;

class RecommendationService
{
    public function __construct(private SAWService $engine) {}

    public function previewForDisease(int $diseaseId, array $preferences = []): array
    {
        return $this->engine->preview($diseaseId, $preferences);
    }

    public function saveForUser(int $userId, int $diseaseId, array $preferences = []): Rekomendasi
    {
        return $this->engine->hitung($userId, $diseaseId, $preferences);
    }

    public function getPreferencePresets(): array
    {
        return $this->engine->getPreferencePresets();
    }
}
