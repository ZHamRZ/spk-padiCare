@extends('layouts.app')

@section('title', 'Hasil Rekomendasi')
@section('page-title', 'Hasil Rekomendasi')

@push('styles')
<style>
    .result-hero {
        background: linear-gradient(135deg, #ecfdf5 0%, #f8fafc 100%);
        border: 1px solid #bbf7d0;
        border-radius: 24px;
    }

    .summary-card {
        border: 1px solid #e2e8f0;
        border-radius: 20px;
        background: #fff;
        box-shadow: 0 12px 30px rgba(15, 23, 42, 0.04);
    }
    .insight-chip {
        display: inline-flex;
        align-items: center;
        gap: .45rem;
        padding: .4rem .75rem;
        border-radius: 999px;
        background: #fff;
        border: 1px solid #d1fae5;
        color: #166534;
        font-size: .85rem;
        font-weight: 600;
    }
</style>
@endpush

@section('content')
@php
    use App\Support\ExpertSystemPresenter;

    $isPreview = $isPreview ?? false;
    $topPupuk = $rekomendasi->detailPupuk->sortBy('peringkat')->first();
    $topPestisida = $rekomendasi->detailPestisida->sortBy('peringkat')->first();
    $gejalaTerpilih = collect(data_get($rekomendasi, 'preferensi_pengguna.gejala_terpilih', []));
    $topScore = max((float) ($topPupuk->nilai_vi ?? 0), (float) ($topPestisida->nilai_vi ?? 0));
    $warning = ExpertSystemPresenter::lowConfidenceMessage($topScore);
@endphp
@guest
<div class="container py-4">
@endguest

<div class="result-hero p-4 p-lg-5 mb-4">
    <div class="row g-4 align-items-center">
        <div class="col-lg-8">
            <span class="badge bg-success-subtle text-success border border-success-subtle mb-3">Analisis Sistem Pakar</span>
            <h2 class="fw-bold mb-2">Rekomendasi penanganan untuk {{ $rekomendasi->penyakit->nama }}</h2>
            <p class="text-muted mb-3">
                Sistem menyiapkan pupuk dan pestisida yang paling sesuai berdasarkan hasil analisis penyakit dan prioritas yang Anda pilih.
            </p>
            <div class="d-flex flex-wrap gap-2">
                @if($rekomendasi->preferensi_label)
                <span class="insight-chip"><i class="bi bi-sliders"></i>{{ $rekomendasi->preferensi_label }}</span>
                @endif
                <span class="insight-chip"><i class="bi bi-graph-up-arrow"></i>Skor tertinggi menjadi rekomendasi utama</span>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="summary-card p-4 h-100">
                <div class="small text-muted mb-2">Ringkasan cepat</div>
                <div class="fw-semibold mb-1">Penyakit utama</div>
                <div class="mb-3">{{ $rekomendasi->penyakit->nama }}</div>
                <div class="fw-semibold mb-1">Skor rekomendasi tertinggi</div>
                <div class="small text-muted mb-3">{{ ExpertSystemPresenter::percent($topScore) }} · {{ ExpertSystemPresenter::confidenceLabel($topScore) }}</div>
                <x-expert-system.confidence-bar :value="$topScore" />
            </div>
        </div>
    </div>
</div>

@if($isPreview)
<div class="alert alert-info mb-4">
    Anda sedang melihat hasil tanpa login. Hasil ini belum disimpan ke riwayat pribadi.
</div>
@endif

@if($warning)
<div class="alert alert-warning mb-4">
    {{ $warning }}
</div>
@endif

<div class="row g-4 mb-4">
    <div class="col-xl-4">
        <div class="summary-card p-4 h-100">
            <div class="fw-semibold mb-2">Gejala yang dianalisis</div>
            @if($gejalaTerpilih->isEmpty())
            <div class="small text-muted">Data gejala belum tersedia.</div>
            @else
            <div class="d-flex flex-wrap gap-2">
                @foreach($gejalaTerpilih as $gejala)
                <span class="badge rounded-pill bg-light text-dark border">
                    {{ data_get($gejala, 'kode') ? data_get($gejala, 'kode') . ' - ' : '' }}{{ data_get($gejala, 'nama_gejala') }}
                </span>
                @endforeach
            </div>
            <div class="small text-muted mt-3">
                Gunakan daftar ini untuk mencocokkan kembali hasil analisis dengan kondisi tanaman di lapangan.
            </div>
            @endif
        </div>
    </div>
    <div class="col-xl-8">
        <div class="summary-card p-4 h-100">
            <div class="fw-semibold mb-2">Saran penggunaan hasil</div>
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="border rounded-4 p-3 h-100">
                        <div class="fw-semibold mb-2">1. Lihat hasil utama</div>
                        <div class="small text-muted">Mulai dari pilihan peringkat 1 untuk pupuk dan pestisida.</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border rounded-4 p-3 h-100">
                        <div class="fw-semibold mb-2">2. Cocokkan deskripsi</div>
                        <div class="small text-muted">Pastikan fungsi, dosis, dan cara aplikasinya sesuai kebutuhan lahan.</div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border rounded-4 p-3 h-100">
                        <div class="fw-semibold mb-2">3. Lanjutkan bila yakin</div>
                        <div class="small text-muted">Jika hasil rendah, gunakan sebagai acuan awal lalu konsultasikan lebih lanjut.</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header">Rekomendasi Pupuk</div>
    <div class="card-body">
        <div class="row g-4">
            @foreach($rekomendasi->detailPupuk->sortBy('peringkat') as $item)
            <div class="col-xl-6">
                <x-expert-system.result-card
                    type="Pupuk"
                    :title="$item->pupuk->nama ?? '-'"
                    :code="$item->pupuk->kode ?? null"
                    :description="ExpertSystemPresenter::shortDescription(
                        optional($item->pupuk)->fungsi_utama,
                        optional($item->pupuk)->efek_penggunaan
                    )"
                    :score="$item->nilai_vi"
                    :rank="$item->peringkat"
                    :image-url="optional($item->pupuk)->gambar_url"
                    :badge="$rekomendasi->preferensi_label"
                />
            </div>
            @endforeach
        </div>
    </div>
</div>

<div class="card mb-4">
    <div class="card-header">Rekomendasi Pestisida</div>
    <div class="card-body">
        <div class="row g-4">
            @foreach($rekomendasi->detailPestisida->sortBy('peringkat') as $item)
            <div class="col-xl-6">
                <x-expert-system.result-card
                    type="Pestisida"
                    :title="$item->pestisida->nama ?? '-'"
                    :code="$item->pestisida->kode ?? null"
                    :description="ExpertSystemPresenter::shortDescription(
                        optional($item->pestisida)->fungsi,
                        optional($item->pestisida)->efek_penggunaan
                    )"
                    :score="$item->nilai_vi"
                    :rank="$item->peringkat"
                    :image-url="optional($item->pestisida)->gambar_url"
                    :badge="$rekomendasi->preferensi_label"
                />
            </div>
            @endforeach
        </div>
    </div>
</div>

<div class="d-flex flex-wrap gap-2">
    @if($isPreview)
    <a href="{{ route('login') }}" class="btn btn-outline-success">Login untuk Simpan Hasil</a>
    <a href="{{ route('user.rekomendasi.preview.detail') }}" class="btn btn-outline-success">Lihat Detail Analisis</a>
    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-spk">Diagnosis Lagi</a>
    @else
    <a href="{{ route('user.riwayat.index') }}" class="btn btn-outline-secondary">Lihat Riwayat</a>
    <a href="{{ route('user.rekomendasi.detail', $rekomendasi->id) }}" class="btn btn-outline-success">Lihat Detail Analisis</a>
    <a href="{{ route('user.rekomendasi.cetak', $rekomendasi->id) }}" target="_blank" class="btn btn-spk">Cetak Hasil</a>
    @endif
</div>

@guest
</div>
@endguest
@endsection
