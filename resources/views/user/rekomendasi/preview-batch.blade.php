@extends('layouts.app')

@section('title', 'Preview Rekomendasi')
@section('page-title', 'Preview Rekomendasi')

@push('styles')
<style>
    /* ── Reset & Base ──────────────────────────────── */
    *, *::before, *::after { box-sizing: border-box; }

    /* ── Hero Banner ───────────────────────────────── */
    .result-hero {
        background: linear-gradient(135deg, #ecfdf5 0%, #f0fdf4 50%, #f8fafc 100%);
        border: 1px solid #bbf7d0;
        border-radius: 20px;
    }
    .summary-chip {
        display: inline-flex;
        align-items: center;
        gap: .4rem;
        padding: .35rem .75rem;
        border-radius: 999px;
        background: #fff;
        border: 1px solid #d1fae5;
        color: #166534;
        font-size: .82rem;
        font-weight: 600;
        white-space: nowrap;
    }

    /* ── Batch Card ────────────────────────────────── */
    .batch-card {
        border: 1px solid #e2e8f0;
        border-radius: 20px;
        background: #fff;
        box-shadow: 0 4px 24px rgba(15, 23, 42, 0.05);
        overflow: hidden;
    }

    /* ── Disease Sidebar ───────────────────────────── */
    .disease-sidebar {
        background: linear-gradient(160deg, #f0fdf4 0%, #f8fafc 100%);
        border-radius: 16px;
        padding: 20px;
        height: 100%;
    }
    .disease-media {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-radius: 14px;
        background: #e2e8f0;
    }
    .media-empty {
        width: 100%;
        height: 200px;
        background: linear-gradient(135deg, #e2e8f0 0%, #cbd5e1 100%);
        color: #94a3b8;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        border-radius: 14px;
        gap: 8px;
    }
    .disease-meta-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 10px;
        margin-top: 14px;
    }
    .disease-meta-item {
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 10px;
        padding: 10px 12px;
    }
    .disease-meta-item .label {
        font-size: .72rem;
        color: #94a3b8;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: .04em;
        margin-bottom: 3px;
    }
    .disease-meta-item .value {
        font-size: .84rem;
        font-weight: 700;
        color: #0f172a;
    }
    .disease-meta-item.full-width {
        grid-column: 1 / -1;
    }

    /* ── Symptom Badges ────────────────────────────── */
    .symptom-badges {
        display: flex;
        flex-wrap: wrap;
        gap: 6px;
    }
    .symptom-badge {
        font-size: .78rem;
        padding: .3rem .65rem;
        border-radius: 8px;
        background: #f0fdf4;
        border: 1px solid #bbf7d0;
        color: #166534;
        font-weight: 500;
    }

    /* ── Section Label ─────────────────────────────── */
    .section-label {
        font-size: .72rem;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: .08em;
        color: #94a3b8;
        margin-bottom: 12px;
        display: flex;
        align-items: center;
        gap: 6px;
    }
    .section-label::after {
        content: '';
        flex: 1;
        height: 1px;
        background: #e2e8f0;
    }

    /* ── Product Cards (Pupuk & Pestisida) ─────────── */
    .product-card {
        border: 1px solid #e2e8f0;
        border-radius: 14px;
        background: #fff;
        overflow: hidden;
        transition: box-shadow .2s ease, transform .2s ease;
        display: flex;
        flex-direction: column;
        height: 100%;
    }
    .product-card:hover {
        box-shadow: 0 8px 28px rgba(15,23,42,.08);
        transform: translateY(-2px);
    }
    .product-card-img {
        width: 100%;
        height: 130px;
        object-fit: cover;
        background: #f8fafc;
    }
    .product-card-img-empty {
        width: 100%;
        height: 130px;
        background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        display: flex;
        align-items: center;
        justify-content: center;
        color: #cbd5e1;
        font-size: 2rem;
    }
    .product-card-body {
        padding: 14px;
        flex: 1;
        display: flex;
        flex-direction: column;
    }
    .product-rank-badge {
        display: inline-flex;
        align-items: center;
        gap: 4px;
        font-size: .72rem;
        font-weight: 700;
        padding: .25rem .55rem;
        border-radius: 6px;
        background: #fef9c3;
        color: #854d0e;
        border: 1px solid #fde68a;
        margin-bottom: 6px;
    }
    .product-rank-badge.rank-1 {
        background: #dcfce7;
        color: #166534;
        border-color: #bbf7d0;
    }
    .product-type-tag {
        font-size: .7rem;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: .06em;
        color: #64748b;
        margin-bottom: 4px;
    }
    .product-name {
        font-size: .95rem;
        font-weight: 700;
        color: #0f172a;
        margin-bottom: 6px;
        line-height: 1.3;
    }
    .product-desc {
        font-size: .8rem;
        color: #64748b;
        line-height: 1.5;
        flex: 1;
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }
    .product-score-row {
        margin-top: 10px;
        padding-top: 10px;
        border-top: 1px solid #f1f5f9;
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 8px;
    }
    .score-bar-wrap {
        flex: 1;
        height: 5px;
        background: #e2e8f0;
        border-radius: 999px;
        overflow: hidden;
    }
    .score-bar-fill {
        height: 100%;
        border-radius: 999px;
        background: linear-gradient(90deg, #16a34a, #22c55e);
        transition: width .6s ease;
    }
    .score-bar-fill.medium {
        background: linear-gradient(90deg, #ca8a04, #eab308);
    }
    .score-label {
        font-size: .75rem;
        font-weight: 700;
        color: #475569;
        white-space: nowrap;
    }

    /* ── Detail Toggle ─────────────────────────────── */
    .detail-toggle {
        margin-top: 0;
        border-top: 1px solid #f1f5f9;
    }
    .detail-toggle summary {
        list-style: none;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 14px;
        color: #16a34a;
        background: transparent;
        font-size: .8rem;
        font-weight: 700;
        cursor: pointer;
        user-select: none;
        transition: background .15s;
    }
    .detail-toggle summary::-webkit-details-marker { display: none; }
    .detail-toggle summary:hover { background: #f0fdf4; }
    .detail-toggle[open] summary {
        background: #f0fdf4;
        border-bottom: 1px solid #bbf7d0;
    }
    .detail-toggle summary .chevron {
        transition: transform .2s;
        font-size: .7rem;
    }
    .detail-toggle[open] summary .chevron {
        transform: rotate(180deg);
    }
    .detail-panel {
        padding: 14px;
        background: #f8fafc;
    }
    .detail-list {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 6px;
    }
    .detail-row {
        background: #fff;
        border: 1px solid #e2e8f0;
        border-radius: 8px;
        padding: 8px 10px;
    }
    .detail-row.full { grid-column: 1 / -1; }
    .detail-row.span2 { grid-column: span 2; }
    .detail-row .dl { font-size: .7rem; color: #94a3b8; font-weight: 600; text-transform: uppercase; margin-bottom: 2px; }
    .detail-row .dv { font-size: .8rem; color: #1e293b; font-weight: 500; word-break: break-word;
        display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; }
    .detail-row.full .dv, .detail-row.span2 .dv { -webkit-line-clamp: 4; }

    /* ── Action Buttons ────────────────────────────── */
    .action-bar {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        padding: 20px 0;
    }
    .action-bar .btn {
        padding: .55rem 1.2rem;
        border-radius: 10px;
        font-size: .88rem;
        font-weight: 600;
    }

    /* ── Mobile Responsive ─────────────────────────── */
    @media (max-width: 991px) {
        .disease-meta-grid { grid-template-columns: repeat(3, 1fr); }
        .batch-card { border-radius: 16px; }
    }
    @media (max-width: 767px) {
        .result-hero { border-radius: 14px; padding: 18px !important; }
        .result-hero h2 { font-size: 1.25rem; }
        .batch-card { border-radius: 12px; padding: 16px !important; }
        .disease-media, .media-empty { height: 180px; }
        .product-card-img, .product-card-img-empty { height: 110px; }
        .disease-meta-grid { grid-template-columns: 1fr 1fr; }
        .detail-list { grid-template-columns: 1fr 1fr; }
        .detail-row.full { grid-column: 1 / -1; }
        .detail-row.span2 { grid-column: 1 / -1; }        .action-bar .btn { flex: 1; min-width: 140px; text-align: center; }
        .section-label { font-size: .68rem; }
    }
    @media (max-width: 480px) {
        .disease-meta-grid { grid-template-columns: 1fr 1fr; }
        .summary-chip { font-size: .76rem; padding: .3rem .6rem; }
        .product-name { font-size: .88rem; }
    }
</style>
@endpush

@section('content')
@php
    use App\Support\ExpertSystemPresenter;

    $isPreview = $isPreview ?? true;
    $selectedSymptoms = collect(data_get($hasilDiagnosa->first(), 'rekomendasi.preferensi_pengguna.gejala_terpilih', []));
@endphp
@guest
<div class="container py-4">
@endguest

{{-- ── Hero ──────────────────────────────────────────── --}}
<div class="result-hero p-4 p-lg-5 mb-4">
    <div class="row g-3 align-items-center">
        <div class="col-lg-8">
            <span class="badge bg-success-subtle text-success border border-success-subtle mb-3">
                <i class="bi bi-cpu me-1"></i>Analisis Sistem Pakar
            </span>
            <h2 class="fw-bold mb-2">Preview Hasil Rekomendasi</h2>
            <p class="text-muted mb-3" style="font-size:.9rem;">
                Tampilan ini menampilkan rekomendasi utama agar Anda bisa langsung membaca hasil diagnosa dengan cepat.
            </p>
            <div class="d-flex flex-wrap gap-2">
                <span class="summary-chip">
                    <i class="bi bi-clipboard2-pulse"></i>
                    {{ $hasilDiagnosa->count() }} penyakit dipilih
                </span>
                @if(data_get($hasilDiagnosa->first(), 'rekomendasi.preferensi_label'))
                <span class="summary-chip">
                    <i class="bi bi-sliders"></i>
                    {{ data_get($hasilDiagnosa->first(), 'rekomendasi.preferensi_label') }}
                </span>
                @endif
            </div>
        </div>
        <div class="col-lg-4">
            <div class="bg-white rounded-3 p-3 border border-success-subtle">
                <div class="section-label mb-2"><i class="bi bi-activity"></i> Gejala yang dipakai</div>
                <div class="symptom-badges">
                    @foreach($selectedSymptoms->take(5) as $gejala)
                    <span class="symptom-badge">
                        {{ data_get($gejala, 'kode') ? data_get($gejala, 'kode') . ' · ' : '' }}{{ data_get($gejala, 'nama_gejala') }}
                    </span>
                    @endforeach
                    @if($selectedSymptoms->count() > 5)
                    <span class="symptom-badge" style="background:#f1f5f9;border-color:#e2e8f0;color:#64748b;">
                        +{{ $selectedSymptoms->count() - 5 }} lainnya
                    </span>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>

{{-- ── Login Notice ───────────────────────────────────── --}}
@if($isSavedBatch)
<div class="alert alert-success border-0 rounded-3 mb-4 d-flex align-items-center gap-2">
    <i class="bi bi-check-circle-fill text-success"></i>
    Hasil ini sudah dihitung dan disimpan ke riwayat akun Anda.
</div>
@else
<div class="alert alert-info border-0 rounded-3 mb-4 d-flex align-items-center gap-2">
    <i class="bi bi-info-circle-fill"></i>
    Anda sedang melihat hasil tanpa login. Silakan <a href="{{ route('login') }}" class="alert-link">login</a> untuk menyimpan hasil ini.
</div>
@endif

{{-- ── Per-Disease Batch ──────────────────────────────── --}}
@foreach($hasilDiagnosa as $hasil)
@php
    $rekomendasi = $hasil['rekomendasi'];
    $sortedPupuk = $rekomendasi->detailPupuk->sortBy('peringkat')->values();
    $sortedPestisida = $rekomendasi->detailPestisida->sortBy('peringkat')->values();
    $topPupuk = $sortedPupuk->first();
    $topPestisida = $sortedPestisida->first();
    $pupukThreshold = max(0.6, (float) ($topPupuk->nilai_vi ?? 0) - 0.1);
    $pestisidaThreshold = max(0.6, (float) ($topPestisida->nilai_vi ?? 0) - 0.1);
    $recommendedPupuk = $sortedPupuk
        ->filter(fn ($item) => (float) ($item->nilai_vi ?? 0) >= $pupukThreshold)->values();
    $recommendedPestisida = $sortedPestisida
        ->filter(fn ($item) => (float) ($item->nilai_vi ?? 0) >= $pestisidaThreshold)->values();
    $topScore = max((float) ($topPupuk->nilai_vi ?? 0), (float) ($topPestisida->nilai_vi ?? 0));
@endphp

<div class="batch-card p-3 p-lg-4 mb-4">
    <div class="row g-4">

        {{-- ── Left: Disease Info ──────────────────── --}}
        <div class="col-xl-4 col-lg-4">
            <div class="disease-sidebar">
                {{-- Image --}}
                @if($rekomendasi->penyakit->gambar_url)
                    <img src="{{ $rekomendasi->penyakit->gambar_url }}"
                         alt="{{ $rekomendasi->penyakit->nama }}"
                         class="disease-media">
                @else
                    <div class="media-empty">
                        <i class="bi bi-virus fs-2"></i>
                        <span style="font-size:.75rem; color:#94a3b8;">Tidak ada gambar</span>
                    </div>
                @endif

                {{-- Disease Name & Confidence --}}
                <div class="mt-3 mb-2 d-flex align-items-start justify-content-between gap-2">
                    <div>
                        <div class="text-muted" style="font-size:.72rem; font-weight:600; text-transform:uppercase; letter-spacing:.05em;">Penyakit Terpilih</div>
                        <div class="fw-bold" style="font-size:1.05rem; color:#0f172a; line-height:1.3;">
                            {{ $rekomendasi->penyakit->nama }}
                        </div>
                    </div>
                    <span class="badge text-bg-{{ ExpertSystemPresenter::confidenceTone($topScore) }} flex-shrink-0">
                        {{ ExpertSystemPresenter::confidenceLabel($topScore) }}
                    </span>
                </div>

                {{-- Confidence Bar --}}
                <div class="mb-1" style="font-size:.78rem; color:#64748b;">
                    Skor: {{ ExpertSystemPresenter::percent($topScore) }}
                </div>
                <x-expert-system.confidence-bar :value="$topScore" />

                {{-- Low confidence warning --}}
                @if(ExpertSystemPresenter::lowConfidenceMessage($topScore))
                <div class="alert alert-warning small mt-2 mb-0 py-2 px-3 rounded-3">
                    <i class="bi bi-exclamation-triangle me-1"></i>
                    {{ ExpertSystemPresenter::lowConfidenceMessage($topScore) }}
                </div>
                @endif

                {{-- Meta grid: fills the blank space below --}}
                <div class="disease-meta-grid">
                    <div class="disease-meta-item">
                        <div class="label">Pupuk</div>
                        <div class="value">{{ $recommendedPupuk->count() }} opsi</div>
                    </div>
                    <div class="disease-meta-item">
                        <div class="label">Pestisida</div>
                        <div class="value">{{ $recommendedPestisida->count() }} opsi</div>
                    </div>
                    @if($rekomendasi->penyakit->kode ?? null)
                    <div class="disease-meta-item full-width">
                        <div class="label">Kode Penyakit</div>
                        <div class="value">{{ $rekomendasi->penyakit->kode }}</div>
                    </div>
                    @endif
                </div>

                {{-- Gejala Cocok --}}
                @if(collect(data_get($rekomendasi, 'gejala_cocok', []))->isNotEmpty())
                <div class="mt-3">
                    <div class="section-label" style="font-size:.68rem;">
                        <i class="bi bi-check2-circle"></i> Gejala Cocok
                    </div>
                    <div class="symptom-badges">
                        @foreach(collect(data_get($rekomendasi, 'gejala_cocok', [])) as $gejala)
                        <span class="symptom-badge" style="font-size:.72rem;">
                            {{ data_get($gejala, 'kode') }}
                        </span>
                        @endforeach
                    </div>
                </div>
                @endif
            </div>
        </div>

        {{-- ── Right: Recommendations ───────────────── --}}
        <div class="col-xl-8 col-lg-8">

            {{-- Pupuk Section --}}
            @if($recommendedPupuk->isNotEmpty())
            <div class="section-label">
                <i class="bi bi-bag-fill text-success"></i> Rekomendasi Pupuk
            </div>
            <div class="row g-3 mb-4">
                @foreach($recommendedPupuk as $item)
                <div class="col-md-6 col-lg-4 d-flex">
                    <div class="product-card w-100">
                        {{-- Image --}}
                        @if(optional($item->pupuk)->gambar_url)
                            <img src="{{ $item->pupuk->gambar_url }}"
                                 alt="{{ $item->pupuk->nama }}"
                                 class="product-card-img">
                        @else
                            <div class="product-card-img-empty">
                                <i class="bi bi-bag"></i>
                            </div>
                        @endif

                        <div class="product-card-body">
                            <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                <span class="product-rank-badge {{ $item->peringkat == 1 ? 'rank-1' : '' }}">
                                    <i class="bi bi-award-fill"></i> #{{ $item->peringkat }}
                                </span>
                                @if($item->pupuk->kode ?? null)
                                <span class="badge bg-light text-secondary border" style="font-size:.68rem;">{{ $item->pupuk->kode }}</span>
                                @endif
                                @if($rekomendasi->preferensi_label)
                                <span class="badge bg-success-subtle text-success border border-success-subtle" style="font-size:.68rem;">
                                    <i class="bi bi-stars"></i> {{ $rekomendasi->preferensi_label }}
                                </span>
                                @endif
                            </div>
                            <div class="product-type-tag">Pupuk</div>
                            <div class="product-name">{{ $item->pupuk->nama ?? '-' }}</div>
                            <div class="product-desc">
                                {{ ExpertSystemPresenter::shortDescription(
                                    optional($item->pupuk)->fungsi_utama,
                                    optional($item->pupuk)->efek_penggunaan
                                ) }}
                            </div>
                            <div class="product-score-row">
                                <div class="score-bar-wrap">
                                    <div class="score-bar-fill {{ (float)$item->nilai_vi < 0.7 ? 'medium' : '' }}"
                                         style="width: {{ ExpertSystemPresenter::percent($item->nilai_vi) }}"></div>
                                </div>
                                <span class="score-label">{{ ExpertSystemPresenter::percent($item->nilai_vi) }}</span>
                                <span class="badge text-bg-{{ ExpertSystemPresenter::confidenceTone($item->nilai_vi) }}" style="font-size:.7rem;">
                                    {{ ExpertSystemPresenter::confidenceLabel($item->nilai_vi) }}
                                </span>
                            </div>
                        </div>

                        {{-- Detail Toggle --}}
                        <details class="detail-toggle">
                            <summary>
                                <span>Lihat Detail</span>
                                <span class="chevron"><i class="bi bi-chevron-down"></i></span>
                            </summary>
                            <div class="detail-panel">
                                <div class="fw-semibold mb-3" style="font-size:.85rem;">
                                    <i class="bi bi-info-circle me-1 text-success"></i>
                                    {{ $item->pupuk->nama ?? 'Pupuk' }}
                                </div>
                                <div class="detail-list">
                                    <div class="detail-row"><div class="dl">Kode</div><div class="dv">{{ $item->pupuk->kode ?? '-' }}</div></div>
                                    <div class="detail-row"><div class="dl">Peringkat</div><div class="dv">#{{ $item->peringkat ?? '-' }}</div></div>
                                    <div class="detail-row"><div class="dl">Skor</div><div class="dv">{{ number_format((float) $item->nilai_vi, 4) }}</div></div>
                                    <div class="detail-row"><div class="dl">Takaran</div><div class="dv">{{ $item->pupuk->takaran ?? '-' }}</div></div>
                                    <div class="detail-row"><div class="dl">Frekuensi</div><div class="dv">{{ $item->pupuk->frekuensi_aplikasi ?? '-' }}</div></div>
                                    <div class="detail-row"><div class="dl">Kandungan</div><div class="dv">{{ $item->pupuk->kandungan ?? '-' }}</div></div>
                                    <div class="detail-row span2"><div class="dl">Detail Kandungan</div><div class="dv">{{ $item->pupuk->kandungan_detail ?? '-' }}</div></div>
                                    <div class="detail-row span2"><div class="dl">Fungsi Utama</div><div class="dv">{{ $item->pupuk->fungsi_utama ?? '-' }}</div></div>
                                    <div class="detail-row span2"><div class="dl">Efek Penggunaan</div><div class="dv">{{ $item->pupuk->efek_penggunaan ?? '-' }}</div></div>
                                    <div class="detail-row span2"><div class="dl">Cara Aplikasi</div><div class="dv">{{ $item->pupuk->cara_aplikasi ?? '-' }}</div></div>
                                    <div class="detail-row full"><div class="dl">Jadwal / Umur</div><div class="dv">{{ $item->pupuk->jadwal_umur_aplikasi ?? '-' }}</div></div>
                                </div>
                                @if(collect($item->pupuk->gejala_cocok ?? [])->isNotEmpty())
                                <div class="mt-3">
                                    <div class="section-label" style="font-size:.68rem; margin-bottom:8px;">
                                        <i class="bi bi-link-45deg"></i> Gejala Didukung
                                    </div>
                                    <div class="symptom-badges">
                                        @foreach(collect($item->pupuk->gejala_cocok ?? []) as $gejalaItem)
                                        <span class="symptom-badge" style="font-size:.72rem;">
                                            {{ data_get($gejalaItem, 'kode') ? data_get($gejalaItem, 'kode') . ' · ' : '' }}{{ data_get($gejalaItem, 'nama_gejala') }}
                                        </span>
                                        @endforeach
                                    </div>
                                </div>
                                @else
                                <p class="small text-muted mt-2 mb-0">Belum ada gejala yang terhubung.</p>
                                @endif
                            </div>
                        </details>
                    </div>
                </div>
                @endforeach
            </div>
            @endif

            {{-- Pestisida Section --}}
            @if($recommendedPestisida->isNotEmpty())
            <div class="section-label">
                <i class="bi bi-shield-fill-check text-warning"></i> Rekomendasi Pestisida
            </div>
            <div class="row g-3">
                @foreach($recommendedPestisida as $item)
                <div class="col-md-6 col-lg-4 d-flex">
                    <div class="product-card w-100">
                        {{-- Image --}}
                        @if(optional($item->pestisida)->gambar_url)
                            <img src="{{ $item->pestisida->gambar_url }}"
                                 alt="{{ $item->pestisida->nama }}"
                                 class="product-card-img">
                        @else
                            <div class="product-card-img-empty">
                                <i class="bi bi-shield"></i>
                            </div>
                        @endif

                        <div class="product-card-body">
                            <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                                <span class="product-rank-badge {{ $item->peringkat == 1 ? 'rank-1' : '' }}">
                                    <i class="bi bi-award-fill"></i> #{{ $item->peringkat }}
                                </span>
                                @if($item->pestisida->kode ?? null)
                                <span class="badge bg-light text-secondary border" style="font-size:.68rem;">{{ $item->pestisida->kode }}</span>
                                @endif
                                @if($rekomendasi->preferensi_label)
                                <span class="badge bg-success-subtle text-success border border-success-subtle" style="font-size:.68rem;">
                                    <i class="bi bi-stars"></i> {{ $rekomendasi->preferensi_label }}
                                </span>
                                @endif
                            </div>
                            <div class="product-type-tag">Pestisida</div>
                            <div class="product-name">{{ $item->pestisida->nama ?? '-' }}</div>
                            <div class="product-desc">
                                {{ ExpertSystemPresenter::shortDescription(
                                    optional($item->pestisida)->fungsi,
                                    optional($item->pestisida)->efek_penggunaan
                                ) }}
                            </div>
                            <div class="product-score-row">
                                <div class="score-bar-wrap">
                                    <div class="score-bar-fill {{ (float)$item->nilai_vi < 0.7 ? 'medium' : '' }}"
                                         style="width: {{ ExpertSystemPresenter::percent($item->nilai_vi) }}"></div>
                                </div>
                                <span class="score-label">{{ ExpertSystemPresenter::percent($item->nilai_vi) }}</span>
                                <span class="badge text-bg-{{ ExpertSystemPresenter::confidenceTone($item->nilai_vi) }}" style="font-size:.7rem;">
                                    {{ ExpertSystemPresenter::confidenceLabel($item->nilai_vi) }}
                                </span>
                            </div>
                        </div>

                        {{-- Detail Toggle --}}
                        <details class="detail-toggle">
                            <summary>
                                <span>Lihat Detail</span>
                                <span class="chevron"><i class="bi bi-chevron-down"></i></span>
                            </summary>
                            <div class="detail-panel">
                                <div class="fw-semibold mb-3" style="font-size:.85rem;">
                                    <i class="bi bi-info-circle me-1 text-warning"></i>
                                    {{ $item->pestisida->nama ?? 'Pestisida' }}
                                </div>
                                <div class="detail-list">
                                    <div class="detail-row"><div class="dl">Kode</div><div class="dv">{{ $item->pestisida->kode ?? '-' }}</div></div>
                                    <div class="detail-row"><div class="dl">Peringkat</div><div class="dv">#{{ $item->peringkat ?? '-' }}</div></div>
                                    <div class="detail-row"><div class="dl">Skor</div><div class="dv">{{ number_format((float) $item->nilai_vi, 4) }}</div></div>
                                    <div class="detail-row"><div class="dl">Dosis</div><div class="dv">{{ $item->pestisida->dosis ?? '-' }}</div></div>
                                    <div class="detail-row"><div class="dl">Frekuensi</div><div class="dv">{{ $item->pestisida->frekuensi_aplikasi ?? '-' }}</div></div>
                                    <div class="detail-row span2"><div class="dl">Bahan Aktif</div><div class="dv">{{ $item->pestisida->bahan_aktif ?? '-' }}</div></div>
                                    <div class="detail-row span2"><div class="dl">Fungsi</div><div class="dv">{{ $item->pestisida->fungsi ?? '-' }}</div></div>
                                    <div class="detail-row span2"><div class="dl">Efek Penggunaan</div><div class="dv">{{ $item->pestisida->efek_penggunaan ?? '-' }}</div></div>
                                    <div class="detail-row span2"><div class="dl">Cara Aplikasi</div><div class="dv">{{ $item->pestisida->cara_aplikasi ?? '-' }}</div></div>
                                    <div class="detail-row full"><div class="dl">Jadwal / Umur</div><div class="dv">{{ $item->pestisida->jadwal_umur_aplikasi ?? '-' }}</div></div>
                                </div>
                                @if(collect($item->pestisida->gejala_cocok ?? [])->isNotEmpty())
                                <div class="mt-3">
                                    <div class="section-label" style="font-size:.68rem; margin-bottom:8px;">
                                        <i class="bi bi-link-45deg"></i> Gejala Didukung
                                    </div>
                                    <div class="symptom-badges">
                                        @foreach(collect($item->pestisida->gejala_cocok ?? []) as $gejalaItem)
                                        <span class="symptom-badge" style="font-size:.72rem;">
                                            {{ data_get($gejalaItem, 'kode') ? data_get($gejalaItem, 'kode') . ' · ' : '' }}{{ data_get($gejalaItem, 'nama_gejala') }}
                                        </span>
                                        @endforeach
                                    </div>
                                </div>
                                @else
                                <p class="small text-muted mt-2 mb-0">Belum ada gejala yang terhubung.</p>
                                @endif
                            </div>
                        </details>
                    </div>
                </div>
                @endforeach
            </div>
            @endif

        </div>{{-- end right col --}}
    </div>{{-- end row --}}
</div>{{-- end batch-card --}}
@endforeach

{{-- ── Action Bar ─────────────────────────────────────── --}}
<div class="action-bar">
    @if($isPreview)
    <a href="{{ route('login') }}" class="btn btn-outline-success">
        <i class="bi bi-box-arrow-in-right me-1"></i>Login untuk Simpan
    </a>
    <a href="{{ route('user.rekomendasi.preview.cetak') }}" target="_blank" class="btn btn-outline-secondary">
        <i class="bi bi-printer me-1"></i>Cetak Hasil
    </a>
    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-success">
        <i class="bi bi-arrow-repeat me-1"></i>Diagnosis Lagi
    </a>
    @else
    <a href="{{ route('user.riwayat.index') }}" class="btn btn-outline-secondary">
        <i class="bi bi-clock-history me-1"></i>Lihat Riwayat
    </a>
    @endif
</div>

@guest
</div>
@endguest

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function () {
    // Attach ke setiap summary langsung — toggle event tidak bubble di semua browser
    document.querySelectorAll('.detail-toggle > summary').forEach(function (summary) {
        summary.addEventListener('click', function (e) {
            var thisDetails = summary.parentElement;
            var card = thisDetails.closest('.batch-card');
            if (!card) return;

            // Jika sedang tertutup (akan dibuka), tutup semua yang lain
            if (!thisDetails.open) {
                card.querySelectorAll('.detail-toggle').forEach(function (d) {
                    if (d !== thisDetails) {
                        d.removeAttribute('open');
                    }
                });
            }
        });
    });
});
</script>
@endpush
@endsection