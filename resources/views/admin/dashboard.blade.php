@extends('layouts.app')

@section('title', 'Dashboard Admin')
@section('page-title', 'Dashboard Admin')

@php
    $maxPenyakitTeratas = max(1, (int) ($penyakitTeratas->max('total_rekomendasi') ?? 0));
@endphp

@push('styles')
<style>
    .admin-hero {
        background:
            radial-gradient(circle at top right, rgba(245, 166, 35, .35), transparent 28%),
            linear-gradient(135deg, #123524 0%, #1e6b3c 55%, #2d8a4e 100%);
        color: #fff;
        border-radius: 20px;
        overflow: hidden;
        position: relative;
    }

    .admin-hero::after {
        content: '';
        position: absolute;
        inset: auto -60px -60px auto;
        width: 220px;
        height: 220px;
        background: rgba(255, 255, 255, .08);
        border-radius: 50%;
    }

    .dashboard-stat {
        border-radius: 18px;
        padding: 1.1rem 1.2rem;
        height: 100%;
        background: #fff;
        border: 1px solid #edf2f7;
    }

    .dashboard-stat .stat-icon {
        width: 48px;
        height: 48px;
        border-radius: 14px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 1.15rem;
    }

    .quick-card {
        border-radius: 18px;
        border: 1px solid #edf2f7;
        transition: transform .2s ease, box-shadow .2s ease;
        height: 100%;
    }

    .quick-card:hover {
        transform: translateY(-3px);
        box-shadow: 0 14px 30px rgba(15, 23, 42, .08);
    }

    .quick-icon {
        width: 52px;
        height: 52px;
        border-radius: 16px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 1.2rem;
    }

    .readiness-item {
        border: 1px solid #edf2f7;
        border-radius: 16px;
        padding: 1rem;
        background: #fff;
        height: 100%;
    }

    .progress-thin {
        height: 8px;
        border-radius: 999px;
    }

    .mini-list-item {
        border-bottom: 1px dashed #e2e8f0;
        padding: .85rem 0;
    }

    .mini-list-item:last-child {
        border-bottom: 0;
        padding-bottom: 0;
    }

    .table-dashboard td,
    .table-dashboard th {
        vertical-align: middle;
    }
</style>
@endpush

@section('content')
<div class="admin-hero p-4 p-lg-5 mb-4">
    <div class="row align-items-center g-4 position-relative">
        <div class="col-lg-8">
            <span class="badge text-bg-light text-success mb-3">Panel Admin SPK Padi</span>
            <h2 class="fw-bold mb-2">Kelola data inti, validasi bobot, dan pantau hasil rekomendasi dari satu dashboard.</h2>
            <p class="mb-4 text-white-50">
                Dashboard ini dirancang mengikuti alur sistem Anda: mulai dari data master, bobot dan rating SAW,
                sampai riwayat rekomendasi pengguna.
            </p>
            <div class="d-flex flex-wrap gap-2">
                <a href="{{ route('admin.penyakit.index') }}" class="btn btn-light fw-semibold">
                    <i class="bi bi-virus me-1"></i> Kelola Penyakit
                </a>
                <a href="{{ route('admin.kriteria.index') }}" class="btn btn-outline-light fw-semibold">
                    <i class="bi bi-sliders me-1"></i> Cek Bobot Kriteria
                </a>
                <a href="{{ route('admin.riwayat.index') }}" class="btn btn-outline-light fw-semibold">
                    <i class="bi bi-clock-history me-1"></i> Lihat Riwayat
                </a>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="bg-white bg-opacity-10 rounded-4 p-4">
                <div class="small text-white-50 mb-2">Aktivitas sistem</div>
                <div class="d-flex justify-content-between align-items-end mb-3">
                    <div>
                        <div class="fs-3 fw-bold">{{ $rekomendasi7Hari }}</div>
                        <div class="small text-white-50">rekomendasi dalam 7 hari terakhir</div>
                    </div>
                    <i class="bi bi-graph-up-arrow fs-1 text-warning"></i>
                </div>
                <div class="d-flex justify-content-between border-top border-light border-opacity-25 pt-3">
                    <div>
                        <div class="fw-semibold">{{ $rekomendasiBulanIni }}</div>
                        <div class="small text-white-50">bulan ini</div>
                    </div>
                    <div>
                        <div class="fw-semibold">{{ $stats['user'] }}</div>
                        <div class="small text-white-50">petani aktif</div>
                    </div>
                    <div>
                        <div class="fw-semibold">{{ $stats['admin'] }}</div>
                        <div class="small text-white-50">admin</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row g-3 mb-4">
    <div class="col-md-6 col-xl-3">
        <div class="dashboard-stat">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <div class="text-muted small">Data Penyakit</div>
                    <div class="fs-3 fw-bold">{{ $stats['penyakit'] }}</div>
                    <div class="small text-muted">Basis identifikasi penyakit padi</div>
                </div>
                <div class="stat-icon bg-danger-subtle text-danger"><i class="bi bi-virus"></i></div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3">
        <div class="dashboard-stat">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <div class="text-muted small">Data Gejala</div>
                    <div class="fs-3 fw-bold">{{ $stats['gejala'] }}</div>
                    <div class="small text-muted">Gejala untuk proses diagnosis</div>
                </div>
                <div class="stat-icon bg-primary-subtle text-primary"><i class="bi bi-clipboard2-pulse"></i></div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3">
        <div class="dashboard-stat">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <div class="text-muted small">Alternatif Pupuk</div>
                    <div class="fs-3 fw-bold">{{ $stats['pupuk'] }}</div>
                    <div class="small text-muted">Data alternatif pemupukan</div>
                </div>
                <div class="stat-icon bg-success-subtle text-success"><i class="bi bi-bag-fill"></i></div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3">
        <div class="dashboard-stat">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <div class="text-muted small">Alternatif Pestisida</div>
                    <div class="fs-3 fw-bold">{{ $stats['pestisida'] }}</div>
                    <div class="small text-muted">Data pengendalian penyakit</div>
                </div>
                <div class="stat-icon bg-warning-subtle text-warning"><i class="bi bi-capsule"></i></div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3">
        <div class="dashboard-stat">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <div class="text-muted small">Kriteria SAW</div>
                    <div class="fs-3 fw-bold">{{ $stats['kriteria'] }}</div>
                    <div class="small text-muted">Bobot dan jenis benefit/cost</div>
                </div>
                <div class="stat-icon bg-info-subtle text-info"><i class="bi bi-sliders"></i></div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3">
        <div class="dashboard-stat">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <div class="text-muted small">Pengguna Petani</div>
                    <div class="fs-3 fw-bold">{{ $stats['user'] }}</div>
                    <div class="small text-muted">Akun pengguna yang bisa diagnosa</div>
                </div>
                <div class="stat-icon bg-secondary-subtle text-secondary"><i class="bi bi-people"></i></div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3">
        <div class="dashboard-stat">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <div class="text-muted small">Total Rekomendasi</div>
                    <div class="fs-3 fw-bold">{{ $stats['rekomendasi'] }}</div>
                    <div class="small text-muted">Riwayat hasil perhitungan tersimpan</div>
                </div>
                <div class="stat-icon bg-dark-subtle text-dark"><i class="bi bi-clock-history"></i></div>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-xl-3">
        <div class="dashboard-stat">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <div class="text-muted small">Akun Admin</div>
                    <div class="fs-3 fw-bold">{{ $stats['admin'] }}</div>
                    <div class="small text-muted">Pengelola sistem saat ini</div>
                </div>
                <div class="stat-icon" style="background:#fef3c7;color:#92400e;"><i class="bi bi-shield-lock"></i></div>
            </div>
        </div>
    </div>
</div>

<div class="row g-4 mb-4">
    <div class="col-xl-7">
        <div class="card h-100">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span class="fw-semibold">Aksi Cepat Pengelolaan</span>
                <span class="small">Fokus pada modul inti admin</span>
            </div>
            <div class="card-body">
                <div class="row g-3">
                    @foreach($quickActions as $action)
                    <div class="col-md-6">
                        <a href="{{ route($action['route']) }}" class="text-decoration-none text-dark">
                            <div class="quick-card p-3">
                                <div class="d-flex gap-3">
                                    <div class="quick-icon bg-{{ $action['tone'] }}-subtle text-{{ $action['tone'] }}">
                                        <i class="bi {{ $action['icon'] }}"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1">{{ $action['title'] }}</h6>
                                        <p class="text-muted small mb-2">{{ $action['subtitle'] }}</p>
                                        <span class="small fw-semibold text-success">Buka modul <i class="bi bi-arrow-right-short"></i></span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-5">
        <div class="card h-100">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span class="fw-semibold">Status Kesiapan Sistem</span>
                <span class="small">Cek cepat modul SAW</span>
            </div>
            <div class="card-body">
                @foreach($healthChecks as $check)
                <div class="mini-list-item">
                    <div class="d-flex justify-content-between align-items-center mb-1">
                        <span class="fw-semibold">{{ $check['label'] }}</span>
                        <span class="badge {{ $check['status'] ? 'text-bg-success' : 'text-bg-warning' }}">
                            {{ $check['status'] ? 'Siap' : 'Perlu cek' }}
                        </span>
                    </div>
                    <div class="small text-muted">
                        {{ $check['status'] ? $check['message'] : $check['warning'] }}
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header d-flex justify-content-between align-items-center">
        <span class="fw-semibold">Kesiapan Data Perhitungan SAW</span>
        <span class="small">Validasi relasi, bobot, dan rating</span>
    </div>
    <div class="card-body">
        <div class="row g-3">
            @foreach($sawReadiness as $item)
            @php
                $isBobot = $item['label'] === 'Bobot kriteria';
                $percentage = $item['total'] > 0 ? min(100, round(($item['value'] / $item['total']) * 100)) : 0;
                $isReady = $isBobot ? abs($item['value'] - $item['total']) < 0.001 : $item['total'] > 0 && $item['value'] >= $item['total'];
            @endphp
            <div class="col-md-6 col-xl-3">
                <div class="readiness-item">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <div class="quick-icon bg-light text-success">
                            <i class="bi {{ $item['icon'] }}"></i>
                        </div>
                        <span class="badge {{ $isReady ? 'text-bg-success' : 'text-bg-warning' }}">
                            {{ $isReady ? 'Lengkap' : 'Belum lengkap' }}
                        </span>
                    </div>
                    <h6 class="fw-bold mb-1">{{ $item['label'] }}</h6>
                    <p class="small text-muted mb-3">{{ $item['description'] }}</p>
                    <div class="d-flex justify-content-between small mb-2">
                        <span class="text-muted">Progress</span>
                        <span class="fw-semibold">
                            {{ $isBobot ? number_format($item['value'], 2) . ' / 1.00' : number_format($item['value']) . ' / ' . number_format($item['total']) }}
                        </span>
                    </div>
                    <div class="progress progress-thin mb-3" role="progressbar" aria-valuenow="{{ $percentage }}" aria-valuemin="0" aria-valuemax="100">
                        <div class="progress-bar {{ $isReady ? 'bg-success' : 'bg-warning' }}" style="width: {{ $percentage }}%"></div>
                    </div>
                    <a href="{{ route($item['route']) }}" class="small fw-semibold text-success text-decoration-none">
                        Kelola sekarang <i class="bi bi-arrow-right-short"></i>
                    </a>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>

<div class="row g-4">
    <div class="col-xl-7">
        <div class="card h-100">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span class="fw-semibold">Riwayat Rekomendasi Terbaru</span>
                <a href="{{ route('admin.riwayat.index') }}" class="small text-white text-decoration-none">Lihat semua</a>
            </div>
            <div class="card-body">
                @if($riwayatTerbaru->isEmpty())
                <div class="text-center py-5 text-muted">
                    Belum ada riwayat rekomendasi yang tersimpan.
                </div>
                @else
                <div class="table-responsive">
                    <table class="table table-dashboard align-middle">
                        <thead>
                            <tr>
                                <th>Pengguna</th>
                                <th>Penyakit</th>
                                <th>Tanggal</th>
                                <th class="text-end">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($riwayatTerbaru as $item)
                            <tr>
                                <td>
                                    <div class="fw-semibold">{{ $item->user->nama ?? '-' }}</div>
                                    <div class="small text-muted">{{ $item->user->username ?? '-' }}</div>
                                </td>
                                <td>{{ $item->penyakit->nama ?? '-' }}</td>
                                <td>{{ optional($item->created_at)->format('d M Y H:i') }}</td>
                                <td class="text-end">
                                    <a href="{{ route('admin.riwayat.show', $item->id) }}" class="btn btn-sm btn-outline-success">
                                        Detail
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
    <div class="col-xl-5">
        <div class="card mb-4">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span class="fw-semibold">Penyakit Terbanyak Direkomendasikan</span>
                <span class="small">Top 5</span>
            </div>
            <div class="card-body">
                @forelse($penyakitTeratas as $item)
                @php
                    $percent = round(($item->total_rekomendasi / $maxPenyakitTeratas) * 100);
                @endphp
                <div class="mini-list-item">
                    <div class="d-flex justify-content-between mb-2">
                        <span class="fw-semibold">{{ $item->nama }}</span>
                        <span class="small text-muted">{{ $item->total_rekomendasi }} rekomendasi</span>
                    </div>
                    <div class="progress progress-thin">
                        <div class="progress-bar bg-success" style="width: {{ $percent }}%"></div>
                    </div>
                </div>
                @empty
                <div class="text-center py-4 text-muted">
                    Belum ada data distribusi rekomendasi.
                </div>
                @endforelse
            </div>
        </div>

        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <span class="fw-semibold">Pengguna Terbaru</span>
                <a href="{{ route('admin.users.index') }}" class="small text-white text-decoration-none">Kelola user</a>
            </div>
            <div class="card-body">
                @forelse($penggunaTerbaru as $user)
                <div class="mini-list-item">
                    <div class="d-flex justify-content-between align-items-start">
                        <div>
                            <div class="fw-semibold">{{ $user->nama }}</div>
                            <div class="small text-muted">{{ $user->username }}{{ $user->email ? ' • ' . $user->email : '' }}</div>
                        </div>
                        <span class="badge text-bg-light">{{ $user->rekomendasi_count }} riwayat</span>
                    </div>
                    <div class="small text-muted mt-1">Terdaftar {{ optional($user->created_at)->format('d M Y') }}</div>
                </div>
                @empty
                <div class="text-center py-4 text-muted">
                    Belum ada pengguna petani yang terdaftar.
                </div>
                @endforelse
            </div>
        </div>
    </div>
</div>
@endsection
