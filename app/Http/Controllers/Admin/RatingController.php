<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Kriteria;
use App\Models\Penyakit;
use App\Models\Pupuk;
use App\Models\Pestisida;
use App\Models\RatingPupuk;
use App\Models\RatingPestisida;
use Illuminate\Http\Request;

class RatingController extends Controller
{
    // ── Rating Pupuk ─────────────────────────────────────────
    public function pupuk()
    {
        $penyakit = Penyakit::orderBy('kode')->get();
        $pupuk    = Pupuk::orderBy('kode')->get();
        $kriteria = Kriteria::orderBy('kode')->get();
        $ratings  = RatingPupuk::all()->keyBy(fn($r) => "{$r->id_pupuk}_{$r->id_kriteria}_{$r->id_penyakit}");

        return view('admin.rating.pupuk', compact('penyakit', 'pupuk', 'kriteria', 'ratings'));
    }

    public function simpanPupuk(Request $request)
    {
        $request->validate([
            'rating'           => 'required|array',
            'rating.*.*.*'     => 'required|numeric|min:1|max:5',
        ]);

        // rating[id_penyakit][id_pupuk][id_kriteria] = nilai
        foreach ($request->rating as $idPenyakit => $perPupuk) {
            foreach ($perPupuk as $idPupuk => $perKriteria) {
                foreach ($perKriteria as $idKriteria => $nilai) {
                    RatingPupuk::updateOrCreate(
                        ['id_pupuk' => $idPupuk, 'id_kriteria' => $idKriteria, 'id_penyakit' => $idPenyakit],
                        ['nilai' => $nilai]
                    );
                }
            }
        }

        return redirect()->route('admin.rating.pupuk')
            ->with('success', 'Rating pupuk berhasil disimpan.');
    }

    // ── Rating Pestisida ──────────────────────────────────────
    public function pestisida()
    {
        $penyakit  = Penyakit::orderBy('kode')->get();
        $pestisida = Pestisida::orderBy('kode')->get();
        $kriteria  = Kriteria::orderBy('kode')->get();
        $ratings   = RatingPestisida::all()->keyBy(fn($r) => "{$r->id_pestisida}_{$r->id_kriteria}_{$r->id_penyakit}");

        return view('admin.rating.pestisida', compact('penyakit', 'pestisida', 'kriteria', 'ratings'));
    }

    public function simpanPestisida(Request $request)
    {
        $request->validate([
            'rating'       => 'required|array',
            'rating.*.*.*' => 'required|numeric|min:1|max:5',
        ]);

        foreach ($request->rating as $idPenyakit => $perPestisida) {
            foreach ($perPestisida as $idPestisida => $perKriteria) {
                foreach ($perKriteria as $idKriteria => $nilai) {
                    RatingPestisida::updateOrCreate(
                        ['id_pestisida' => $idPestisida, 'id_kriteria' => $idKriteria, 'id_penyakit' => $idPenyakit],
                        ['nilai' => $nilai]
                    );
                }
            }
        }

        return redirect()->route('admin.rating.pestisida')
            ->with('success', 'Rating pestisida berhasil disimpan.');
    }
}
