<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Gejala;
use App\Models\Kriteria;
use App\Models\Penyakit;
use App\Services\SAWService;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use RuntimeException;

class DiagnosisController extends Controller
{
    public function __construct(private SAWService $saw) {}

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

        $idGejalaInput = $request->gejala;
        $penyakitList = Penyakit::with('gejala')->get();

        $skorPenyakit = [];
        foreach ($penyakitList as $penyakit) {
            $idGejalaPenyakit = $penyakit->gejala->pluck('id')->toArray();
            $jumlahCocok = count(array_intersect($idGejalaInput, $idGejalaPenyakit));

            if ($jumlahCocok > 0) {
                $skorPenyakit[] = [
                    'penyakit' => $penyakit,
                    'cocok' => $jumlahCocok,
                    'total' => count($idGejalaPenyakit),
                    'persen' => round($jumlahCocok / count($idGejalaPenyakit) * 100),
                ];
            }
        }

        if (empty($skorPenyakit)) {
            return back()
                ->withInput()
                ->with('error', 'Penyakit tidak ditemukan berdasarkan gejala yang dipilih. Coba tambahkan gejala lain atau konsultasikan dengan pakar pertanian.');
        }

        usort($skorPenyakit, fn($a, $b) => $b['persen'] <=> $a['persen']);

        $gejalaInput = Gejala::whereIn('id', $idGejalaInput)->get();
        $kriteria = Kriteria::orderBy('kode')->get();
        $presetPreferensi = $this->saw->getPreferencePresets();

        return view('user.diagnosis.hasil', compact('skorPenyakit', 'gejalaInput', 'kriteria', 'presetPreferensi'));
    }

    public function proses(Request $request)
    {
        $request->validate([
            'id_penyakit' => 'required|array|min:1',
            'id_penyakit.*' => 'exists:penyakit,id',
            'gejala_terpilih' => 'required|array|min:1',
            'gejala_terpilih.*' => 'exists:gejala,id',
            'preferensi_tipe' => 'required|string|in:seimbang,efektif,hemat,aman,custom',
            'preferensi_alasan' => 'nullable|string|max:150',
            'preferensi_catatan' => 'nullable|string|max:500',
            'preferensi_kriteria' => 'nullable|array',
            'preferensi_kriteria.*' => 'nullable|integer|min:1|max:5',
        ]);

        $gejalaTerpilih = Gejala::whereIn('id', $request->input('gejala_terpilih', []))
            ->orderBy('kode')
            ->get(['id', 'kode', 'nama_gejala'])
            ->map(fn($item) => [
                'id' => $item->id,
                'kode' => $item->kode,
                'nama_gejala' => $item->nama_gejala,
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

        $presets = $this->saw->getPreferencePresets();
        $idPenyakitList = collect($request->input('id_penyakit', []))
            ->map(fn($id) => (int) $id)
            ->unique()
            ->values();

        try {
            $penyakitList = Penyakit::whereIn('id', $idPenyakitList)->get()->keyBy('id');
            $payloadItems = [];

            foreach ($idPenyakitList as $idPenyakit) {
                $penyakit = $penyakitList->get($idPenyakit);
                $preview = $this->saw->preview($idPenyakit, $preferensi);
                $rekomendasi = Auth::check()
                    ? $this->saw->hitung(Auth::id(), $idPenyakit, $preferensi)
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
