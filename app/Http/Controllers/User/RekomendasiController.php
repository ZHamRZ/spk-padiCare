<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Penyakit;
use App\Models\Rekomendasi;
use App\Services\RecommendationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Collection;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;

class RekomendasiController extends Controller
{
    public function __construct(private RecommendationService $recommendationService) {}

    public function show(int $id)
    {
        $rekomendasi = Rekomendasi::with([
            'penyakit',
            'detailPupuk.pupuk',
            'detailPestisida.pestisida',
        ])
            ->where('id_user', Auth::id())
            ->findOrFail($id);

        return view('user.rekomendasi.show', [
            'rekomendasi' => $rekomendasi,
            'isPreview' => false,
        ]);
    }

    public function preview()
    {
        $hasilDiagnosa = $this->buildGuestPreviewCollection();

        return view('user.rekomendasi.preview-batch', [
            'hasilDiagnosa' => $hasilDiagnosa,
            'isPreview' => true,
            'isSavedBatch' => session('guest_rekomendasi.mode') === 'saved',
        ]);
    }

    public function detail(int $id)
    {
        $rekomendasi = Rekomendasi::with([
            'penyakit',
            'detailPupuk.pupuk',
            'detailPestisida.pestisida',
        ])
            ->where('id_user', Auth::id())
            ->findOrFail($id);

        $preview = $this->recommendationService->previewForDisease($rekomendasi->id_penyakit, $rekomendasi->preferensi_pengguna ?? []);

        return view('user.rekomendasi.detail', [
            'rekomendasi' => $rekomendasi,
            'preview' => $preview,
            'isPreview' => false,
        ]);
    }

    public function previewDetail()
    {
        $hasilDiagnosa = $this->buildGuestPreviewCollection();

        if ($hasilDiagnosa->count() !== 1) {
            return redirect()
                ->route('user.rekomendasi.preview')
                ->with('info', 'Detail analisis sistem pakar ditampilkan untuk satu penyakit. Silakan pilih satu penyakit jika ingin melihat detail perhitungannya.');
        }

        $item = $hasilDiagnosa->first();

        return view('user.rekomendasi.detail', [
            'rekomendasi' => $item['rekomendasi'],
            'preview' => $item['preview'],
            'isPreview' => true,
        ]);
    }

    public function cetak(Request $request, int $id)
    {
        $rekomendasi = Rekomendasi::with([
            'penyakit.gejala:id,kode,nama_gejala,gambar',
            'user',
            'detailPupuk.pupuk',
            'detailPestisida.pestisida',
        ])
            ->where('id_user', Auth::id())
            ->findOrFail($id);

        if ($request->boolean('download')) {
            $html = view('user.rekomendasi.cetak', compact('rekomendasi'))->render();

            return response($html)
                ->header('Content-Type', 'text/html; charset=UTF-8')
                ->header('Content-Disposition', 'attachment; filename="hasil-rekomendasi-' . $rekomendasi->id . '.html"');
        }

        return view('user.rekomendasi.cetak', compact('rekomendasi'));
    }

    public function previewCetak(Request $request)
    {
        $hasilDiagnosa = $this->buildGuestPreviewCollection();

        if ($request->boolean('download')) {
            $html = view('user.rekomendasi.cetak-preview', [
                'hasilDiagnosa' => $hasilDiagnosa,
            ])->render();

            return response($html)
                ->header('Content-Type', 'text/html; charset=UTF-8')
                ->header('Content-Disposition', 'attachment; filename="hasil-rekomendasi-preview.html"');
        }

        return view('user.rekomendasi.cetak-preview', [
            'hasilDiagnosa' => $hasilDiagnosa,
        ]);
    }

    private function buildGuestPreview(): array
    {
        $payload = session('guest_rekomendasi');

        if (!$payload || empty($payload['preview'])) {
            throw new NotFoundHttpException('Preview rekomendasi tidak ditemukan. Silakan lakukan diagnosis kembali.');
        }

        $penyakitModel = Penyakit::with('gejala:id,kode,nama_gejala,gambar')->find($payload['penyakit_id']);
        $penyakit = new Penyakit([
            'id' => $payload['penyakit_id'],
            'nama' => $payload['penyakit_nama'],
            'gambar' => $penyakitModel?->gambar,
        ]);

        $rekomendasi = (object) [
            'id' => null,
            'penyakit' => $penyakit,
            'preferensi_label' => $payload['preferensi_label'] ?? null,
            'preferensi_pengguna' => $payload['preferensi_pengguna'] ?? [],
            'gejala_cocok' => $this->resolveMatchedSymptoms(
                collect($payload['preferensi_pengguna']['gejala_terpilih'] ?? []),
                $penyakitModel?->gejala ?? collect()
            ),
            'detailPupuk' => $this->buildPreviewAlternatives(collect(data_get($payload, 'preview.pupuk', [])), 'pupuk'),
            'detailPestisida' => $this->buildPreviewAlternatives(collect(data_get($payload, 'preview.pestisida', [])), 'pestisida'),
        ];

        return [$rekomendasi, $payload['preview']];
    }

    private function buildGuestPreviewCollection(): Collection
    {
        $payload = session('guest_rekomendasi');

        if (!$payload) {
            throw new NotFoundHttpException('Preview rekomendasi tidak ditemukan. Silakan lakukan diagnosis kembali.');
        }

        if (!empty($payload['items'])) {
            return collect($payload['items'])->map(function (array $item) {
                if (empty($item['preview'])) {
                    throw new NotFoundHttpException('Preview rekomendasi tidak lengkap. Silakan lakukan diagnosis kembali.');
                }

                $penyakitModel = Penyakit::with('gejala:id,kode,nama_gejala,gambar')->find($item['penyakit_id']);

                $penyakit = new Penyakit([
                    'id' => $item['penyakit_id'],
                    'nama' => $item['penyakit_nama'],
                    'gambar' => $penyakitModel?->gambar,
                ]);

                return [
                    'rekomendasi' => (object) [
                        'id' => $item['rekomendasi_id'] ?? null,
                        'penyakit' => $penyakit,
                        'preferensi_label' => $item['preferensi_label'] ?? null,
                        'preferensi_pengguna' => $item['preferensi_pengguna'] ?? [],
                        'gejala_cocok' => $this->resolveMatchedSymptoms(
                            collect($item['preferensi_pengguna']['gejala_terpilih'] ?? []),
                            $penyakitModel?->gejala ?? collect()
                        ),
                        'detailPupuk' => $this->buildPreviewAlternatives(collect(data_get($item, 'preview.pupuk', [])), 'pupuk'),
                        'detailPestisida' => $this->buildPreviewAlternatives(collect(data_get($item, 'preview.pestisida', [])), 'pestisida'),
                    ],
                    'preview' => $item['preview'],
                ];
            })->values();
        }

        [$rekomendasi, $preview] = $this->buildGuestPreview();

        return collect([[
            'rekomendasi' => $rekomendasi,
            'preview' => $preview,
        ]]);
    }

    private function resolveMatchedSymptoms(Collection $selectedSymptoms, Collection $diseaseSymptoms): array
    {
        $selectedIds = $selectedSymptoms
            ->pluck('id')
            ->map(fn($id) => (int) $id)
            ->all();

        return $diseaseSymptoms
            ->filter(fn($gejala) => in_array((int) $gejala->id, $selectedIds, true))
            ->map(fn($gejala) => [
                'id' => $gejala->id,
                'kode' => $gejala->kode,
                'nama_gejala' => $gejala->nama_gejala,
                'gambar_url' => $gejala->gambar_url,
            ])
            ->values()
            ->all();
    }

    private function buildPreviewAlternatives(Collection $items, string $type): Collection
    {
        return $items->map(function (array $item) use ($type) {
            return (object) [
                'peringkat' => $item['peringkat'],
                'nilai_vi' => $item['vi'],
                $type => (object) [
                    'kode' => $item['kode'],
                    'nama' => $item['nama'],
                    'gambar_url' => data_get($item, 'meta.gambar_url'),
                    'kandungan' => data_get($item, 'meta.kandungan'),
                    'kandungan_detail' => data_get($item, 'meta.kandungan_detail'),
                    'bahan_aktif' => data_get($item, 'meta.bahan_aktif'),
                    'fungsi_utama' => data_get($item, 'meta.fungsi_utama'),
                    'fungsi' => data_get($item, 'meta.fungsi'),
                    'takaran' => data_get($item, 'meta.takaran'),
                    'dosis' => data_get($item, 'meta.dosis'),
                    'efek_penggunaan' => data_get($item, 'meta.efek_penggunaan'),
                    'cara_aplikasi' => data_get($item, 'meta.cara_aplikasi'),
                    'jadwal_umur_aplikasi' => data_get($item, 'meta.jadwal_umur_aplikasi'),
                    'frekuensi_aplikasi' => data_get($item, 'meta.frekuensi_aplikasi'),
                    'gejala_cocok' => data_get($item, 'meta.gejala_cocok', []),
                ],
            ];
        })->values();
    }
}
