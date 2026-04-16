@extends('layouts.app')

@section('title', 'Beranda Petani')
@section('page-title', 'Beranda')

@push('styles')
<style>
    .dashboard-shell {
        max-width: 1280px;
        margin: 0 auto;
    }

    .guest-topbar {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 1rem;
        margin-bottom: 1.5rem;
    }

    .guest-brand {
        display: inline-flex;
        align-items: center;
        gap: .75rem;
    }

    .guest-brand-badge {
        width: 52px;
        height: 52px;
        border-radius: 16px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background: linear-gradient(135deg, #14532d, #2d8a4e);
        color: #fff;
        font-size: 1.35rem;
    }

    .user-hero {
        background:
            radial-gradient(circle at top right, rgba(245, 166, 35, .22), transparent 26%),
            linear-gradient(135deg, #14532d 0%, #1e6b3c 55%, #2d8a4e 100%);
        color: #fff;
        border-radius: 24px;
    }

    .user-metric {
        border: 1px solid #edf2f7;
        border-radius: 18px;
        padding: 1.1rem 1.2rem;
        height: 100%;
        background: #fff;
    }

    .user-metric-icon {
        width: 48px;
        height: 48px;
        border-radius: 14px;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 1.15rem;
    }

    .action-panel,
    .case-card,
    .login-panel {
        border: 1px solid #edf2f7;
        border-radius: 18px;
        background: #fff;
        transition: transform .2s ease, box-shadow .2s ease;
    }

    .action-panel:hover,
    .case-card:hover,
    .login-panel:hover {
        transform: translateY(-3px);
        box-shadow: 0 12px 24px rgba(15, 23, 42, .08);
    }

    .mini-separator {
        border-bottom: 1px dashed #e2e8f0;
        padding: .9rem 0;
    }

    .mini-separator:last-child {
        border-bottom: 0;
        padding-bottom: 0;
    }

    .soft-chip {
        display: inline-flex;
        align-items: center;
        gap: .35rem;
        padding: .35rem .7rem;
        border-radius: 999px;
        background: #f0fdf4;
        color: #166534;
        font-size: .8rem;
        font-weight: 600;
    }

    .case-card {
        padding: 1.15rem;
        height: 100%;
    }

    .section-intro {
        max-width: 760px;
    }

    .empty-state {
        border: 1px dashed #cbd5e1;
        border-radius: 18px;
        background: #fff;
    }
</style>
@endpush

@section('content')
@guest
<div class="container py-4 py-lg-5">
    <div class="dashboard-shell">
        @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <i class="bi bi-check-circle me-2"></i>{{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        @endif
        @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <i class="bi bi-exclamation-circle me-2"></i>{{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        @endif
        <div class="guest-topbar">
            <div class="guest-brand">
                <span class="guest-brand-badge"><i class="bi bi-leaf-fill"></i></span>
                <div>
                    <div class="fw-bold">SPK Pupuk & Pestisida Padi</div>
                    <div class="text-muted small">Beranda langsung menampilkan dashboard dan riwayat kasus.</div>
                </div>
            </div>
            <a href="{{ route('register') }}" class="btn btn-outline-success">Daftar Akun</a>
        </div>
@endguest

@auth
<div class="dashboard-shell">
@endauth
    <div class="user-hero p-4 p-lg-5 mb-4">
        <div class="row align-items-center g-4">
            <div class="col-lg-8">
                <span class="badge text-bg-light text-success mb-3">{{ $user ? 'Dashboard Pengguna' : 'Dashboard Publik' }}</span>
                <h2 class="fw-bold mb-2">
                    {{ $user ? 'Selamat datang, ' . $user->nama . '.' : 'Website langsung terbuka ke dashboard utama.' }}
                </h2>
                <p class="text-white-50 mb-4">
                    {{ $user
                        ? 'Gunakan dashboard ini untuk memulai diagnosis, melihat hasil rekomendasi, dan membandingkan kasus yang pernah terjadi.'
                        : 'Pengguna baru bisa melihat ringkasan kasus lama lebih dulu, lalu login dari halaman ini saat ingin menyimpan hasil diagnosis sendiri.' }}
                </p>
                <div class="d-flex flex-wrap gap-2">
                    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-light fw-semibold">
                        <i class="bi bi-search-heart me-1"></i> {{ $user ? 'Mulai Diagnosis' : 'Mulai Diagnosis Sekarang' }}
                    </a>
                    <a href="#riwayat-kasus" class="btn btn-outline-light fw-semibold">
                        <i class="bi bi-clock-history me-1"></i> Lihat Riwayat Kasus
                    </a>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="bg-white bg-opacity-10 rounded-4 p-4 h-100">
                    <div class="small text-white-50 mb-2">{{ $user ? 'Ringkasan akun' : 'Ringkasan sistem' }}</div>
                    @if($user)
                    <div class="mb-3">
                        <div class="fw-semibold">{{ $user->username }}</div>
                        <div class="small text-white-50">{{ $user->email ?: 'Email belum diisi' }}</div>
                    </div>
                    <div class="d-flex justify-content-between border-top border-light border-opacity-25 pt-3">
                        <div>
                            <div class="fw-semibold">{{ $rekomendasi7Hari }}</div>
                            <div class="small text-white-50">7 hari</div>
                        </div>
                        <div>
                            <div class="fw-semibold">{{ $rekomendasiBulanIni }}</div>
                            <div class="small text-white-50">bulan ini</div>
                        </div>
                        <div>
                            <div class="fw-semibold">{{ $totalRekomendasi }}</div>
                            <div class="small text-white-50">total</div>
                        </div>
                    </div>
                    @else
                    <div class="mini-separator border-light border-opacity-25">
                        <div class="fw-semibold">{{ $progress['penyakit'] }} penyakit</div>
                        <div class="small text-white-50">Sudah terdokumentasi di sistem</div>
                    </div>
                    <div class="mini-separator border-light border-opacity-25">
                        <div class="fw-semibold">{{ $progress['gejala'] }} gejala</div>
                        <div class="small text-white-50">Bisa dipakai untuk identifikasi</div>
                    </div>
                    <div class="pt-3">
                        <div class="fw-semibold">{{ $progress['riwayat'] }} riwayat kasus</div>
                        <div class="small text-white-50">Bisa jadi referensi cepat untuk petani</div>
                    </div>
                    @endif
                </div>
            </div>
        </div>
    </div>

    <div class="row g-3 mb-4">
        <div class="col-md-6 col-xl-3">
            <div class="user-metric">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <div class="text-muted small">{{ $user ? 'Total Rekomendasi Saya' : 'Total Riwayat Kasus' }}</div>
                        <div class="fs-3 fw-bold">{{ $user ? $totalRekomendasi : $progress['riwayat'] }}</div>
                        <div class="small text-muted">{{ $user ? 'Semua hasil yang pernah disimpan' : 'Kasus lama yang bisa dijadikan referensi' }}</div>
                    </div>
                    <div class="user-metric-icon bg-success-subtle text-success"><i class="bi bi-award"></i></div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-xl-3">
            <div class="user-metric">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <div class="text-muted small">{{ $user ? 'Aktivitas Bulan Ini' : 'Kasus Paling Dicari' }}</div>
                        <div class="fs-3 fw-bold">{{ $user ? $rekomendasiBulanIni : $riwayatReferensi->count() }}</div>
                        <div class="small text-muted">{{ $user ? 'Rekomendasi yang dibuat bulan ini' : 'Kasus relevan berdasarkan riwayat pencarian pengguna' }}</div>
                    </div>
                    <div class="user-metric-icon bg-primary-subtle text-primary"><i class="bi bi-calendar-week"></i></div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-xl-3">
            <div class="user-metric">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <div class="text-muted small">Gejala Tersedia</div>
                        <div class="fs-3 fw-bold">{{ $progress['gejala'] }}</div>
                        <div class="small text-muted">Bahan identifikasi penyakit</div>
                    </div>
                    <div class="user-metric-icon bg-warning-subtle text-warning"><i class="bi bi-clipboard2-pulse"></i></div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-xl-3">
            <div class="user-metric">
                <div class="d-flex justify-content-between align-items-start">
                    <div>
                        <div class="text-muted small">Penyakit Terdata</div>
                        <div class="fs-3 fw-bold">{{ $progress['penyakit'] }}</div>
                        <div class="small text-muted">Kemungkinan hasil identifikasi</div>
                    </div>
                    <div class="user-metric-icon bg-danger-subtle text-danger"><i class="bi bi-virus"></i></div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4 mb-4">
        <div class="col-xl-{{ $user ? '8' : '7' }}">
            <div class="card h-100">
                <div class="card-header">{{ $user ? 'Aksi Cepat Pengguna' : 'Cara Cepat Menggunakan Sistem' }}</div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <a href="{{ route('user.diagnosis.index') }}" class="action-panel p-4 d-block text-decoration-none text-dark h-100">
                                <div class="d-flex align-items-start gap-3">
                                    <div class="user-metric-icon bg-success-subtle text-success"><i class="bi bi-search-heart"></i></div>
                                    <div>
                                        <h5 class="fw-bold mb-1">{{ $user ? 'Mulai Diagnosis' : 'Diagnosis Tanpa Login' }}</h5>
                                        <p class="text-muted small mb-0">Pilih gejala tanaman, identifikasi penyakit, lalu lihat rekomendasi pupuk dan pestisida secara langsung tanpa harus login.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="col-md-6">
                            <a href="#riwayat-kasus" class="action-panel p-4 d-block text-decoration-none text-dark h-100">
                                <div class="d-flex align-items-start gap-3">
                                    <div class="user-metric-icon bg-secondary-subtle text-secondary"><i class="bi bi-clock-history"></i></div>
                                    <div>
                                        <h5 class="fw-bold mb-1">Lihat Riwayat Kasus</h5>
                                        <p class="text-muted small mb-0">Buka contoh kasus lama lebih dulu agar pengguna dapat menemukan gejala atau solusi yang mirip dengan cepat.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        @if($user)
                        <div class="col-md-6">
                            <a href="{{ route('user.riwayat.index') }}" class="action-panel p-4 d-block text-decoration-none text-dark h-100">
                                <div class="d-flex align-items-start gap-3">
                                    <div class="user-metric-icon bg-warning-subtle text-warning"><i class="bi bi-journal-text"></i></div>
                                    <div>
                                        <h5 class="fw-bold mb-1">Riwayat Saya</h5>
                                        <p class="text-muted small mb-0">Tinjau kembali hasil yang pernah Anda simpan dan cetak saat diperlukan.</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                        @endif
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-{{ $user ? '4' : '5' }}">
            @guest
            <div class="login-panel p-4 h-100" id="login">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                        <h5 class="fw-bold mb-1">Login Pengguna</h5>
                        <div class="text-muted small">Masuk langsung dari dashboard tanpa pindah ke halaman lain.</div>
                    </div>
                    <span class="soft-chip"><i class="bi bi-shield-check"></i> Aman</span>
                </div>
                <form action="{{ route('login.post') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" value="{{ old('username') }}" class="form-control @error('username') is-invalid @enderror" placeholder="Masukkan username">
                        @error('username')<div class="invalid-feedback">{{ $message }}</div>@enderror
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input type="password" name="password" class="form-control @error('password') is-invalid @enderror" placeholder="Masukkan password">
                        @error('password')<div class="invalid-feedback">{{ $message }}</div>@enderror
                    </div>
                    <div class="form-check mb-3">
                        <input class="form-check-input" type="checkbox" name="remember" value="1" id="remember">
                        <label class="form-check-label" for="remember">Tetap ingat saya</label>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-spk">Masuk</button>
                        <a href="{{ route('register') }}" class="btn btn-outline-success">Belum punya akun? Daftar</a>
                    </div>
                </form>
            </div>
            @else
            <div class="card h-100">
                <div class="card-header">Tips Penggunaan</div>
                <div class="card-body">
                    @foreach($tips as $tip)
                    <div class="mini-separator">
                        <div class="d-flex gap-2">
                            <i class="bi bi-check-circle-fill text-success"></i>
                            <div class="small text-muted">{{ $tip }}</div>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
            @endguest
        </div>
    </div>

    <div class="mb-3" id="riwayat-kasus">
        <h4 class="fw-bold mb-2">Riwayat Kasus Lama</h4>
        <p class="text-muted section-intro mb-0">
            Kasus yang ditampilkan di bawah ini adalah kasus yang paling relevan dan paling sering dicari pengguna, sehingga petani bisa lebih cepat menemukan acuan yang mirip.
        </p>
    </div>

    @if($riwayatReferensi->isEmpty())
    <div class="empty-state text-center py-5 px-4 mb-4">
        <div class="fw-semibold mb-1">Belum ada riwayat kasus yang tersimpan.</div>
        <div class="text-muted small">Setelah pengguna melakukan diagnosis, hasilnya akan tampil di sini sebagai referensi.</div>
    </div>
    @else
    <div class="row g-3 mb-4">
        @foreach($riwayatReferensi as $riwayat)
        <div class="col-md-6 col-xl-4">
            <div class="case-card">
                <div class="d-flex justify-content-between align-items-start gap-3 mb-3">
                    <div>
                        <div class="soft-chip mb-2"><i class="bi bi-virus"></i> {{ $riwayat->penyakit->nama ?? 'Belum diketahui' }}</div>
                        <div class="small text-muted">Dicatat {{ optional($riwayat->created_at)->format('d M Y H:i') }}</div>
                        <div class="small text-success fw-semibold mt-1">{{ number_format($riwayat->total_dicari ?? 0) }} kali dicari pengguna</div>
                    </div>
                    <span class="badge text-bg-light">Kasus lama</span>
                </div>

                <div class="mb-3">
                    <div class="small text-muted mb-2">Gejala yang sering terkait</div>
                    <div class="d-flex flex-wrap gap-2">
                        @forelse(collect(optional($riwayat->penyakit)->gejala)->take(4) as $gejala)
                        <span class="badge rounded-pill bg-success-subtle text-success border">{{ $gejala->nama_gejala }}</span>
                        @empty
                        <span class="small text-muted">Gejala belum dicatat.</span>
                        @endforelse
                    </div>
                </div>

                <div class="mini-separator">
                    <div class="small text-muted">Pupuk yang pernah direkomendasikan</div>
                    <div class="fw-semibold">{{ optional(optional($riwayat->detailPupuk->first())->pupuk)->nama ?: '-' }}</div>
                </div>
                <div class="mini-separator">
                    <div class="small text-muted">Pestisida yang pernah direkomendasikan</div>
                    <div class="fw-semibold">{{ optional(optional($riwayat->detailPestisida->first())->pestisida)->nama ?: '-' }}</div>
                </div>
                <div class="pt-3 small text-muted">
                    Gunakan ini sebagai acuan awal. Untuk hasil yang lebih tepat, tetap lakukan diagnosis pada tanaman Anda.
                </div>
            </div>
        </div>
        @endforeach
    </div>
    @endif

    @auth
    <div class="row g-4">
        <div class="col-xl-7">
            <div class="card h-100">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span>Riwayat Terbaru Saya</span>
                    <a href="{{ route('user.riwayat.index') }}" class="text-white text-decoration-none small">Lihat semua</a>
                </div>
                <div class="card-body p-0">
                    @if($riwayatTerbaru->isEmpty())
                    <div class="text-center py-5 text-muted">Belum ada riwayat rekomendasi. Mulai diagnosis untuk membuat rekomendasi pertama.</div>
                    @else
                    <div class="table-responsive">
                        <table class="table table-hover mb-0 align-middle">
                            <thead class="table-light">
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
                                    <td class="small">{{ optional($r->created_at)->format('d M Y H:i') }}</td>
                                    <td><span class="badge bg-success">{{ $r->penyakit->nama ?? '-' }}</span></td>
                                    <td>{{ optional(optional($r->detailPupuk->first())->pupuk)->nama ?: '-' }}</td>
                                    <td>{{ optional(optional($r->detailPestisida->first())->pestisida)->nama ?: '-' }}</td>
                                    <td class="text-end">
                                        <a href="{{ route('user.rekomendasi.show', $r->id) }}" class="btn btn-sm btn-outline-success">Lihat</a>
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
                <div class="card-header">Rekomendasi Terakhir</div>
                <div class="card-body">
                    @if(!$rekomendasiTerakhir)
                    <div class="text-muted">Belum ada rekomendasi yang tersimpan.</div>
                    @else
                    <div class="mb-2"><strong>Penyakit:</strong> {{ $penyakitTerakhir->nama ?? '-' }}</div>
                    <div class="mb-2"><strong>Tanggal:</strong> {{ optional($rekomendasiTerakhir->created_at)->format('d M Y H:i') }}</div>
                    <div class="mb-2"><strong>Pupuk terbaik:</strong> {{ optional(optional($rekomendasiTerakhir->detailPupuk->first())->pupuk)->nama ?: '-' }}</div>
                    <div class="mb-3"><strong>Pestisida terbaik:</strong> {{ optional(optional($rekomendasiTerakhir->detailPestisida->first())->pestisida)->nama ?: '-' }}</div>
                    <a href="{{ route('user.rekomendasi.show', $rekomendasiTerakhir->id) }}" class="btn btn-spk">Buka Hasil Terakhir</a>
                    @endif
                </div>
            </div>
            <div class="card">
                <div class="card-header">Profil Singkat</div>
                <div class="card-body">
                    <div class="mini-separator">
                        <div class="small text-muted">Nama</div>
                        <div class="fw-semibold">{{ $user->nama }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="small text-muted">Username</div>
                        <div class="fw-semibold">{{ $user->username }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="small text-muted">Email</div>
                        <div class="fw-semibold">{{ $user->email ?: 'Belum diisi' }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="small text-muted">Role</div>
                        <div class="fw-semibold text-success">Petani</div>
                    </div>
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
