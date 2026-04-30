<?php

namespace Database\Seeders;

use App\Models\Gejala;
use App\Models\GejalaPestisida;
use App\Models\GejalaPupuk;
use App\Models\Kriteria;
use App\Models\Pestisida;
use App\Models\Pupuk;
use App\Models\RatingPestisida;
use App\Models\RatingPupuk;
use App\Support\CfSchema;
use Illuminate\Database\Seeder;
use Illuminate\Support\Collection;

class CertaintyFactorRuleSeeder extends Seeder
{
    public function run(): void
    {
        if (!CfSchema::hasPupukRuleTable() || !CfSchema::hasPestisidaRuleTable()) {
            $this->command?->warn('Tabel rule CF belum tersedia. Jalankan migration terlebih dahulu.');

            return;
        }

        $criteriaWeights = Kriteria::query()
            ->pluck('bobot', 'id')
            ->map(fn ($weight) => (float) $weight);

        $gejalaList = Gejala::query()
            ->with(['penyakit' => function ($query) {
                if (CfSchema::hasSymptomCfColumns()) {
                    $query->withPivot(['mb', 'md']);
                }
            }])
            ->orderBy('kode')
            ->get();

        $fertilizerIds = Pupuk::query()->pluck('id');
        $pesticideIds = Pestisida::query()->pluck('id');

        $pupukRatings = RatingPupuk::query()
            ->get(['id_penyakit', 'id_pupuk', 'id_kriteria', 'nilai'])
            ->groupBy(fn ($item) => $item->id_penyakit . ':' . $item->id_pupuk);

        $pestisidaRatings = RatingPestisida::query()
            ->get(['id_penyakit', 'id_pestisida', 'id_kriteria', 'nilai'])
            ->groupBy(fn ($item) => $item->id_penyakit . ':' . $item->id_pestisida);

        $timestamp = now();
        $pupukRules = [];
        $pestisidaRules = [];

        foreach ($gejalaList as $gejala) {
            foreach ($fertilizerIds as $fertilizerId) {
                [$mb, $md] = $this->resolveSymptomCfPair(
                    $gejala->penyakit,
                    $pupukRatings,
                    $criteriaWeights,
                    (int) $fertilizerId
                );

                $pupukRules[] = [
                    'id_gejala' => $gejala->id,
                    'id_pupuk' => $fertilizerId,
                    'mb' => $mb,
                    'md' => $md,
                    'created_at' => $timestamp,
                    'updated_at' => $timestamp,
                ];
            }

            foreach ($pesticideIds as $pesticideId) {
                [$mb, $md] = $this->resolveSymptomCfPair(
                    $gejala->penyakit,
                    $pestisidaRatings,
                    $criteriaWeights,
                    (int) $pesticideId
                );

                $pestisidaRules[] = [
                    'id_gejala' => $gejala->id,
                    'id_pestisida' => $pesticideId,
                    'mb' => $mb,
                    'md' => $md,
                    'created_at' => $timestamp,
                    'updated_at' => $timestamp,
                ];
            }
        }

        GejalaPupuk::query()->upsert(
            $pupukRules,
            ['id_gejala', 'id_pupuk'],
            ['mb', 'md', 'updated_at']
        );

        GejalaPestisida::query()->upsert(
            $pestisidaRules,
            ['id_gejala', 'id_pestisida'],
            ['mb', 'md', 'updated_at']
        );

        $this->command?->info('Semua aturan CF pupuk dan pestisida per gejala berhasil diisi.');
    }

    private function resolveSymptomCfPair(
        Collection $linkedDiseases,
        Collection $ratingMap,
        Collection $criteriaWeights,
        int $itemId
    ): array {
        if ($linkedDiseases->isEmpty()) {
            return [0.700, 0.100];
        }

        $weightedCf = 0.0;
        $confidenceTotal = 0.0;
        $matchedCount = 0;

        foreach ($linkedDiseases as $disease) {
            $ratings = $ratingMap->get($disease->id . ':' . $itemId, collect());
            $symptomMb = (float) ($disease->pivot->mb ?? 0.7);
            $symptomMd = (float) ($disease->pivot->md ?? 0.1);
            $symptomConfidence = max(0.1, min(1, $symptomMb - $symptomMd));

            if ($ratings->isEmpty()) {
                continue;
            }

            [$ruleMb, $ruleMd] = $this->resolveCfPair($ratings, $criteriaWeights);
            $ruleCf = max(0.05, $ruleMb - $ruleMd);

            $weightedCf += $ruleCf * $symptomConfidence;
            $confidenceTotal += $symptomConfidence;
            $matchedCount++;
        }

        if ($matchedCount === 0) {
            $averageConfidence = (float) $linkedDiseases
                ->map(fn ($disease) => max(0.1, min(1, (float) ($disease->pivot->mb ?? 0.7) - (float) ($disease->pivot->md ?? 0.1))))
                ->avg();

            return $this->mapConfidenceToCfPair($averageConfidence > 0 ? $averageConfidence : 0.6);
        }

        $normalizedCf = $confidenceTotal > 0
            ? $weightedCf / $confidenceTotal
            : 0.6;

        return $this->mapConfidenceToCfPair($normalizedCf);
    }

    private function resolveCfPair(Collection $ratings, Collection $criteriaWeights): array
    {
        if ($ratings->isEmpty()) {
            return [0.700, 0.100];
        }

        $weightedScore = $ratings->sum(function ($rating) use ($criteriaWeights) {
            $weight = (float) ($criteriaWeights->get($rating->id_kriteria, 0) ?: 0);

            return ((float) $rating->nilai / 5) * $weight;
        });

        $weightTotal = (float) $ratings->sum(fn ($rating) => $criteriaWeights->get($rating->id_kriteria, 0));
        $normalized = $weightTotal > 0
            ? $weightedScore / $weightTotal
            : ((float) $ratings->avg('nilai') / 5);

        return $this->mapConfidenceToCfPair($normalized);
    }

    private function mapConfidenceToCfPair(float $normalized): array
    {
        $normalized = max(0.05, min(0.95, $normalized));
        $mb = round(min(0.950, max(0.450, 0.300 + ($normalized * 0.600))), 3);
        $md = round(min(0.450, max(0.050, 0.500 - ($normalized * 0.400))), 3);

        if ($md >= $mb) {
            $md = round(max(0.050, $mb - 0.050), 3);
        }

        return [$mb, $md];
    }
}
