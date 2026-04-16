<?php

namespace App\Services;

use App\Models\DetailRekomendasiPestisida;
use App\Models\DetailRekomendasiPupuk;
use App\Models\Kriteria;
use App\Models\Pestisida;
use App\Models\Pupuk;
use App\Models\RatingPestisida;
use App\Models\RatingPupuk;
use App\Models\Rekomendasi;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use RuntimeException;

class SAWService
{
    public function hitung(int $idUser, int $idPenyakit, array $preferensi = []): Rekomendasi
    {
        $kriteria = Kriteria::orderBy('kode')->get();
        $kriteriaTerbobot = $this->buildWeightedCriteria($kriteria, $preferensi);

        $hasilPupuk = $this->hitungAlternatif('pupuk', $idPenyakit, $kriteriaTerbobot);
        $hasilPestisida = $this->hitungAlternatif('pestisida', $idPenyakit, $kriteriaTerbobot);
        $preferensiSnapshot = $this->buildPreferenceSnapshot($kriteriaTerbobot, $preferensi);

        return DB::transaction(function () use ($idUser, $idPenyakit, $hasilPupuk, $hasilPestisida, $preferensiSnapshot) {
            $rekomendasi = Rekomendasi::create([
                'id_user' => $idUser,
                'id_penyakit' => $idPenyakit,
                'tanggal' => now(),
                'preferensi_label' => $preferensiSnapshot['preset_label'],
                'preferensi_pengguna' => $preferensiSnapshot,
            ]);

            foreach ($hasilPupuk as $item) {
                DetailRekomendasiPupuk::create([
                    'id_rekomendasi' => $rekomendasi->id,
                    'id_pupuk' => $item['id'],
                    'nilai_vi' => $item['vi'],
                    'peringkat' => $item['peringkat'],
                ]);
            }

            foreach ($hasilPestisida as $item) {
                DetailRekomendasiPestisida::create([
                    'id_rekomendasi' => $rekomendasi->id,
                    'id_pestisida' => $item['id'],
                    'nilai_vi' => $item['vi'],
                    'peringkat' => $item['peringkat'],
                ]);
            }

            return $rekomendasi;
        });
    }

    public function hitungAlternatif(string $jenis, int $idPenyakit, ?Collection $kriteria = null): array
    {
        $kriteria ??= $this->buildWeightedCriteria(Kriteria::orderBy('kode')->get());

        if ($kriteria->isEmpty()) {
            throw new RuntimeException('Data kriteria belum tersedia. Silakan isi kriteria dan bobot SAW terlebih dahulu.');
        }

        $alternatif = $jenis === 'pupuk' ? Pupuk::orderBy('kode')->get() : Pestisida::orderBy('kode')->get();
        $ratings = $jenis === 'pupuk'
            ? RatingPupuk::where('id_penyakit', $idPenyakit)->get()
            : RatingPestisida::where('id_penyakit', $idPenyakit)->get();

        $idKolomAlternatif = $jenis === 'pupuk' ? 'id_pupuk' : 'id_pestisida';
        $label = $jenis === 'pupuk' ? 'pupuk' : 'pestisida';

        if ($alternatif->isEmpty()) {
            throw new RuntimeException("Data alternatif {$label} belum tersedia.");
        }

        if ($ratings->isEmpty()) {
            throw new RuntimeException("Rating {$label} untuk penyakit terpilih belum diisi di panel admin.");
        }

        $matriks = [];
        foreach ($alternatif as $item) {
            foreach ($kriteria as $kriteriaItem) {
                $rating = $ratings
                    ->where($idKolomAlternatif, $item->id)
                    ->where('id_kriteria', $kriteriaItem['id'])
                    ->first();

                if (!$rating) {
                    throw new RuntimeException(
                        "Rating {$label} untuk alternatif {$item->nama} pada kriteria {$kriteriaItem['kode']} belum lengkap."
                    );
                }

                $matriks[$item->id][$kriteriaItem['id']] = (float) $rating->nilai;
            }
        }

        $normalisasi = [];
        $statistik = [];

        foreach ($kriteria as $kriteriaItem) {
            $nilaiKolom = [];
            foreach ($alternatif as $item) {
                $nilaiKolom[$item->id] = $matriks[$item->id][$kriteriaItem['id']] ?? 0;
            }

            $statistik[$kriteriaItem['id']] = [
                'max' => max($nilaiKolom),
                'min' => min($nilaiKolom),
            ];

            foreach ($alternatif as $item) {
                $xij = $nilaiKolom[$item->id];

                if ($kriteriaItem['jenis'] === 'benefit') {
                    $normalisasi[$item->id][$kriteriaItem['id']] = $statistik[$kriteriaItem['id']]['max'] > 0
                        ? round($xij / $statistik[$kriteriaItem['id']]['max'], 6)
                        : 0;
                } else {
                    $normalisasi[$item->id][$kriteriaItem['id']] = $xij > 0
                        ? round($statistik[$kriteriaItem['id']]['min'] / $xij, 6)
                        : 0;
                }
            }
        }

        $hasil = [];
        foreach ($alternatif as $item) {
            $nilaiPreferensi = 0;
            $detail = [];

            foreach ($kriteria as $kriteriaItem) {
                $xij = $matriks[$item->id][$kriteriaItem['id']] ?? 0;
                $rij = $normalisasi[$item->id][$kriteriaItem['id']] ?? 0;
                $wj = (float) $kriteriaItem['bobot_final'];
                $kontribusi = round($wj * $rij, 6);
                $nilaiPreferensi += $kontribusi;

                $detail[$kriteriaItem['kode']] = [
                    'kriteria' => $kriteriaItem['nama'],
                    'jenis' => $kriteriaItem['jenis'],
                    'xij' => $xij,
                    'min' => $statistik[$kriteriaItem['id']]['min'],
                    'max' => $statistik[$kriteriaItem['id']]['max'],
                    'formula_normalisasi' => $kriteriaItem['jenis'] === 'benefit'
                        ? "rij = xij / max(xij) = {$xij} / {$statistik[$kriteriaItem['id']]['max']}"
                        : "rij = min(xij) / xij = {$statistik[$kriteriaItem['id']]['min']} / {$xij}",
                    'bobot_awal' => $kriteriaItem['bobot_awal'],
                    'preferensi_user' => $kriteriaItem['preferensi_user'],
                    'bobot_final' => $kriteriaItem['bobot_final'],
                    'rij' => $rij,
                    'wj' => $wj,
                    'wj_rij' => $kontribusi,
                ];
            }

            $hasil[] = [
                'id' => $item->id,
                'kode' => $item->kode,
                'nama' => $item->nama,
                'vi' => round($nilaiPreferensi, 6),
                'meta' => [
                    'kandungan' => $jenis === 'pupuk' ? $item->kandungan : null,
                    'kandungan_detail' => $item->kandungan_detail ?? null,
                    'bahan_aktif' => $jenis === 'pestisida' ? ($item->bahan_aktif ?? null) : null,
                    'fungsi_utama' => $jenis === 'pupuk' ? ($item->fungsi_utama ?? null) : null,
                    'fungsi' => $jenis === 'pestisida' ? ($item->fungsi ?? null) : null,
                    'takaran' => $item->takaran ?? null,
                    'dosis' => $jenis === 'pestisida' ? ($item->dosis ?? null) : null,
                    'efek_penggunaan' => $item->efek_penggunaan ?? null,
                    'cara_aplikasi' => $item->cara_aplikasi ?? null,
                    'jadwal_umur_aplikasi' => $item->jadwal_umur_aplikasi ?? null,
                    'frekuensi_aplikasi' => $item->frekuensi_aplikasi ?? null,
                ],
                'detail' => $detail,
            ];
        }

        usort($hasil, fn($a, $b) => $b['vi'] <=> $a['vi']);

        foreach ($hasil as $index => &$item) {
            $item['peringkat'] = $index + 1;
        }

        return $hasil;
    }

    public function preview(int $idPenyakit, array $preferensi = []): array
    {
        $kriteria = $this->buildWeightedCriteria(Kriteria::orderBy('kode')->get(), $preferensi);

        return [
            'rumus' => [
                'benefit' => 'rij = xij / max(xij)',
                'cost' => 'rij = min(xij) / xij',
                'preferensi' => 'Vi = Σ(wj * rij)',
                'bobot_preferensi' => 'w_final = (w_awal * prioritas_pengguna) / Σ(w_awal * prioritas_pengguna)',
            ],
            'kriteria' => $kriteria,
            'pupuk' => $this->hitungAlternatif('pupuk', $idPenyakit, $kriteria),
            'pestisida' => $this->hitungAlternatif('pestisida', $idPenyakit, $kriteria),
        ];
    }

    public function getPreferencePresets(): array
    {
        return [
            'seimbang' => [
                'label' => 'Seimbang',
                'description' => 'Menjaga keseimbangan antara efektivitas, biaya, dan dampak lainnya.',
                'default_score' => 3,
            ],
            'efektif' => [
                'label' => 'Efektivitas Maksimal',
                'description' => 'Cocok bila Anda ingin penanganan paling efektif walaupun biaya lebih tinggi.',
                'default_score' => 4,
            ],
            'hemat' => [
                'label' => 'Hemat Biaya',
                'description' => 'Cocok bila Anda ingin pengendalian penyakit tetap berjalan dengan biaya serendah mungkin.',
                'default_score' => 4,
            ],
            'aman' => [
                'label' => 'Aman dan Terkontrol',
                'description' => 'Memprioritaskan opsi yang lebih aman dan terkendali untuk penggunaan lapangan.',
                'default_score' => 4,
            ],
            'custom' => [
                'label' => 'Atur Sendiri',
                'description' => 'Sesuaikan prioritas setiap kriteria berdasarkan kebutuhan Anda.',
                'default_score' => 3,
            ],
        ];
    }

    private function buildWeightedCriteria(Collection $kriteria, array $preferensi = []): Collection
    {
        $preset = $preferensi['preset'] ?? 'seimbang';
        $skorKustom = $this->normalizeCriteriaPreferenceScores($preferensi['kriteria'] ?? []);

        $weighted = $kriteria->map(function ($item) use ($preset, $skorKustom) {
            $prioritas = isset($skorKustom[$item->id])
                ? max(1, min(5, (int) $skorKustom[$item->id]))
                : $this->resolvePresetPriority($item, $preset);

            return [
                'id' => $item->id,
                'kode' => $item->kode,
                'nama' => $item->nama,
                'jenis' => $item->jenis,
                'keterangan' => $item->keterangan,
                'bobot_awal' => (float) $item->bobot,
                'preferensi_user' => $prioritas,
                'bobot_final_raw' => (float) $item->bobot * $prioritas,
            ];
        });

        $totalRaw = $weighted->sum('bobot_final_raw');

        if ($totalRaw <= 0) {
            throw new RuntimeException('Bobot kriteria tidak valid. Pastikan data kriteria telah diisi dengan benar.');
        }

        return $weighted->map(function ($item) use ($totalRaw) {
            $item['bobot_final'] = round($item['bobot_final_raw'] / $totalRaw, 6);
            return $item;
        })->values();
    }

    private function normalizeCriteriaPreferenceScores(array $scores): array
    {
        $normalized = [];

        foreach ($scores as $key => $value) {
            if (is_array($value) && isset($value['id'], $value['preferensi_user'])) {
                $normalized[(int) $value['id']] = (int) $value['preferensi_user'];
                continue;
            }

            $normalized[(int) $key] = (int) $value;
        }

        return $normalized;
    }

    private function resolvePresetPriority(object $kriteria, string $preset): int
    {
        $nama = strtolower($kriteria->nama . ' ' . ($kriteria->keterangan ?? ''));

        return match ($preset) {
            'efektif' => $this->matchKeywordPriority($kriteria->jenis, $nama, [
                'harga' => 2,
                'biaya' => 2,
                'murah' => 2,
                'efektif' => 5,
                'hasil' => 5,
                'manfaat' => 5,
                'kualitas' => 5,
                'cepat' => 4,
            ], 4),
            'hemat' => $this->matchKeywordPriority($kriteria->jenis, $nama, [
                'harga' => 5,
                'biaya' => 5,
                'murah' => 5,
                'efektif' => 3,
                'hasil' => 3,
                'kualitas' => 3,
            ], $kriteria->jenis === 'cost' ? 5 : 3),
            'aman' => $this->matchKeywordPriority($kriteria->jenis, $nama, [
                'aman' => 5,
                'residu' => 5,
                'dampak' => 5,
                'risiko' => 5,
                'harga' => 3,
                'biaya' => 3,
            ], 4),
            'custom' => 3,
            default => 3,
        };
    }

    private function matchKeywordPriority(string $jenis, string $nama, array $map, int $default): int
    {
        foreach ($map as $keyword => $priority) {
            if (str_contains($nama, $keyword)) {
                return $priority;
            }
        }

        return $jenis === 'cost' && $default < 3 ? 3 : $default;
    }

    private function buildPreferenceSnapshot(Collection $kriteria, array $preferensi = []): array
    {
        $presets = $this->getPreferencePresets();
        $presetKey = $preferensi['preset'] ?? 'seimbang';

        return [
            'preset' => $presetKey,
            'preset_label' => $presets[$presetKey]['label'] ?? 'Seimbang',
            'alasan' => $preferensi['alasan'] ?? null,
            'catatan' => $preferensi['catatan'] ?? null,
            'gejala_terpilih' => $preferensi['gejala_terpilih'] ?? [],
            'kriteria' => $kriteria->map(fn($item) => [
                'id' => $item['id'],
                'kode' => $item['kode'],
                'nama' => $item['nama'],
                'jenis' => $item['jenis'],
                'bobot_awal' => $item['bobot_awal'],
                'preferensi_user' => $item['preferensi_user'],
                'bobot_final' => $item['bobot_final'],
            ])->values()->all(),
        ];
    }
}
