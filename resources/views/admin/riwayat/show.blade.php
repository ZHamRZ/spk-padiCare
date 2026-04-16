@extends('layouts.app')

@section('title', 'Detail Riwayat')
@section('page-title', 'Detail Riwayat')

@section('content')
<div class="row g-4">
    <div class="col-lg-4">
        <div class="card">
            <div class="card-header">Informasi Rekomendasi</div>
            <div class="card-body">
                <p class="mb-2"><strong>Pengguna:</strong> {{ $rekomendasi->user->nama ?? '-' }}</p>
                <p class="mb-2"><strong>Username:</strong> {{ $rekomendasi->user->username ?? '-' }}</p>
                <p class="mb-2"><strong>Penyakit:</strong> {{ $rekomendasi->penyakit->nama ?? '-' }}</p>
                <p class="mb-0"><strong>Tanggal:</strong> {{ optional($rekomendasi->created_at)->format('d M Y H:i') }}</p>
            </div>
        </div>
    </div>
    <div class="col-lg-8">
        <div class="card mb-4">
            <div class="card-header">Ranking Pupuk</div>
            <div class="card-body p-0">
                <table class="table table-striped mb-0">
                    <thead><tr><th>Peringkat</th><th>Nama</th><th>Nilai Vi</th></tr></thead>
                    <tbody>
                        @foreach($rekomendasi->detailPupuk as $item)
                        <tr>
                            <td>{{ $item->peringkat }}</td>
                            <td>{{ $item->pupuk->nama ?? '-' }}</td>
                            <td>{{ number_format($item->nilai_vi, 6) }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        <div class="card">
            <div class="card-header">Ranking Pestisida</div>
            <div class="card-body p-0">
                <table class="table table-striped mb-0">
                    <thead><tr><th>Peringkat</th><th>Nama</th><th>Nilai Vi</th></tr></thead>
                    <tbody>
                        @foreach($rekomendasi->detailPestisida as $item)
                        <tr>
                            <td>{{ $item->peringkat }}</td>
                            <td>{{ $item->pestisida->nama ?? '-' }}</td>
                            <td>{{ number_format($item->nilai_vi, 6) }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        <div class="mt-3">
            <a href="{{ route('admin.riwayat.detail', $rekomendasi->id) }}" class="btn btn-outline-success">Lihat Detail Perhitungan SAW</a>
        </div>
    </div>
</div>
@endsection
