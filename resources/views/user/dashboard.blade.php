@extends('layouts.app')

@section('title', 'Beranda — PadiCare Lombok')
@section('page-title', 'Beranda')

@push('styles')
<style>
    @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&family=DM+Sans:ital,wght@0,400;0,500;0,600;1,400&display=swap');

    :root {
        --green-50:  #f0fdf4;
        --green-100: #dcfce7;
        --green-200: #bbf7d0;
        --green-500: #22c55e;
        --green-600: #16a34a;
        --green-700: #15803d;
        --green-800: #166534;
        --green-900: #14532d;
        --slate-50:  #f8fafc;
        --slate-100: #f1f5f9;
        --slate-200: #e2e8f0;
        --slate-300: #cbd5e1;
        --slate-400: #94a3b8;
        --slate-500: #64748b;
        --slate-600: #475569;
        --slate-700: #334155;
        --slate-800: #1e293b;
        --slate-900: #0f172a;
        --r-sm: 10px;
        --r-md: 16px;
        --r-lg: 20px;
        --r-xl: 26px;
        --shadow-sm: 0 1px 3px rgba(15,23,42,.06), 0 1px 2px rgba(15,23,42,.04);
        --shadow-md: 0 4px 16px rgba(15,23,42,.07), 0 1px 4px rgba(15,23,42,.04);
        --shadow-lg: 0 12px 40px rgba(15,23,42,.09);
    }

    body { font-family: 'DM Sans', sans-serif; }
    h1,h2,h3,h4,h5,.fw-bold,.fw-semibold,.fw-800 {
        font-family: 'Plus Jakarta Sans', sans-serif;
    }

    /* ── Shell ── */
    .dashboard-shell { max-width: 1280px; margin: 0 auto; }

    /* ── Topbar (guest) ── */
    .guest-topbar {
        display: flex; align-items: center;
        justify-content: space-between; gap: 1rem;
        margin-bottom: 1.5rem;
    }
    .brand-lockup { display: inline-flex; align-items: center; gap: .75rem; }
    .brand-badge {
        width: 46px; height: 46px;
        border-radius: var(--r-md);
        background: linear-gradient(135deg, var(--green-900), var(--green-700));
        color: #fff;
        display: inline-flex; align-items: center; justify-content: center;
        font-size: 1.2rem;
        box-shadow: 0 4px 12px rgba(21,128,61,.35);
    }
    .brand-name {
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-weight: 800; font-size: 16px;
        color: var(--slate-900); line-height: 1.2;
    }
    .brand-sub { font-size: 12px; color: var(--slate-400); font-weight: 500; }

    .btn-register {
        display: inline-flex; align-items: center; gap: 6px;
        padding: 9px 20px;
        border: 2px solid var(--green-200);
        border-radius: var(--r-md);
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-size: 13px; font-weight: 700;
        color: var(--green-700);
        background: var(--green-50);
        text-decoration: none;
        transition: background .2s, border-color .2s, transform .15s;
    }
    .btn-register:hover {
        background: var(--green-100);
        border-color: var(--green-400, #4ade80);
        color: var(--green-800);
        transform: translateY(-1px);
    }

    /* ── Hero ── */
    .user-hero {
        background:
            radial-gradient(ellipse at top right, rgba(245,166,35,.18) 0%, transparent 50%),
            radial-gradient(ellipse at bottom left, rgba(34,197,94,.12) 0%, transparent 50%),
            linear-gradient(135deg, #14532d 0%, #1e6b3c 55%, #2d8a4e 100%);
        color: #fff;
        border-radius: var(--r-xl);
        position: relative;
        overflow: hidden;
    }
    .user-hero::after {
        content: '';
        position: absolute;
        inset: 0;
        background-image: url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23ffffff' fill-opacity='0.03'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
        pointer-events: none;
    }
    .hero-summary-card {
        background: rgba(255,255,255,.1);
        border: 1px solid rgba(255,255,255,.15);
        border-radius: var(--r-lg);
        backdrop-filter: blur(8px);
    }
    .hero-stat-divider {
        border-top: 1px solid rgba(255,255,255,.15);
        padding-top: 14px;
        margin-top: 14px;
    }
    .hero-badge {
        display: inline-flex; align-items: center; gap: 5px;
        padding: 5px 12px;
        background: rgba(255,255,255,.15);
        border: 1px solid rgba(255,255,255,.2);
        border-radius: 100px;
        font-size: 12px; font-weight: 700;
        font-family: 'Plus Jakarta Sans', sans-serif;
        color: rgba(255,255,255,.9);
        margin-bottom: 14px;
    }
    .btn-hero-primary {
        display: inline-flex; align-items: center; gap: 7px;
        padding: 11px 22px;
        background: #fff;
        color: var(--green-800);
        border: none; border-radius: var(--r-md);
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-size: 14px; font-weight: 700;
        text-decoration: none;
        transition: background .2s, transform .15s, box-shadow .2s;
        box-shadow: 0 4px 14px rgba(0,0,0,.15);
    }
    .btn-hero-primary:hover {
        background: var(--green-50);
        color: var(--green-800);
        transform: translateY(-1px);
        box-shadow: 0 6px 20px rgba(0,0,0,.2);
    }
    .btn-hero-outline {
        display: inline-flex; align-items: center; gap: 7px;
        padding: 10px 20px;
        background: transparent;
        color: rgba(255,255,255,.85);
        border: 1.5px solid rgba(255,255,255,.35);
        border-radius: var(--r-md);
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-size: 14px; font-weight: 600;
        text-decoration: none;
        transition: background .2s, border-color .2s;
    }
    .btn-hero-outline:hover {
        background: rgba(255,255,255,.1);
        border-color: rgba(255,255,255,.6);
        color: #fff;
    }

    /* ── Metrics ── */
    .metric-card {
        background: #fff;
        border: 1px solid var(--slate-200);
        border-radius: var(--r-lg);
        padding: 20px;
        height: 100%;
        box-shadow: var(--shadow-sm);
        transition: box-shadow .2s, transform .2s;
    }
    .metric-card:hover { box-shadow: var(--shadow-md); transform: translateY(-2px); }
    .metric-icon {
        width: 44px; height: 44px;
        border-radius: var(--r-sm);
        display: inline-flex; align-items: center; justify-content: center;
        font-size: 1.1rem; flex-shrink: 0;
    }
    .metric-value {
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-size: 2rem; font-weight: 800;
        line-height: 1; color: var(--slate-900);
    }
    .metric-label { font-size: 12px; color: var(--slate-400); font-weight: 600; text-transform: uppercase; letter-spacing: .05em; }
    .metric-desc { font-size: 13px; color: var(--slate-500); margin-top: 4px; }

    /* ── Section Card ── */
    .section-card {
        background: #fff;
        border: 1px solid var(--slate-200);
        border-radius: var(--r-lg);
        box-shadow: var(--shadow-sm);
        overflow: hidden;
    }
    .section-card-header {
        padding: 16px 22px;
        border-bottom: 1px solid var(--slate-100);
        background: var(--slate-50);
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-weight: 700; font-size: 14px;
        color: var(--slate-700);
        display: flex; align-items: center; justify-content: space-between;
    }
    .section-card-body { padding: 22px; }

    /* ── Login Panel ── */
    .login-panel {
        background: #fff;
        border: 1px solid var(--slate-200);
        border-radius: var(--r-lg);
        box-shadow: var(--shadow-sm);
        overflow: hidden;
        height: 100%;
    }
    .login-panel-header {
        padding: 18px 22px 16px;
        border-bottom: 1px solid var(--slate-100);
        background: linear-gradient(135deg, var(--green-50), #f8fafc);
    }
    .login-panel-body { padding: 20px 22px; }
    .secure-chip {
        display: inline-flex; align-items: center; gap: 5px;
        padding: 4px 10px; border-radius: 100px;
        background: var(--green-100);
        border: 1px solid var(--green-200);
        font-size: 11px; font-weight: 700;
        color: var(--green-700);
        font-family: 'Plus Jakarta Sans', sans-serif;
    }
    .form-control, .form-select {
        border: 1px solid var(--slate-200);
        border-radius: var(--r-sm);
        font-family: 'DM Sans', sans-serif;
        font-size: 14px; color: var(--slate-700);
        padding: 10px 14px; background: #fff;
    }
    .form-control:focus, .form-select:focus {
        border-color: var(--green-500);
        box-shadow: 0 0 0 3px rgba(34,197,94,.12);
        outline: none;
    }
    .form-label {
        font-size: 12px; font-weight: 700;
        color: var(--slate-500);
        font-family: 'Plus Jakarta Sans', sans-serif;
        margin-bottom: 6px; letter-spacing: .03em;
        text-transform: uppercase;
    }
    .btn-login {
        width: 100%; padding: 12px;
        background: var(--green-600); color: #fff;
        border: none; border-radius: var(--r-md);
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-size: 14px; font-weight: 700;
        cursor: pointer;
        transition: background .2s, transform .15s, box-shadow .2s;
        box-shadow: 0 4px 14px rgba(22,163,74,.25);
    }
    .btn-login:hover {
        background: var(--green-700);
        transform: translateY(-1px);
        box-shadow: 0 6px 18px rgba(22,163,74,.3);
    }
    .btn-daftar {
        width: 100%; padding: 10px;
        background: transparent;
        color: var(--green-700);
        border: 2px solid var(--green-200);
        border-radius: var(--r-md);
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-size: 13px; font-weight: 700;
        cursor: pointer; text-decoration: none;
        display: block; text-align: center;
        transition: background .2s, border-color .2s;
    }
    .btn-daftar:hover {
        background: var(--green-50);
        border-color: var(--green-400, #4ade80);
        color: var(--green-800);
    }

    /* ── Case Cards ── */
    .case-card {
        background: #fff;
        border: 1px solid var(--slate-200);
        border-radius: var(--r-lg);
        overflow: hidden;
        height: 100%;
        box-shadow: var(--shadow-sm);
        transition: box-shadow .2s, transform .2s;
    }
    .case-card:hover { box-shadow: var(--shadow-lg); transform: translateY(-3px); }
    .case-media {
        width: 100%; height: 180px;
        object-fit: cover; display: block;
    }
    .case-media-empty {
        width: 100%; height: 180px;
        background: linear-gradient(135deg, var(--green-50) 0%, var(--slate-100) 100%);
        display: flex; align-items: center; justify-content: center;
        color: var(--slate-300); font-size: 2.5rem;
    }
    .case-body { padding: 16px; }
    .disease-chip {
        display: inline-flex; align-items: center; gap: 5px;
        padding: 5px 11px; border-radius: 100px;
        background: var(--green-50);
        border: 1px solid var(--green-200);
        font-size: 12px; font-weight: 700;
        color: var(--green-700);
        font-family: 'Plus Jakarta Sans', sans-serif;
        margin-bottom: 6px;
    }
    .gejala-chip {
        display: inline-flex; align-items: center;
        padding: 3px 9px; border-radius: 100px;
        background: var(--slate-50);
        border: 1px solid var(--slate-200);
        font-size: 11px; font-weight: 600;
        color: var(--slate-600);
    }
    .case-divider {
        border-top: 1px solid var(--slate-100);
        padding-top: 10px; margin-top: 10px;
    }
    .case-meta-label { font-size: 11px; color: var(--slate-400); font-weight: 600; text-transform: uppercase; letter-spacing: .04em; }
    .case-meta-value { font-size: 13px; font-weight: 700; color: var(--slate-700); font-family: 'Plus Jakarta Sans', sans-serif; margin-top: 1px; }

    /* ── Rekomendasi terakhir ── */
    .rec-item {
        display: flex; align-items: center; gap: 10px;
        padding: 10px 0;
        border-bottom: 1px solid var(--slate-100);
    }
    .rec-item:last-of-type { border-bottom: none; }
    .rec-dot {
        width: 8px; height: 8px; border-radius: 50%;
        background: var(--green-400, #4ade80); flex-shrink: 0;
    }
    .rec-key { font-size: 12px; color: var(--slate-400); font-weight: 600; }
    .rec-val { font-size: 13px; font-weight: 700; color: var(--slate-700); font-family: 'Plus Jakarta Sans', sans-serif; }

    /* ── Section eyebrow ── */
    .section-eyebrow {
        display: inline-flex; align-items: center; gap: 6px;
        font-size: 11px; font-weight: 700;
        letter-spacing: .08em; text-transform: uppercase;
        color: var(--green-700);
        background: var(--green-100);
        border: 1px solid var(--green-200);
        padding: 4px 10px; border-radius: 100px;
        margin-bottom: 12px;
    }

    /* ── Mini separator ── */
    .mini-separator {
        padding: 10px 0;
        border-bottom: 1px solid var(--slate-100);
    }
    .mini-separator:last-child { border-bottom: none; padding-bottom: 0; }

    /* ── Tips ── */
    .tip-row {
        display: flex; align-items: flex-start; gap: 10px;
        padding: 10px 0;
        border-bottom: 1px solid var(--slate-100);
    }
    .tip-row:last-child { border-bottom: none; }
    .tip-num {
        width: 22px; height: 22px; border-radius: 50%;
        background: var(--green-100); color: var(--green-700);
        font-size: 11px; font-weight: 800;
        display: flex; align-items: center; justify-content: center;
        flex-shrink: 0; margin-top: 1px;
        font-family: 'Plus Jakarta Sans', sans-serif;
    }

    /* ── Empty state ── */
    .empty-state {
        border: 1px dashed var(--slate-300);
        border-radius: var(--r-lg);
        background: var(--slate-50);
    }

    /* ── Table ── */
    .table th {
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-size: 11px; font-weight: 700;
        text-transform: uppercase; letter-spacing: .05em;
        color: var(--slate-400); background: var(--slate-50);
    }

    /* ── Btn spk override ── */
    .btn-spk-custom {
        display: inline-flex; align-items: center; gap: 7px;
        padding: 11px 24px;
        background: var(--green-600); color: #fff;
        border: none; border-radius: var(--r-md);
        font-family: 'Plus Jakarta Sans', sans-serif;
        font-size: 14px; font-weight: 700;
        text-decoration: none;
        transition: background .2s, transform .15s, box-shadow .2s;
        box-shadow: 0 4px 14px rgba(22,163,74,.25);
    }
    .btn-spk-custom:hover {
        background: var(--green-700); color: #fff;
        transform: translateY(-1px);
    }

    /* ── Fade-up anim ── */
    .anim-fade-up {
        opacity: 0; transform: translateY(16px);
        animation: fadeUp .5s ease forwards;
    }
    @keyframes fadeUp { to { opacity:1; transform:translateY(0); } }
    .anim-fade-up:nth-child(1) { animation-delay: .05s; }
    .anim-fade-up:nth-child(2) { animation-delay: .12s; }
    .anim-fade-up:nth-child(3) { animation-delay: .19s; }
    .anim-fade-up:nth-child(4) { animation-delay: .26s; }
    .anim-fade-up:nth-child(5) { animation-delay: .33s; }
</style>
@endpush

@section('content')
@guest
<div class="container py-4 py-lg-5">
    <div class="dashboard-shell">

        {{-- Flash --}}
        @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            <i class="bi bi-check-circle me-2"></i>{{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        @endif
        @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
            <i class="bi bi-exclamation-circle me-2"></i>{{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        @endif

        {{-- Topbar --}}
        <div class="guest-topbar anim-fade-up">
            <div class="brand-lockup">
                <span class="brand-badge"><i class="bi bi-leaf-fill"></i></span>
                <div>
                    <div class="brand-name">PadiCare <span style="color:var(--green-600);">Lombok</span></div>
                    <div class="brand-sub">Sistem Pakar Penyakit & Rekomendasi Pupuk Padi</div>
                </div>
            </div>
            <a href="{{ route('register') }}" class="btn-register">
                <i class="bi bi-person-plus"></i> Daftar Akun
            </a>
        </div>
@endguest

@auth
<div class="dashboard-shell">
@endauth

    {{-- ── Hero ── --}}
    <div class="user-hero p-4 p-lg-5 mb-4 anim-fade-up">
        <div class="row align-items-center g-4">
            <div class="col-lg-8">
                <div class="hero-badge">
                    <i class="bi bi-patch-check-fill"></i>
                    {{ $user ? 'Dashboard Pengguna' : 'Dashboard Publik' }}
                </div>
                <h2 class="fw-bold mb-2" style="font-size:1.75rem; line-height:1.25;">
                    {{ $user
                        ? 'Selamat datang, ' . $user->nama . '.'
                        : 'Identifikasi penyakit padi & dapatkan rekomendasi pupuk secara instan.' }}
                </h2>
                <p style="color:rgba(255,255,255,.65); font-size:14px; max-width:520px; line-height:1.7;" class="mb-4">
                    {{ $user
                        ? 'Gunakan dashboard ini untuk memulai diagnosis, melihat hasil rekomendasi, dan membandingkan kasus yang pernah terjadi.'
                        : 'Pilih gejala tanaman Anda, sistem pakar akan mencocokkan penyakit dan merekomendasikan pupuk serta pestisida yang tepat.' }}
                </p>
                <div class="d-flex flex-wrap gap-2">
                    <a href="{{ route('user.diagnosis.index') }}" class="btn-hero-primary">
                        <i class="bi bi-search-heart"></i>
                        {{ $user ? 'Mulai Diagnosis' : 'Mulai Diagnosis Sekarang' }}
                    </a>
                    <a href="#riwayat-kasus" class="btn-hero-outline">
                        <i class="bi bi-clock-history"></i> Lihat Riwayat Kasus
                    </a>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="hero-summary-card p-4">
                    <div style="font-size:11px; font-weight:700; letter-spacing:.06em; text-transform:uppercase; color:rgba(255,255,255,.5); margin-bottom:12px;">
                        {{ $user ? 'Ringkasan Akun' : 'Ringkasan Sistem' }}
                    </div>
                    @if($user)
                    <div class="mb-3">
                        <div style="font-family:'Plus Jakarta Sans',sans-serif; font-weight:700; font-size:16px; color:#fff;">{{ $user->nama }}</div>
                        <div style="font-size:12px; color:rgba(255,255,255,.5);">{{ $user->no_telp ?: 'Nomor HP belum diisi' }}</div>
                    </div>
                    <div class="hero-stat-divider d-flex justify-content-between">
                        <div style="text-align:center;">
                            <div style="font-family:'Plus Jakarta Sans',sans-serif; font-weight:800; font-size:20px; color:#fff;">{{ $rekomendasi7Hari }}</div>
                            <div style="font-size:11px; color:rgba(255,255,255,.5);">7 hari</div>
                        </div>
                        <div style="text-align:center;">
                            <div style="font-family:'Plus Jakarta Sans',sans-serif; font-weight:800; font-size:20px; color:#fff;">{{ $rekomendasiBulanIni }}</div>
                            <div style="font-size:11px; color:rgba(255,255,255,.5);">Bulan ini</div>
                        </div>
                        <div style="text-align:center;">
                            <div style="font-family:'Plus Jakarta Sans',sans-serif; font-weight:800; font-size:20px; color:#fff;">{{ $totalRekomendasi }}</div>
                            <div style="font-size:11px; color:rgba(255,255,255,.5);">Total</div>
                        </div>
                    </div>
                    @else
                    <div style="display:flex; flex-direction:column; gap:12px;">
                        @foreach([['penyakit','penyakit','Sudah terdokumentasi di sistem'],['gejala','gejala','Bisa dipakai untuk identifikasi'],['riwayat','riwayat kasus','Bisa jadi referensi cepat petani']] as [$key,$label,$sub])
                        <div style="display:flex; justify-content:space-between; align-items:center; padding-bottom:12px; border-bottom:1px solid rgba(255,255,255,.1);">
                            <div>
                                <div style="font-family:'Plus Jakarta Sans',sans-serif; font-weight:700; font-size:15px; color:#fff;">{{ $progress[$key] }} {{ $label }}</div>
                                <div style="font-size:12px; color:rgba(255,255,255,.5);">{{ $sub }}</div>
                            </div>
                            <i class="bi bi-check-circle-fill" style="color:rgba(255,255,255,.25); font-size:1.1rem;"></i>
                        </div>
                        @endforeach
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>

    {{-- ── Metrics ── --}}
    <div class="row g-3 mb-4">
        @php
        $metrics = [
            [
                'label' => $user ? 'Total Rekomendasi' : 'Total Riwayat Kasus',
                'value' => $user ? $totalRekomendasi : $progress['riwayat'],
                'desc'  => $user ? 'Semua hasil yang pernah disimpan' : 'Kasus lama sebagai referensi',
                'icon'  => 'bi-award-fill',
                'bg'    => 'var(--green-100)',
                'color' => 'var(--green-700)',
            ],
            [
                'label' => $user ? 'Aktivitas Bulan Ini' : 'Kasus Paling Dicari',
                'value' => $user ? $rekomendasiBulanIni : $riwayatReferensi->count(),
                'desc'  => $user ? 'Rekomendasi bulan ini' : 'Relevan berdasarkan pencarian',
                'icon'  => 'bi-calendar-check-fill',
                'bg'    => 'var(--green-100)',
                'color' => 'var(--green-600)',
            ],
            [
                'label' => 'Gejala Tersedia',
                'value' => $progress['gejala'],
                'desc'  => 'Bahan identifikasi penyakit',
                'icon'  => 'bi-clipboard2-pulse-fill',
                'bg'    => 'var(--slate-100)',
                'color' => 'var(--slate-500)',
            ],
            [
                'label' => 'Penyakit Terdata',
                'value' => $progress['penyakit'],
                'desc'  => 'Kemungkinan hasil identifikasi',
                'icon'  => 'bi-virus2',
                'bg'    => 'var(--slate-100)',
                'color' => 'var(--slate-400)',
            ],
        ];
        @endphp
        @foreach($metrics as $m)
        <div class="col-md-6 col-xl-3 anim-fade-up">
            <div class="metric-card">
                <div class="metric-label mb-2">{{ $m['label'] }}</div>
                <div class="d-flex align-items-center justify-content-between">
                    <div class="metric-value">{{ $m['value'] }}</div>
                    <div class="metric-icon" style="background:{{ $m['bg'] }}; color:{{ $m['color'] }};">
                        <i class="bi {{ $m['icon'] }}"></i>
                    </div>
                </div>
                <div class="metric-desc">{{ $m['desc'] }}</div>
            </div>
        </div>
        @endforeach
    </div>

    @guest
    <div class="row g-4 mb-4">
        <div class="col-xl-6 col-lg-8 mx-auto anim-fade-up">
            <div class="login-panel" id="login">
                <div class="login-panel-header">
                    <div class="d-flex align-items-start justify-content-between">
                        <div>
                            <div class="section-eyebrow" style="margin-bottom:6px;"><i class="bi bi-person-circle"></i> Login Pengguna</div>
                            <div style="font-size:13px; color:var(--slate-500);">Masuk langsung dari dashboard tanpa pindah halaman.</div>
                        </div>
                        <span class="secure-chip"><i class="bi bi-shield-check"></i> Aman</span>
                    </div>
                </div>
                <div class="login-panel-body">
                    <form action="{{ route('login.post') }}" method="POST">
                        @csrf
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" value="{{ old('username') }}"
                                class="form-control @error('username') is-invalid @enderror"
                                placeholder="Masukkan username">
                            @error('username')<div class="invalid-feedback">{{ $message }}</div>@enderror
                        </div>
                        <div class="mb-4">
                            <label class="form-label">Password</label>
                            <input type="password" name="password"
                                class="form-control @error('password') is-invalid @enderror"
                                placeholder="Masukkan password">
                            @error('password')<div class="invalid-feedback">{{ $message }}</div>@enderror
                        </div>
                        <div style="display:flex; flex-direction:column; gap:10px;">
                            <button type="submit" class="btn-login">
                                <i class="bi bi-box-arrow-in-right me-1"></i> Masuk
                            </button>
                            <a href="{{ route('register') }}" class="btn-daftar">Belum punya akun? Daftar</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @endguest

    {{-- ── Riwayat Kasus ── --}}
    <div class="d-flex align-items-end justify-content-between mb-3 flex-wrap gap-2 anim-fade-up" id="riwayat-kasus">
        <div>
            <div class="section-eyebrow"><i class="bi bi-collection-fill"></i> Referensi Publik</div>
            <h4 class="fw-bold mb-1" style="color:var(--slate-900);">Riwayat Kasus Lama</h4>
            <p style="font-size:13px; color:var(--slate-400); max-width:580px; margin:0; line-height:1.6;">
                Kasus paling relevan dan sering dicari — petani bisa menemukan acuan yang mirip lebih cepat.
            </p>
        </div>
    </div>

    @if($riwayatReferensi->isEmpty())
    <div class="empty-state text-center py-5 px-4 mb-4 anim-fade-up">
        <i class="bi bi-inbox fs-1 d-block mb-3" style="color:var(--slate-300);"></i>
        <div style="font-family:'Plus Jakarta Sans',sans-serif; font-weight:700; color:var(--slate-600);">Belum ada riwayat kasus</div>
        <div style="font-size:13px; color:var(--slate-400); margin-top:4px;">Setelah pengguna melakukan diagnosis, hasilnya akan tampil di sini.</div>
    </div>
    @else
    <div class="row g-3 mb-4">
        @foreach($riwayatReferensi as $riwayat)
        <div class="col-md-6 col-xl-4 anim-fade-up">
            <div class="case-card">
                @if(optional($riwayat->penyakit)->gambar_url)
                <img src="{{ $riwayat->penyakit->gambar_url }}" alt="{{ $riwayat->penyakit->nama }}" class="case-media">
                @else
                <div class="case-media-empty"><i class="bi bi-virus"></i></div>
                @endif

                <div class="case-body">
                    <div class="d-flex align-items-start justify-content-between gap-2 mb-3">
                        <div>
                            <div class="disease-chip">
                                <i class="bi bi-bug-fill"></i>
                                {{ $riwayat->penyakit->nama ?? 'Belum diketahui' }}
                            </div>
                            <div style="font-size:12px; color:var(--slate-400);">
                                {{ optional($riwayat->created_at)->format('d M Y') }}
                            </div>
                        </div>
                        <div style="font-size:12px; font-weight:700; color:var(--green-600); font-family:'Plus Jakarta Sans',sans-serif; white-space:nowrap;">
                            {{ number_format($riwayat->total_dicari ?? 0) }}× dicari
                        </div>
                    </div>

                    <div style="font-size:11px; font-weight:700; color:var(--slate-400); text-transform:uppercase; letter-spacing:.05em; margin-bottom:7px;">
                        Gejala terkait
                    </div>
                    <div class="d-flex flex-wrap gap-1 mb-3">
                        @php $gejalaList = collect(optional($riwayat->penyakit)->gejala); @endphp
                        @foreach($gejalaList->take(3) as $gejala)
<span class="gejala-chip">{{ $gejala->nama_gejala }}</span>
@endforeach
@if($gejalaList->count() > 3)
<span class="gejala-chip" style="background:var(--green-50); color:var(--green-700); border-color:var(--green-200);">
    +{{ $gejalaList->count() - 3 }} lainnya
</span>
@endif                               {{-- ← diganti endif --}}
@if($gejalaList->isEmpty())
<span style="font-size:12px; color:var(--slate-400);">Belum dicatat</span>
@endif
                    </div>

                    <div class="case-divider">
                        <div class="case-meta-label">Pupuk direkomendasikan</div>
                        <div class="case-meta-value">{{ optional(optional($riwayat->detailPupuk->first())->pupuk)->nama ?: '—' }}</div>
                    </div>
                    <div class="case-divider">
                        <div class="case-meta-label">Pestisida direkomendasikan</div>
                        <div class="case-meta-value">{{ optional(optional($riwayat->detailPestisida->first())->pestisida)->nama ?: '—' }}</div>
                    </div>

                    <div style="font-size:11px; color:var(--slate-400); margin-top:12px; line-height:1.5; font-style:italic;">
                        Gunakan sebagai acuan awal — tetap lakukan diagnosis pada tanaman Anda untuk hasil yang lebih tepat.
                    </div>
                </div>
            </div>
        </div>
        @endforeach
    </div>
    @endif

    {{-- ── Auth-only section ── --}}
    @auth
    <div class="row g-4">
        <div class="col-xl-7 anim-fade-up">
            <div class="section-card h-100">
                <div class="section-card-header">
                    Riwayat Terbaru Saya
                    <a href="{{ route('user.riwayat.index') }}" style="font-size:12px; font-weight:700; color:var(--green-600); text-decoration:none;">Lihat semua →</a>
                </div>
                <div class="section-card-body p-0">
                    @if($riwayatTerbaru->isEmpty())
                    <div class="text-center py-5" style="color:var(--slate-400); font-size:13px;">
                        Belum ada riwayat. Mulai diagnosis untuk membuat rekomendasi pertama.
                    </div>
                    @else
                    <div class="table-responsive">
                        <table class="table table-hover mb-0 align-middle">
                            <thead>
                                <tr>
                                    <th>Tanggal</th>
                                    <th>Penyakit</th>
                                    <th>Top Pupuk</th>
                                    <th>Top Pestisida</th>
                                    <th class="text-end">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($riwayatTerbaru as $r)
                                <tr>
                                    <td style="font-size:13px; color:var(--slate-500);">{{ optional($r->created_at)->format('d M Y') }}</td>
                                    <td>
                                        <span style="background:var(--green-100); color:var(--green-700); padding:3px 9px; border-radius:100px; font-size:12px; font-weight:700; font-family:'Plus Jakarta Sans',sans-serif;">
                                            {{ $r->penyakit->nama ?? '-' }}
                                        </span>
                                    </td>
                                    <td style="font-size:13px; color:var(--slate-600);">{{ optional(optional($r->detailPupuk->first())->pupuk)->nama ?: '-' }}</td>
                                    <td style="font-size:13px; color:var(--slate-600);">{{ optional(optional($r->detailPestisida->first())->pestisida)->nama ?: '-' }}</td>
                                    <td class="text-end">
                                        <a href="{{ route('user.rekomendasi.show', $r->id) }}"
                                           style="font-size:12px; font-weight:700; color:var(--green-600); text-decoration:none;">
                                            Lihat →
                                        </a>
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                    @endif
                </div>
            </div>
        </div>

        <div class="col-xl-5 anim-fade-up">
            <div class="section-card mb-3">
                <div class="section-card-header">Rekomendasi Terakhir</div>
                <div class="section-card-body">
                    @if(!$rekomendasiTerakhir)
                    <div style="font-size:13px; color:var(--slate-400);">Belum ada rekomendasi yang tersimpan.</div>
                    @else
                    <div class="rec-item">
                        <div class="rec-dot"></div>
                        <div><div class="rec-key">Penyakit</div><div class="rec-val">{{ $penyakitTerakhir->nama ?? '-' }}</div></div>
                    </div>
                    <div class="rec-item">
                        <div class="rec-dot"></div>
                        <div><div class="rec-key">Tanggal</div><div class="rec-val">{{ optional($rekomendasiTerakhir->created_at)->format('d M Y H:i') }}</div></div>
                    </div>
                    <div class="rec-item">
                        <div class="rec-dot"></div>
                        <div><div class="rec-key">Pupuk terbaik</div><div class="rec-val">{{ optional(optional($rekomendasiTerakhir->detailPupuk->first())->pupuk)->nama ?: '-' }}</div></div>
                    </div>
                    <div class="rec-item" style="margin-bottom:16px;">
                        <div class="rec-dot"></div>
                        <div><div class="rec-key">Pestisida terbaik</div><div class="rec-val">{{ optional(optional($rekomendasiTerakhir->detailPestisida->first())->pestisida)->nama ?: '-' }}</div></div>
                    </div>
                    <a href="{{ route('user.rekomendasi.show', $rekomendasiTerakhir->id) }}" class="btn-spk-custom">
                        <i class="bi bi-arrow-right-circle-fill"></i> Buka Hasil Terakhir
                    </a>
                    @endif
                </div>
            </div>
        </div>
    </div>
    @endauth

@auth
</div>
@endauth

@guest
    </div>
</div>
@endguest
@endsection
