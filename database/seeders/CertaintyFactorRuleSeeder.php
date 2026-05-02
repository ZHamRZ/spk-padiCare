<?php

namespace Database\Seeders;

use App\Models\Gejala;
use App\Models\GejalaPestisida;
use App\Models\GejalaPupuk;
use App\Models\Kriteria;
use App\Models\Pestisida;
use App\Models\Pupuk;
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

        $timestamp = now();
        $pupukRules = [];
        $pestisidaRules = [];

        foreach ($gejalaList as $gejala) {
            foreach ($fertilizerIds as $fertilizerId) {
                [$mb, $md] = $this->resolveSymptomCfPairDefault();

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
                [$mb, $md] = $this->resolveSymptomCfPairDefault();

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

    private function resolveSymptomCfPairDefault(): array
    {
        return [0.700, 0.100];
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
