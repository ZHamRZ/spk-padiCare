<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Gejala;
use App\Models\Kriteria;
use App\Models\Penyakit;
use App\Services\DiagnosisService;
use App\Services\RecommendationService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use RuntimeException;

class DiagnosisController extends Controller
{
    public function __construct(
        private DiagnosisService $diagnosisService,
        private RecommendationService $recommendationService,
    ) {}

    public function index()
    {
        $gejala = Gejala::orderBy('kode')->get();

        return view('user.diagnosis.index', compact('gejala'));
    }

    public function identifikasi(Request $request)
    {
        $request->validate([
            'gejala' => 'required|array|min:1',
            'gejala.*' => 'exists:gejala,id',
        ], [
            'gejala.required' => 'Pilih minimal 1 gejala yang dialami tanaman.',
            'gejala.min' => 'Pilih minimal 1 gejala yang dialami tanaman.',
        ]);

        $idGejalaInput = collect($request->gejala)->map(fn ($id) => (int) $id)->all();
        $diagnosisResult = $this->diagnosisService->identify($idGejalaInput);
        $skorPenyakit = $diagnosisResult['diagnoses'];

        if (empty($skorPenyakit)) {
            return back()
                ->withInput()
                ->with('error', 'Penyakit tidak ditemukan berdasarkan gejala yang dipilih. Coba tambahkan gejala lain atau konsultasikan dengan pakar pertanian.');
        }

        session([
            'diagnosis_result' => [
                'skorPenyakit' => $skorPenyakit,
                'gejala_ids' => $idGejalaInput,
                'summary' => $diagnosisResult['summary'],
            ],
        ]);

        return redirect()->route('user.diagnosis.hasil');
    }

    public function hasilIdentifikasi()
    {
        $payload = session('diagnosis_result');

        if (!$payload) {
            return redirect()
                ->route('user.diagnosis.index')
                ->with('info', 'Silakan pilih gejala terlebih dahulu untuk melakukan identifikasi penyakit.');
        }

        $gejalaInput = Gejala::whereIn('id', $payload['gejala_ids'] ?? [])->get();
        $kriteria = Kriteria::orderBy('kode')->get();
        $presetPreferensi = $this->recommendationService->getPreferencePresets();

        return view('user.diagnosis.hasil', [
            'skorPenyakit' => $payload['skorPenyakit'] ?? [],
            'gejalaInput' => $gejalaInput,
            'kriteria' => $kriteria,
            'presetPreferensi' => $presetPreferensi,
            'diagnosisSummary' => $payload['summary'] ?? [],
        ]);
    }

    public function proses(Request $request)
    {
        $request->validate([
            'id_penyakit' => 'required|array|min:1',
            'id_penyakit.*' => 'exists:penyakit,id',
            'gejala_terpilih' => 'required|array|min:1',
            'gejala_terpilih.*' => 'exists:gejala,id',
            'preferensi_tipe' => 'required|string|in:seimbang,hemat,efisiensi,custom,efektif,aman',
            'preferensi_alasan' => 'nullable|string|max:150',
            'preferensi_catatan' => 'nullable|string|max:500',
            'preferensi_kriteria' => 'nullable|array',
            'preferensi_kriteria.*' => 'nullable|integer|min:0|max:100',
        ], [
            'id_penyakit.required' => 'Hasil identifikasi belum siap diproses. Silakan ulangi identifikasi lalu coba lihat rekomendasi lagi.',
            'id_penyakit.*.exists' => 'Penyakit hasil identifikasi tidak ditemukan. Silakan ulangi identifikasi.',
            'gejala_terpilih.required' => 'Gejala terpilih tidak ditemukan. Silakan ulangi identifikasi.',
            'preferensi_tipe.required' => 'Silakan pilih prioritas rekomendasi terlebih dahulu.',
        ]);

        if (!$request->filled('id_penyakit.0')) {
            return back()->with('error', 'Penyakit hasil identifikasi belum terbaca. Silakan ulangi identifikasi lalu coba lihat rekomendasi lagi.');
        }

        $gejalaTerpilih = Gejala::whereIn('id', $request->input('gejala_terpilih', []))
            ->orderBy('kode')
            ->get(Gejala::selectableColumns())
            ->map(fn($item) => [
                'id' => $item->id,
                'kode' => $item->kode,
                'nama_gejala' => $item->nama_gejala,
                'gambar_url' => $item->gambar_url,
            ])
            ->values()
            ->all();

        $preferensi = [
            'preset' => $request->preferensi_tipe,
            'alasan' => $request->preferensi_alasan,
            'catatan' => $request->preferensi_catatan,
            'gejala_terpilih' => $gejalaTerpilih,
            'kriteria' => $request->input('preferensi_kriteria', []),
        ];

        $presets = $this->recommendationService->getPreferencePresets();
        $idPenyakitList = collect($request->input('id_penyakit', []))
            ->map(fn($id) => (int) $id)
            ->unique()
            ->values();

        try {
            $penyakitList = Penyakit::whereIn('id', $idPenyakitList)->get()->keyBy('id');
            $payloadItems = [];

            foreach ($idPenyakitList as $idPenyakit) {
                $penyakit = $penyakitList->get($idPenyakit);
                $preview = $this->recommendationService->previewForDisease($idPenyakit, $preferensi);
                $rekomendasi = Auth::check()
                    ? $this->recommendationService->saveForUser(Auth::id(), $idPenyakit, $preferensi)
                    : null;

                $payloadItems[] = [
                    'rekomendasi_id' => $rekomendasi?->id,
                    'penyakit_id' => $penyakit->id,
                    'penyakit_nama' => $penyakit->nama,
                    'preferensi_label' => $presets[$request->preferensi_tipe]['label'] ?? Str::headline($request->preferensi_tipe),
                    'preferensi_pengguna' => [
                        'alasan' => $request->preferensi_alasan,
                        'catatan' => $request->preferensi_catatan,
                        'gejala_terpilih' => $gejalaTerpilih,
                        'kriteria' => $preferensi['kriteria'],
                    ],
                    'preview' => $preview,
                ];
            }

            session([
                'guest_rekomendasi' => [
                    'mode' => Auth::check() ? 'saved' : 'preview',
                    'items' => $payloadItems,
                ],
            ]);
        } catch (RuntimeException $e) {
            return back()->with('error', $e->getMessage());
        }

        return redirect()
            ->route('user.rekomendasi.preview')
            ->with('success', Auth::check()
                ? 'Semua rekomendasi berhasil dihitung dan disimpan ke riwayat.'
                : 'Rekomendasi berhasil dihitung. Login hanya diperlukan jika Anda ingin menyimpan hasil diagnosis.');
    }
}
