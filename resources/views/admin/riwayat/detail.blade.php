@extends('layouts.app')

@section('title', 'Detail Perhitungan SAW')
@section('page-title', 'Detail Perhitungan SAW')

@section('content')
<div class="card mb-4">
    <div class="card-header">Informasi Perhitungan</div>
    <div class="card-body">
        <div class="row g-3">
            <div class="col-md-6">
                <p class="mb-2"><strong>Pengguna:</strong> {{ $rekomendasi->user->nama ?? '-' }}</p>
                <p class="mb-2"><strong>Username:</strong> {{ $rekomendasi->user->username ?? '-' }}</p>
                <p class="mb-2"><strong>Penyakit:</strong> {{ $rekomendasi->penyakit->nama ?? '-' }}</p>
                @if($rekomendasi->preferensi_label)
                <p class="mb-0"><strong>Preferensi user:</strong> {{ $rekomendasi->preferensi_label }}</p>
                @endif
            </div>
            <div class="col-md-6">
                <div class="border rounded p-3 h-100">
                    <div><strong>Benefit:</strong> <span class="small text-muted">{{ $preview['rumus']['benefit'] }}</span></div>
                    <div><strong>Cost:</strong> <span class="small text-muted">{{ $preview['rumus']['cost'] }}</span></div>
                    <div><strong>Preferensi:</strong> <span class="small text-muted">{{ $preview['rumus']['preferensi'] }}</span></div>
                    <div><strong>Bobot adaptif:</strong> <span class="small text-muted">{{ $preview['rumus']['bobot_preferensi'] }}</span></div>
                </div>
            </div>
        </div>
    </div>
</div>

@foreach(['pupuk' => 'Pupuk', 'pestisida' => 'Pestisida'] as $key => $label)
<div class="card mb-4">
    <div class="card-header">{{ $label }} - Detail SAW</div>
    <div class="card-body">
        <div class="table-responsive mb-4">
            <table class="table table-bordered align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Peringkat</th>
                        <th>Kode</th>
                        <th>Nama</th>
                        <th>Nilai Vi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach($preview[$key] as $item)
                    <tr class="{{ $item['peringkat'] === 1 ? 'table-success' : '' }}">
                        <td>{{ $item['peringkat'] }}</td>
                        <td>{{ $item['kode'] }}</td>
                        <td>{{ $item['nama'] }}</td>
                        <td>{{ number_format($item['vi'], 6) }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        @foreach($preview[$key] as $item)
        <div class="border rounded p-3 mb-3">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div>
                    <h5 class="fw-bold mb-1">{{ $item['kode'] }} - {{ $item['nama'] }}</h5>
                    <div class="small text-muted">Nilai preferensi akhir: {{ number_format($item['vi'], 6) }}</div>
                </div>
                <span class="badge {{ $item['peringkat'] === 1 ? 'text-bg-success' : 'text-bg-secondary' }}">Peringkat {{ $item['peringkat'] }}</span>
            </div>
            <div class="table-responsive">
                <table class="table table-sm table-striped align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Kriteria</th>
                            <th>Jenis</th>
                            <th>xij</th>
                            <th>Min</th>
                            <th>Max</th>
                            <th>Prioritas User</th>
                            <th>Bobot Awal</th>
                            <th>Bobot Final</th>
                            <th>Rumus</th>
                            <th>rij</th>
                            <th>wj x rij</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($item['detail'] as $kode => $detail)
                        <tr>
                            <td><strong>{{ $kode }}</strong><br><span class="small text-muted">{{ $detail['kriteria'] }}</span></td>
                            <td>{{ ucfirst($detail['jenis']) }}</td>
                            <td>{{ number_format($detail['xij'], 2) }}</td>
                            <td>{{ number_format($detail['min'], 2) }}</td>
                            <td>{{ number_format($detail['max'], 2) }}</td>
                            <td>{{ $detail['preferensi_user'] }}/5</td>
                            <td>{{ number_format($detail['bobot_awal'], 2) }}</td>
                            <td>{{ number_format($detail['bobot_final'], 6) }}</td>
                            <td class="small">{{ $detail['formula_normalisasi'] }}</td>
                            <td>{{ number_format($detail['rij'], 6) }}</td>
                            <td>{{ number_format($detail['wj_rij'], 6) }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        @endforeach
    </div>
</div>
@endforeach

<a href="{{ route('admin.riwayat.show', $rekomendasi->id) }}" class="btn btn-outline-secondary">Kembali ke Detail Riwayat</a>
@endsection
