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

    .disease-title {
        font-size: 1.45rem;
        font-weight: 800;
        line-height: 1.2;
        color: #14532d;
        margin: 0;
    }
</style>
@endpush

@section('content')
@php($isPreview = $isPreview ?? true)
@guest
<div class="container py-4">
@endguest

<div class="result-hero p-4 p-lg-5 mb-4">
    <div class="row g-4 align-items-center">
        <div class="col-lg-8">
            <span class="badge bg-success-subtle text-success border border-success-subtle mb-3">Hasil Diagnosis</span>
            <h3 class="fw-bold mb-2">Solusi untuk penyakit yang Anda pilih</h3>
            <p class="text-muted mb-3">
                Halaman ini menampilkan rekomendasi pupuk dan pestisida terbaik untuk setiap penyakit yang dipilih agar Anda bisa melihat beberapa solusi sekaligus dalam satu layar.
            </p>
            <div class="d-flex flex-wrap gap-2">
                <span class="insight-chip">{{ $hasilDiagnosa->count() }} penyakit dipilih</span>
                @if(data_get($hasilDiagnosa->first(), 'rekomendasi.preferensi_label'))
                <span class="insight-chip">Preferensi: {{ data_get($hasilDiagnosa->first(), 'rekomendasi.preferensi_label') }}</span>
                @endif
            </div>
        </div>
        <div class="col-lg-4">
            <div class="bg-white rounded-4 p-4 h-100">
                <div class="tech-label">Ringkasan cepat</div>
                <div class="small text-muted mb-2">Gejala yang dipakai untuk seluruh hasil ini:</div>
                <div class="d-flex flex-wrap gap-2">
                    @foreach(collect(data_get($hasilDiagnosa->first(), 'rekomendasi.preferensi_pengguna.gejala_terpilih', []))->take(4) as $gejala)
                    <span class="badge bg-light text-dark border">
                        {{ data_get($gejala, 'kode') ? data_get($gejala, 'kode') . ' - ' : '' }}{{ data_get($gejala, 'nama_gejala') }}
                    </span>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
</div>

@if($isSavedBatch)
<div class="alert alert-success mb-4">
    Semua rekomendasi yang dipilih sudah dihitung dan disimpan ke riwayat akun Anda.
</div>
@else
<div class="alert alert-info mb-4">
    Anda sedang melihat hasil tanpa login. Hasil ini belum disimpan ke riwayat pribadi.
</div>
@endif

@foreach($hasilDiagnosa as $hasil)
@php($rekomendasi = $hasil['rekomendasi'])
@php($topPupuk = $rekomendasi->detailPupuk->first())
@php($topPestisida = $rekomendasi->detailPestisida->first())
@php($gejalaCocok = collect(data_get($rekomendasi, 'gejala_cocok', [])))

<div class="card mb-4">
    <div class="card-header d-flex flex-wrap justify-content-between align-items-center gap-2">
        <div>
            <div class="small text-white-50">Solusi untuk penyakit</div>
            <h3 class="disease-title text-white">{{ $rekomendasi->penyakit->nama }}</h3>
        </div>
        <span class="badge text-bg-success">{{ $rekomendasi->penyakit->nama }}</span>
    </div>
    <div class="card-body">
        <div class="row g-4 mb-4">
            <div class="col-xl-4">
                <div class="card h-100">
                    <div class="card-header">Gejala yang Cocok untuk Penyakit Ini</div>
                    <div class="card-body">
                        @if($gejalaCocok->isEmpty())
                        <div class="small text-muted">
                            Belum ada gejala yang cocok terpetakan untuk penyakit ini dari pilihan pengguna.
                        </div>
                        @else
                        <div class="d-flex flex-wrap gap-2">
                            @foreach($gejalaCocok as $gejala)
                            <span class="badge rounded-pill bg-success-subtle text-success border">
                                {{ data_get($gejala, 'kode') ? data_get($gejala, 'kode') . ' - ' : '' }}{{ data_get($gejala, 'nama_gejala') }}
                            </span>
                            @endforeach
                        </div>
                        <div class="small text-muted mt-3">
                            Hanya gejala yang sesuai dengan penyakit {{ $rekomendasi->penyakit->nama }} yang ditampilkan di bagian ini.
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
                                    <div class="fw-bold mb-2">Pupuk terbaik</div>
                                    <div class="mb-2"><strong>{{ $topPupuk->pupuk->nama ?? '-' }}</strong></div>
                                    <div class="small text-muted">
                                        {{ optional($topPupuk?->pupuk)->efek_penggunaan
                                            ? 'Dipilih karena ' . lcfirst(optional($topPupuk->pupuk)->efek_penggunaan)
                                            : 'Efek penggunaan pupuk belum diisi admin.' }}
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="analysis-card p-3">
                                    <div class="fw-bold mb-2">Pestisida terbaik</div>
                                    <div class="mb-2"><strong>{{ $topPestisida->pestisida->nama ?? '-' }}</strong></div>
                                    <div class="small text-muted">
                                        {{ optional($topPestisida?->pestisida)->efek_penggunaan
                                            ? 'Dipilih karena ' . lcfirst(optional($topPestisida->pestisida)->efek_penggunaan)
                                            : 'Efek penggunaan pestisida belum diisi admin.' }}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-xl-6">
                <div class="card h-100">
                    <div class="card-header">Analisa Teknis Pupuk Utama</div>
                    <div class="card-body">
                        @php($pupuk = optional($topPupuk)->pupuk)
                        <div class="tech-card p-4">
                            <div class="tech-label">Kandungan</div>
                            <div class="fw-semibold mb-3">{{ $pupuk->kandungan_detail ?: ($pupuk->kandungan ?: '-') }}</div>
                            <div class="tech-label">Fungsi</div>
                            <div class="mb-3">{{ $pupuk->fungsi_utama ?: '-' }}</div>
                            <div class="tech-label">Takaran</div>
                            <div class="mb-3">{{ $pupuk->takaran ?: '-' }}</div>
                            <div class="tech-label">Efek Penggunaan</div>
                            <div class="mb-3">{{ $pupuk->efek_penggunaan ?: '-' }}</div>
                            <div class="tech-label">Cara Aplikasi</div>
                            <div class="mb-3">{{ $pupuk->cara_aplikasi ?: '-' }}</div>
                            <div class="tech-label">Umur / Jadwal Aplikasi</div>
                            <div class="mb-3">{{ $pupuk->jadwal_umur_aplikasi ?: '-' }}</div>
                            <div class="tech-label">Frekuensi Aplikasi</div>
                            <div>{{ $pupuk->frekuensi_aplikasi ?: '-' }}</div>
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
                            <div class="tech-label">Bahan Aktif / Kandungan</div>
                            <div class="fw-semibold mb-3">{{ $pestisida->kandungan_detail ?: ($pestisida->bahan_aktif ?: '-') }}</div>
                            <div class="tech-label">Fungsi</div>
                            <div class="mb-3">{{ $pestisida->fungsi ?: '-' }}</div>
                            <div class="tech-label">Takaran</div>
                            <div class="mb-3">{{ $pestisida->takaran ?: ($pestisida->dosis ?: '-') }}</div>
                            <div class="tech-label">Efek Penggunaan</div>
                            <div class="mb-3">{{ $pestisida->efek_penggunaan ?: '-' }}</div>
                            <div class="tech-label">Cara Aplikasi</div>
                            <div class="mb-3">{{ $pestisida->cara_aplikasi ?: '-' }}</div>
                            <div class="tech-label">Jadwal & Umur Aplikasi</div>
                            <div class="mb-3">{{ $pestisida->jadwal_umur_aplikasi ?: '-' }}</div>
                            <div class="tech-label">Frekuensi Aplikasi</div>
                            <div>{{ $pestisida->frekuensi_aplikasi ?: '-' }}</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endforeach

<div class="d-flex flex-wrap gap-2">
    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-outline-secondary">Kembali</a>
    @guest
    <a href="{{ route('login') }}" class="btn btn-outline-success">Login untuk Simpan Hasil</a>
    @endguest
    @if($hasilDiagnosa->count() === 1)
    <a href="{{ route('user.rekomendasi.preview.detail') }}" class="btn btn-outline-success">Detail Perhitungan SAW</a>
    @endif
    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-spk">Diagnosis Lagi</a>
</div>

@guest
</div>
@endguest
@endsection
