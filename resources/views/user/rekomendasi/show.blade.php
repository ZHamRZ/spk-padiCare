@extends('layouts.app')

@section('title', 'Hasil Rekomendasi')
@section('page-title', 'Hasil Rekomendasi')

@push('styles')
<style>
    .result-hero {
        background: linear-gradient(135deg, #ecfdf5 0%, #f8fafc 100%);
        border: 1px solid #bbf7d0;
        border-radius: 22px;
    }

    .analysis-card,
    .tech-card {
        border: 1px solid #e5e7eb;
        border-radius: 18px;
        background: #fff;
        height: 100%;
    }

    .insight-chip {
        display: inline-flex;
        align-items: center;
        padding: .35rem .7rem;
        border-radius: 999px;
        background: #f0fdf4;
        color: #166534;
        border: 1px solid #bbf7d0;
        font-size: .82rem;
        font-weight: 600;
    }

    .tech-label {
        color: #64748b;
        font-size: .8rem;
        margin-bottom: .2rem;
    }
</style>
@endpush

@section('content')
@php($isPreview = $isPreview ?? false)
@php($topPupuk = $rekomendasi->detailPupuk->first())
@php($topPestisida = $rekomendasi->detailPestisida->first())
@php($gejalaTerpilih = collect(data_get($rekomendasi, 'preferensi_pengguna.gejala_terpilih', [])))
@guest
<div class="container py-4">
@endguest

<div class="result-hero p-4 p-lg-5 mb-4">
    <div class="row g-4 align-items-center">
        <div class="col-lg-8">
            <span class="badge bg-success-subtle text-success border border-success-subtle mb-3">Hasil Diagnosis</span>
            <h3 class="fw-bold mb-2">Rekomendasi penanganan untuk {{ $rekomendasi->penyakit->nama }}</h3>
            <p class="text-muted mb-3">
                Halaman ini menampilkan pilihan pupuk dan pestisida terbaik sekaligus informasi teknisnya agar pengguna lebih mudah menganalisis langkah penanganan di lapangan.
            </p>
            <div class="d-flex flex-wrap gap-2">
                @if($rekomendasi->preferensi_label)
                <span class="insight-chip">Preferensi: {{ $rekomendasi->preferensi_label }}</span>
                @endif
                <span class="insight-chip">Pilih alternatif dengan skor paling tinggi</span>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="bg-white rounded-4 p-4 h-100">
                <div class="tech-label">Ringkasan cepat</div>
                <div class="mb-2"><strong>Pupuk utama:</strong> {{ $topPupuk->pupuk->nama ?? '-' }}</div>
                <div class="mb-2"><strong>Pestisida utama:</strong> {{ $topPestisida->pestisida->nama ?? '-' }}</div>
                <div class="small text-muted">Gunakan ini sebagai acuan awal, lalu sesuaikan dengan kondisi tanaman, fase umur, dan gejala di lahan.</div>
            </div>
        </div>
    </div>
</div>

@if($isPreview)
<div class="alert alert-info mb-4">
    Anda sedang melihat hasil tanpa login. Hasil ini belum disimpan ke riwayat pribadi.
</div>
@endif

<div class="row g-4 mb-4">
    <div class="col-xl-4">
        <div class="card h-100">
            <div class="card-header">Gejala yang Dipilih</div>
            <div class="card-body">
                @if($gejalaTerpilih->isEmpty())
                <div class="text-muted small">Data gejala yang dipilih belum tersedia.</div>
                @else
                <div class="d-flex flex-wrap gap-2">
                    @foreach($gejalaTerpilih as $gejala)
                    <span class="badge rounded-pill bg-success-subtle text-success border">
                        {{ data_get($gejala, 'kode') ? data_get($gejala, 'kode') . ' - ' : '' }}{{ data_get($gejala, 'nama_gejala') }}
                    </span>
                    @endforeach
                </div>
                <div class="small text-muted mt-3">
                    Gejala inilah yang dipakai sistem untuk mencocokkan penyakit dan menentukan rekomendasi terbaik.
                </div>
                @endif
            </div>
        </div>
    </div>
    <div class="col-xl-8">
        <div class="card h-100">
            <div class="card-header">Alasan Rekomendasi Utama</div>
            <div class="card-body">
                <div class="row g-3">
                    <div class="col-md-6">
                        <div class="analysis-card p-3">
                            <div class="fw-bold mb-2">Alasan pupuk dipilih</div>
                            <div class="small text-muted">
                                {{ optional($topPupuk?->pupuk)->efek_penggunaan
                                    ? 'Pupuk ini dipilih karena ' . lcfirst(optional($topPupuk->pupuk)->efek_penggunaan)
                                    : 'Alasan pupuk belum dapat dijelaskan karena efek penggunaan belum diisi admin.' }}
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="analysis-card p-3">
                            <div class="fw-bold mb-2">Alasan pestisida dipilih</div>
                            <div class="small text-muted">
                                {{ optional($topPestisida?->pestisida)->efek_penggunaan
                                    ? 'Pestisida ini dipilih karena ' . lcfirst(optional($topPestisida->pestisida)->efek_penggunaan)
                                    : 'Alasan pestisida belum dapat dijelaskan karena efek penggunaan belum diisi admin.' }}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="small text-muted mt-3">
                    Sistem memilih alternatif dengan skor kecocokan tertinggi, lalu alasan di atas ditampilkan agar pengguna lebih mudah memahami manfaat nyata dari pilihan tersebut.
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row g-4 mb-4">
    <div class="col-lg-6">
        <div class="analysis-card p-4">
            <div class="d-flex gap-3 align-items-start">
                @if(optional($topPupuk?->pupuk)->gambar_url)
                <img src="{{ $topPupuk->pupuk->gambar_url }}" alt="{{ $topPupuk->pupuk->nama }}" style="width:92px;height:92px;object-fit:cover;border-radius:14px;">
                @else
                <div class="bg-light text-muted d-flex align-items-center justify-content-center" style="width:92px;height:92px;border-radius:14px;">
                    <i class="bi bi-bag fs-3"></i>
                </div>
                @endif
                <div class="flex-grow-1">
                    <div class="d-flex flex-wrap gap-2 mb-2">
                        <span class="badge text-bg-success">Pupuk Terbaik</span>
                        <span class="badge bg-light text-dark border">{{ $topPupuk->pupuk->kode ?? '-' }}</span>
                    </div>
                    <h5 class="fw-bold mb-1">{{ $topPupuk->pupuk->nama ?? '-' }}</h5>
                    <div class="small text-muted mb-2">Skor kecocokan: {{ number_format($topPupuk->nilai_vi ?? 0, 6) }}</div>
                    <div class="small text-muted">{{ $topPupuk->pupuk->fungsi_utama ?? 'Fungsi pupuk belum diisi admin.' }}</div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="analysis-card p-4">
            <div class="d-flex gap-3 align-items-start">
                @if(optional($topPestisida?->pestisida)->gambar_url)
                <img src="{{ $topPestisida->pestisida->gambar_url }}" alt="{{ $topPestisida->pestisida->nama }}" style="width:92px;height:92px;object-fit:cover;border-radius:14px;">
                @else
                <div class="bg-light text-muted d-flex align-items-center justify-content-center" style="width:92px;height:92px;border-radius:14px;">
                    <i class="bi bi-capsule fs-3"></i>
                </div>
                @endif
                <div class="flex-grow-1">
                    <div class="d-flex flex-wrap gap-2 mb-2">
                        <span class="badge text-bg-success">Pestisida Terbaik</span>
                        <span class="badge bg-light text-dark border">{{ $topPestisida->pestisida->kode ?? '-' }}</span>
                    </div>
                    <h5 class="fw-bold mb-1">{{ $topPestisida->pestisida->nama ?? '-' }}</h5>
                    <div class="small text-muted mb-2">Skor kecocokan: {{ number_format($topPestisida->nilai_vi ?? 0, 6) }}</div>
                    <div class="small text-muted">{{ $topPestisida->pestisida->fungsi ?? 'Fungsi pestisida belum diisi admin.' }}</div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row g-4 mb-4">
    <div class="col-xl-6">
        <div class="card h-100">
            <div class="card-header">Analisa Teknis Pupuk Utama</div>
            <div class="card-body">
                @php($pupuk = optional($topPupuk)->pupuk)
                <div class="tech-card p-4">
                    <div class="mini-separator">
                        <div class="tech-label">Kandungan</div>
                        <div class="fw-semibold">{{ $pupuk->kandungan_detail ?: ($pupuk->kandungan ?: '-') }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Fungsi</div>
                        <div>{{ $pupuk->fungsi_utama ?: '-' }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Takaran</div>
                        <div>{{ $pupuk->takaran ?: '-' }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Efek Penggunaan</div>
                        <div>{{ $pupuk->efek_penggunaan ?: '-' }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Cara Aplikasi</div>
                        <div>{{ $pupuk->cara_aplikasi ?: '-' }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Umur / Jadwal Aplikasi</div>
                        <div>{{ $pupuk->jadwal_umur_aplikasi ?: '-' }}</div>
                    </div>
                    <div class="pt-3">
                        <div class="tech-label">Frekuensi Aplikasi</div>
                        <div>{{ $pupuk->frekuensi_aplikasi ?: '-' }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-6">
        <div class="card h-100">
            <div class="card-header">Analisa Teknis Pestisida Utama</div>
            <div class="card-body">
                @php($pestisida = optional($topPestisida)->pestisida)
                <div class="tech-card p-4">
                    <div class="mini-separator">
                        <div class="tech-label">Bahan Aktif / Kandungan</div>
                        <div class="fw-semibold">{{ $pestisida->kandungan_detail ?: ($pestisida->bahan_aktif ?: '-') }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Fungsi</div>
                        <div>{{ $pestisida->fungsi ?: '-' }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Takaran</div>
                        <div>{{ $pestisida->takaran ?: ($pestisida->dosis ?: '-') }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Efek Penggunaan</div>
                        <div>{{ $pestisida->efek_penggunaan ?: '-' }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Cara Aplikasi</div>
                        <div>{{ $pestisida->cara_aplikasi ?: '-' }}</div>
                    </div>
                    <div class="mini-separator">
                        <div class="tech-label">Jadwal & Umur Aplikasi</div>
                        <div>{{ $pestisida->jadwal_umur_aplikasi ?: '-' }}</div>
                    </div>
                    <div class="pt-3">
                        <div class="tech-label">Frekuensi Aplikasi</div>
                        <div>{{ $pestisida->frekuensi_aplikasi ?: '-' }}</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header">Ringkasan Analisa Pengambilan Keputusan</div>
    <div class="card-body">
        <div class="row g-3">
            <div class="col-md-4">
                <div class="analysis-card p-3">
                    <div class="fw-bold mb-2">1. Lihat penyakit yang paling cocok</div>
                    <div class="small text-muted">Pastikan gejala yang dipilih memang sesuai dengan kondisi tanaman di lapangan.</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="analysis-card p-3">
                    <div class="fw-bold mb-2">2. Cek alternatif dengan skor tertinggi</div>
                    <div class="small text-muted">Pupuk dan pestisida dengan nilai paling tinggi adalah pilihan yang paling sesuai dengan prioritas yang dipilih.</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="analysis-card p-3">
                    <div class="fw-bold mb-2">3. Sesuaikan dengan umur dan cara aplikasi</div>
                    <div class="small text-muted">Gunakan informasi takaran, umur aplikasi, dan frekuensi agar penanganan tidak salah waktu atau salah dosis.</div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="mt-4 d-flex flex-wrap gap-2">
    @if($isPreview)
    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-outline-secondary">Kembali</a>
    <a href="{{ route('login') }}" class="btn btn-outline-success">Login untuk Simpan Hasil</a>
    <a href="{{ route('user.rekomendasi.preview.detail') }}" class="btn btn-outline-success">Detail Perhitungan SAW</a>
    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-spk">Diagnosis Lagi</a>
    @else
    <a href="{{ route('user.riwayat.index') }}" class="btn btn-outline-secondary">Lihat Riwayat</a>
    <a href="{{ route('user.rekomendasi.detail', $rekomendasi->id) }}" class="btn btn-outline-success">Detail Perhitungan SAW</a>
    <a href="{{ route('user.rekomendasi.cetak', $rekomendasi->id) }}" target="_blank" class="btn btn-spk">Cetak Hasil</a>
    @endif
</div>

@guest
</div>
@endguest
@endsection
