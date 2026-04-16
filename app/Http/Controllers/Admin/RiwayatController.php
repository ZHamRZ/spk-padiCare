<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Rekomendasi;
use App\Services\SAWService;

class RiwayatController extends Controller
{
    public function __construct(private SAWService $saw) {}

    public function index()
    {
        $riwayat = Rekomendasi::with(['user', 'penyakit', 'detailPupuk', 'detailPestisida'])
            ->latest()
            ->paginate(15);

        return view('admin.riwayat.index', compact('riwayat'));
    }

    public function show(int $id)
    {
        $rekomendasi = Rekomendasi::with([
            'user',
            'penyakit',
            'detailPupuk.pupuk',
            'detailPestisida.pestisida',
        ])->findOrFail($id);

        return view('admin.riwayat.show', compact('rekomendasi'));
    }

    public function detail(int $id)
    {
        $rekomendasi = Rekomendasi::with([
            'user',
            'penyakit',
            'detailPupuk.pupuk',
            'detailPestisida.pestisida',
        ])->findOrFail($id);

        $preview = $this->saw->preview($rekomendasi->id_penyakit, $rekomendasi->preferensi_pengguna ?? []);

        return view('admin.riwayat.detail', compact('rekomendasi', 'preview'));
    }
}
