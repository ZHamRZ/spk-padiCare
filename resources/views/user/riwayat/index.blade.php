@extends('layouts.app')

@section('title', 'Riwayat Saya')
@section('page-title', 'Riwayat Saya')

@section('content')
<div class="card">
    <div class="card-header">Riwayat Rekomendasi Saya</div>
    <div class="card-body p-0">
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
                    @forelse($riwayat as $item)
                    <tr>
                        <td>{{ optional($item->created_at)->format('d M Y H:i') }}</td>
                        <td>{{ $item->penyakit->nama ?? '-' }}</td>
                        <td>{{ optional(optional($item->detailPupuk->sortBy('peringkat')->first())->pupuk)->nama ?: '-' }}</td>
                        <td>{{ optional(optional($item->detailPestisida->sortBy('peringkat')->first())->pestisida)->nama ?: '-' }}</td>
                        <td class="text-end">
                            <a href="{{ route('user.rekomendasi.show', $item->id) }}" class="btn btn-sm btn-outline-success">Lihat</a>
                            <a href="{{ route('user.rekomendasi.cetak', $item->id) }}" target="_blank" class="btn btn-sm btn-outline-secondary">Cetak</a>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="5" class="text-center py-4 text-muted">Belum ada riwayat rekomendasi.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    @if($riwayat->hasPages())
    <div class="card-footer">{{ $riwayat->links() }}</div>
    @endif
</div>
@endsection
