@extends('layouts.app')

@section('title', 'Riwayat Rekomendasi')
@section('page-title', 'Riwayat Rekomendasi')

@push('styles')
<style>
    .history-card {
        border: 1px solid #e2e8f0;
        border-radius: 22px;
        background: #fff;
        box-shadow: 0 14px 35px rgba(15, 23, 42, 0.04);
    }
</style>
@endpush

@section('content')
<div class="row g-4">
    @forelse($riwayat as $item)
    <div class="col-xl-6">
        <div class="history-card p-4 h-100">
            <div class="d-flex justify-content-between align-items-start gap-3 mb-3">
                <div>
                    <div class="small text-muted">Pengguna</div>
                    <div class="fw-bold">{{ $item->user->nama ?? '-' }}</div>
                    <div class="small text-muted">{{ optional($item->created_at)->format('d M Y H:i') }}</div>
                </div>
                <span class="badge bg-light text-dark border">{{ $item->preferensi_label ?: 'Analisis Sistem Pakar' }}</span>
            </div>

            <h5 class="fw-bold mb-1">{{ $item->penyakit->nama ?? '-' }}</h5>
            <div class="small text-muted mb-3">{{ $item->penyakit->kode ?? 'Kode tidak tersedia' }}</div>

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
                <a href="{{ route('admin.riwayat.show', $item->id) }}" class="btn btn-outline-success">Lihat Ringkasan</a>
                <a href="{{ route('admin.riwayat.detail', $item->id) }}" class="btn btn-outline-secondary">Lihat Detail Analisis</a>
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
