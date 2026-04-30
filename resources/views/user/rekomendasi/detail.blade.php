@extends('layouts.app')

@section('title', 'Detail Analisis')
@section('page-title', 'Detail Analisis')

@push('styles')
<style>
    .explain-hero {
        background: linear-gradient(135deg, #ecfdf5 0%, #f0fdf4 100%);
        border: 1px solid #bbf7d0;
        border-radius: 22px;
    }

    .reason-chip {
        display: inline-flex;
        align-items: center;
        padding: .35rem .7rem;
        border-radius: 999px;
        background: #f8fafc;
        color: #334155;
        border: 1px solid #e2e8f0;
        font-size: .82rem;
    }
</style>
@endpush

@section('content')
@php
    use App\Support\ExpertSystemPresenter;

    $isPreview = $isPreview ?? false;
@endphp
@guest
<div class="container py-4">
@endguest

<div class="explain-hero p-4 p-lg-5 mb-4">
    <div class="row g-4 align-items-center">
        <div class="col-lg-8">
            <span class="badge bg-success-subtle text-success border border-success-subtle mb-3">Mode Lanjutan</span>
            <h2 class="fw-bold mb-2">Detail analisis untuk {{ $rekomendasi->penyakit->nama }}</h2>
            <p class="text-muted mb-0">
                Halaman ini menyajikan alasan dan detail penilaian secara lebih lengkap untuk pengguna yang ingin memeriksa proses analisis sistem pakar.
            </p>
        </div>
        <div class="col-lg-4">
            <div class="bg-white rounded-4 p-4 h-100">
                <div class="small text-muted mb-2">Pilihan utama</div>
                <div class="mb-2"><strong>Pupuk terbaik:</strong> {{ data_get($preview, 'pupuk.0.nama', '-') }}</div>
                <div class="mb-2"><strong>Pestisida terbaik:</strong> {{ data_get($preview, 'pestisida.0.nama', '-') }}</div>
                <div class="small text-muted">Detail teknis disembunyikan agar tampilan utama tetap nyaman dibaca.</div>
            </div>
        </div>
    </div>
</div>

@if($rekomendasi->preferensi_label)
<div class="alert alert-success mb-4">
    <div class="fw-semibold mb-1">Prioritas yang dipilih: {{ $rekomendasi->preferensi_label }}</div>
    @if(data_get($rekomendasi->preferensi_pengguna, 'alasan'))
    <div class="small">Alasan: {{ data_get($rekomendasi->preferensi_pengguna, 'alasan') }}</div>
    @endif
    @if(data_get($rekomendasi->preferensi_pengguna, 'catatan'))
    <div class="small">Catatan: {{ data_get($rekomendasi->preferensi_pengguna, 'catatan') }}</div>
    @endif
</div>
@endif

@foreach(['pupuk' => 'Pupuk', 'pestisida' => 'Pestisida'] as $key => $label)
<div class="card mb-4">
    <div class="card-header">{{ $label }} yang Direkomendasikan</div>
    <div class="card-body">
        <div class="row g-4 mb-4">
            @foreach($preview[$key] as $item)
            @php
                $alasanUtama = collect($item['detail'])
                    ->reject(fn ($detail, $code) => in_array($code, ['BASE', 'PRESET'], true) && ($detail['impact'] ?? 0) <= 0)
                    ->sortByDesc('impact')
                    ->take(3);
                $description = $key === 'pupuk'
                    ? ExpertSystemPresenter::shortDescription(data_get($item, 'meta.fungsi_utama'), data_get($item, 'meta.efek_penggunaan'))
                    : ExpertSystemPresenter::shortDescription(data_get($item, 'meta.fungsi'), data_get($item, 'meta.efek_penggunaan'));
            @endphp
            <div class="col-12">
                <x-expert-system.result-card
                    :type="$label"
                    :title="$item['nama']"
                    :code="$item['kode']"
                    :description="$description"
                    :score="$item['vi']"
                    :rank="$item['peringkat']"
                    :image-url="data_get($item, 'meta.gambar_url')"
                    :badge="$rekomendasi->preferensi_label"
                />

                <div class="mt-3">
                    <div class="small text-muted mb-2">Faktor yang paling berpengaruh</div>
                    <div class="d-flex flex-wrap gap-2">
                        @foreach($alasanUtama as $detail)
                        <span class="reason-chip">
                            {{ $detail['kriteria'] }}: dampak {{ number_format($detail['impact'] ?? 0, 4) }}
                        </span>
                        @endforeach
                    </div>
                </div>

                <div class="mt-3">
                    <x-expert-system.advanced-details target="detail-{{ $key }}-{{ $loop->index }}">
                        <div class="small text-muted mb-3">
                            Rincian ini ditampilkan untuk pengguna yang ingin melihat bagaimana sistem menyusun skor akhir setiap alternatif.
                        </div>
                        <div class="table-responsive">
                            <table class="table table-sm table-striped align-middle mb-0">
                                <thead class="table-light">
                                    <tr>
                                        <th style="min-width: 180px;">Rule</th>
                                        <th style="min-width: 100px;">Jenis</th>
                                        <th style="min-width: 120px;">Preferensi User</th>
                                        <th style="min-width: 120px;">MB Tambahan</th>
                                        <th style="min-width: 120px;">MD Tambahan</th>
                                        <th style="min-width: 120px;">Dampak</th>
                                        <th>Catatan</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($item['detail'] as $kode => $detail)
                                    <tr>
                                        <td>
                                            <strong>{{ $kode }}</strong><br>
                                            <span class="small text-muted">{{ Str::limit($detail['kriteria'], 60) }}</span>
                                        </td>
                                        <td>{{ ucfirst($detail['jenis'] ?? '-') }}</td>
                                        <td>{{ is_null($detail['preferensi_user'] ?? null) ? '-' : ($detail['preferensi_user'] . '%') }}</td>
                                        <td>{{ number_format((float) ($detail['mb_bonus'] ?? 0), 4) }}</td>
                                        <td>{{ number_format((float) ($detail['md_bonus'] ?? 0), 4) }}</td>
                                        <td>
                                            <span class="{{ (($detail['impact'] ?? 0) >= 0) ? 'text-success' : 'text-danger' }}">
                                                {{ number_format((float) ($detail['impact'] ?? 0), 4) }}
                                            </span>
                                        </td>
                                        <td class="small text-muted">{{ Str::limit($detail['catatan'] ?? '-', 50) }}</td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <div class="small text-muted mt-3">
                            CF dasar: {{ number_format(data_get($item, 'cf_meta.cf_awal', 0), 4) }},
                            CF akhir: {{ number_format(data_get($item, 'cf_meta.cf_akhir', $item['vi']), 4) }}.
                            Preferensi pengguna menyesuaikan MB dan MD, bukan lagi memakai bobot SAW.
                        </div>
                    </x-expert-system.advanced-details>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
@endforeach

<div class="d-flex flex-wrap gap-2">
    @if($isPreview)
    <a href="{{ route('login') }}" class="btn btn-outline-success">Login untuk Simpan Hasil</a>
    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-spk">Diagnosis Lagi</a>
    @else
    <a href="{{ route('user.riwayat.index') }}" class="btn btn-spk">Buka Riwayat</a>
    @endif
</div>
@guest
</div>
@endguest
@endsection
