<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gejala;
use App\Models\Kriteria;
use App\Models\Penyakit;
use App\Models\Pupuk;
use App\Models\Pestisida;
use App\Models\RatingPestisida;
use App\Models\RatingPupuk;
use App\Models\Rekomendasi;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $totalPenyakit = Penyakit::count();
        $totalGejala = Gejala::count();
        $totalPupuk = Pupuk::count();
        $totalPestisida = Pestisida::count();
        $totalKriteria = Kriteria::count();
        $totalPetani = User::where('role', 'petani')->count();
        $totalRekomendasi = Rekomendasi::count();
        $totalAdmin = User::where('role', 'admin')->count();

        $stats = [
            'penyakit' => $totalPenyakit,
            'gejala' => $totalGejala,
            'pupuk' => $totalPupuk,
            'pestisida' => $totalPestisida,
            'kriteria' => $totalKriteria,
            'user' => $totalPetani,
            'rekomendasi' => $totalRekomendasi,
            'admin' => $totalAdmin,
        ];

        $expectedRatingPupuk = $totalPenyakit * $totalPupuk * $totalKriteria;
        $expectedRatingPestisida = $totalPenyakit * $totalPestisida * $totalKriteria;
        $ratingPupukCount = RatingPupuk::count();
        $ratingPestisidaCount = RatingPestisida::count();
        $bobotKriteriaTotal = (float) Kriteria::sum('bobot');

        $sawReadiness = [
            [
                'label' => 'Relasi penyakit & gejala',
                'value' => Penyakit::has('gejala')->count(),
                'total' => $totalPenyakit,
                'icon' => 'bi-virus',
                'route' => 'admin.penyakit.index',
                'description' => 'Jumlah penyakit yang sudah terhubung dengan gejala.',
            ],
            [
                'label' => 'Bobot kriteria',
                'value' => $bobotKriteriaTotal,
                'total' => 1.00,
                'icon' => 'bi-sliders',
                'route' => 'admin.kriteria.index',
                'description' => 'Idealnya total bobot kriteria sama dengan 1.00.',
            ],
            [
                'label' => 'Rating pupuk',
                'value' => $ratingPupukCount,
                'total' => $expectedRatingPupuk,
                'icon' => 'bi-bag-fill',
                'route' => 'admin.rating.pupuk',
                'description' => 'Kelengkapan nilai rating pupuk untuk perhitungan SAW.',
            ],
            [
                'label' => 'Rating pestisida',
                'value' => $ratingPestisidaCount,
                'total' => $expectedRatingPestisida,
                'icon' => 'bi-capsule',
                'route' => 'admin.rating.pestisida',
                'description' => 'Kelengkapan nilai rating pestisida untuk perhitungan SAW.',
            ],
        ];

        $quickActions = [
            ['title' => 'Kelola Penyakit', 'subtitle' => 'Tambah, ubah, dan hubungkan penyakit dengan gejala.', 'icon' => 'bi-virus', 'route' => 'admin.penyakit.index', 'tone' => 'danger'],
            ['title' => 'Kelola Gejala', 'subtitle' => 'Susun daftar gejala sebagai dasar identifikasi penyakit.', 'icon' => 'bi-clipboard2-pulse', 'route' => 'admin.gejala.index', 'tone' => 'primary'],
            ['title' => 'Kelola Pupuk', 'subtitle' => 'Atur data pupuk untuk rekomendasi terbaik.', 'icon' => 'bi-bag-fill', 'route' => 'admin.pupuk.index', 'tone' => 'success'],
            ['title' => 'Kelola Pestisida', 'subtitle' => 'Lengkapi data pestisida dan karakteristiknya.', 'icon' => 'bi-capsule-pill', 'route' => 'admin.pestisida.index', 'tone' => 'warning'],
            ['title' => 'Bobot Kriteria', 'subtitle' => 'Pastikan bobot SAW valid dan siap dipakai.', 'icon' => 'bi-sliders', 'route' => 'admin.kriteria.index', 'tone' => 'info'],
            ['title' => 'Rating Pupuk', 'subtitle' => 'Isi rating pupuk per penyakit dan kriteria.', 'icon' => 'bi-table', 'route' => 'admin.rating.pupuk', 'tone' => 'success'],
            ['title' => 'Rating Pestisida', 'subtitle' => 'Isi rating pestisida untuk seluruh alternatif.', 'icon' => 'bi-table', 'route' => 'admin.rating.pestisida', 'tone' => 'warning'],
            ['title' => 'Data Pengguna', 'subtitle' => 'Pantau akun petani dan reset password bila diperlukan.', 'icon' => 'bi-people', 'route' => 'admin.users.index', 'tone' => 'secondary'],
            ['title' => 'Riwayat Rekomendasi', 'subtitle' => 'Lihat dan cetak riwayat rekomendasi semua pengguna.', 'icon' => 'bi-clock-history', 'route' => 'admin.riwayat.index', 'tone' => 'dark'],
        ];

        $riwayatTerbaru = Rekomendasi::with(['user', 'penyakit'])
            ->latest()
            ->take(8)
            ->get();

        $penggunaTerbaru = User::where('role', 'petani')
            ->withCount('rekomendasi')
            ->latest()
            ->take(6)
            ->get();

        $penyakitTeratas = Penyakit::select('penyakit.id', 'penyakit.nama', DB::raw('COUNT(rekomendasi.id) as total_rekomendasi'))
            ->leftJoin('rekomendasi', 'rekomendasi.id_penyakit', '=', 'penyakit.id')
            ->groupBy('penyakit.id', 'penyakit.nama')
            ->orderByDesc('total_rekomendasi')
            ->take(5)
            ->get();

        $rekomendasiBulanIni = Rekomendasi::whereMonth('created_at', now()->month)
            ->whereYear('created_at', now()->year)
            ->count();

        $rekomendasi7Hari = Rekomendasi::where('created_at', '>=', now()->subDays(7))->count();

        $healthChecks = [
            [
                'label' => 'Data master inti',
                'status' => $totalPenyakit > 0 && $totalGejala > 0 && $totalPupuk > 0 && $totalPestisida > 0,
                'message' => 'Penyakit, gejala, pupuk, dan pestisida siap dipakai.',
                'warning' => 'Masih ada data master yang kosong.',
            ],
            [
                'label' => 'Bobot SAW',
                'status' => abs($bobotKriteriaTotal - 1) < 0.001,
                'message' => 'Total bobot kriteria sudah seimbang.',
                'warning' => 'Total bobot kriteria belum sama dengan 1.00.',
            ],
            [
                'label' => 'Input rating',
                'status' => $expectedRatingPupuk > 0
                    && $expectedRatingPestisida > 0
                    && $ratingPupukCount >= $expectedRatingPupuk
                    && $ratingPestisidaCount >= $expectedRatingPestisida,
                'message' => 'Semua rating pupuk dan pestisida sudah lengkap.',
                'warning' => 'Masih ada rating yang belum diisi lengkap.',
            ],
        ];

        return view('admin.dashboard', compact(
            'stats',
            'sawReadiness',
            'quickActions',
            'riwayatTerbaru',
            'penggunaTerbaru',
            'penyakitTeratas',
            'rekomendasiBulanIni',
            'rekomendasi7Hari',
            'healthChecks'
        ));
    }
}
