@extends('layouts.app')

@section('title', 'Riwayat Saya')
@section('page-title', 'Riwayat Saya')

@push('styles')
<style>
    .history-card {
        border: 1px solid #e2e8f0;
        border-radius: 22px;
        background: #fff;
        box-shadow: 0 14px 35px rgba(15, 23, 42, 0.04);
    }

    .history-disease-image,
    .history-disease-empty {
        width: 70px;
        height: 70px;
        border-radius: 18px;
        flex-shrink: 0;
    }

    .history-disease-image {
        object-fit: cover;
        background: #f8fafc;
    }

    .history-disease-empty {
        background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
        color: #94a3b8;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }
</style>
@endpush

@section('content')
<div class="row g-4">
    @forelse($riwayat as $item)
    <div class="col-xl-6">
        <div class="history-card p-4 h-100">
            <div class="d-flex justify-content-between align-items-start gap-3 mb-3">
                <div class="d-flex align-items-center gap-3">
                    @if(optional($item->penyakit)->gambar_url)
                    <img src="{{ $item->penyakit->gambar_url }}" alt="{{ $item->penyakit->nama }}" class="history-disease-image">
                    @else
                    <div class="history-disease-empty">
                        <i class="bi bi-virus fs-4"></i>
                    </div>
                    @endif
                    <div>
                        <div class="small text-muted">Penyakit utama</div>
                        <div class="fw-bold">{{ $item->penyakit->nama ?? '-' }}</div>
                        <div class="small text-muted">{{ $item->penyakit->kode ?? 'Kode tidak tersedia' }}</div>
                    </div>
                </div>
                <span class="badge bg-light text-dark border">{{ $item->preferensi_label ?: 'Analisis Sistem Pakar' }}</span>
            </div>

            <div class="small text-muted mb-3">Tanggal analisis: {{ optional($item->created_at)->format('d M Y H:i') }}</div>

            <div class="row g-3 mb-4">
                <div class="col-6">
                    <div class="border rounded-4 p-3 h-100">
                        <div class="small text-muted">Pupuk utama</div>
                        <div class="fw-semibold">{{ optional(optional($item->detailPupuk->sortBy('peringkat')->first())->pupuk)->nama ?: '-' }}</div>
                    </div>
                </div>
                <div class="col-6">
                    <div class="border rounded-4 p-3 h-100">
                        <div class="small text-muted">Pestisida utama</div>
                        <div class="fw-semibold">{{ optional(optional($item->detailPestisida->sortBy('peringkat')->first())->pestisida)->nama ?: '-' }}</div>
                    </div>
                </div>
            </div>

            <div class="d-flex flex-wrap gap-2">
                <a href="{{ route('user.rekomendasi.show', $item->id) }}" class="btn btn-outline-success">Lihat Detail</a>
                <a href="{{ route('user.rekomendasi.cetak', $item->id) }}" target="_blank" class="btn btn-outline-secondary">Cetak</a>
            </div>
        </div>
    </div>
    @empty
    <div class="col-12">
        <div class="card">
            <div class="card-body text-center py-5 text-muted">Belum ada riwayat rekomendasi.</div>
        </div>
    </div>
    @endforelse
</div>

@if($riwayat->hasPages())
<div class="mt-4">{{ $riwayat->links() }}</div>
@endif
@endsection
