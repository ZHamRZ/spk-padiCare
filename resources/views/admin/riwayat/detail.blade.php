@extends('layouts.app')

@section('title', 'Detail Analisis')
@section('page-title', 'Detail Analisis')

@section('content')
<div class="card mb-4">
    <div class="card-header">Informasi Analisis</div>
    <div class="card-body">
        <div class="row g-3">
            <div class="col-md-6">
                <p class="mb-2"><strong>Pengguna:</strong> {{ $rekomendasi->user->nama ?? '-' }}</p>
                <p class="mb-2"><strong>No. HP:</strong> {{ $rekomendasi->user->no_telp ?? '-' }}</p>
                <p class="mb-2"><strong>Penyakit:</strong> {{ $rekomendasi->penyakit->nama ?? '-' }}</p>
                @if($rekomendasi->preferensi_label)
                <p class="mb-0"><strong>Prioritas pengguna:</strong> {{ $rekomendasi->preferensi_label }}</p>
                @endif
            </div>
            <div class="col-md-6">
                <div class="border rounded-4 p-3 h-100">
                    <div class="fw-semibold mb-2">Catatan</div>
                    <div class="small text-muted">
                        Halaman ini menampilkan detail teknis yang dipakai sistem untuk menyusun skor akhir setiap alternatif.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@foreach(['pupuk' => 'Pupuk', 'pestisida' => 'Pestisida'] as $key => $label)
<div class="card mb-4">
    <div class="card-header">{{ $label }} - Detail Analisis</div>
    <div class="card-body">
        <div class="table-responsive mb-4">
            <table class="table table-bordered align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Peringkat</th>
                        <th>Kode</th>
                        <th>Nama</th>
                        <th>Skor Akhir</th>
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
        <x-expert-system.advanced-details target="admin-detail-{{ $key }}-{{ $loop->index }}" button-label="{{ $item['kode'] }} - {{ $item['nama'] }}">
            <div class="table-responsive">
                <table class="table table-sm table-striped align-middle mb-0">
                    <thead class="table-light">
                        <tr>
                            <th>Rule</th>
                            <th>Jenis</th>
                            <th>Preferensi user</th>
                            <th>MB tambahan</th>
                            <th>MD tambahan</th>
                            <th>Dampak</th>
                            <th>Catatan</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($item['detail'] as $kode => $detail)
                        <tr>
                            <td><strong>{{ $kode }}</strong><br><span class="small text-muted">{{ $detail['kriteria'] }}</span></td>
                            <td>{{ ucfirst($detail['jenis'] ?? '-') }}</td>
                            <td>{{ is_null($detail['preferensi_user'] ?? null) ? '-' : ($detail['preferensi_user'] . '%') }}</td>
                            <td>{{ number_format((float) ($detail['mb_bonus'] ?? 0), 4) }}</td>
                            <td>{{ number_format((float) ($detail['md_bonus'] ?? 0), 4) }}</td>
                            <td>{{ number_format((float) ($detail['impact'] ?? 0), 4) }}</td>
                            <td class="small text-muted">{{ $detail['catatan'] ?? '-' }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <div class="small text-muted mt-3">
                CF dasar: {{ number_format(data_get($item, 'cf_meta.cf_awal', 0), 4) }},
                CF akhir: {{ number_format(data_get($item, 'cf_meta.cf_akhir', $item['vi']), 4) }}.
            </div>
        </x-expert-system.advanced-details>
        @endforeach
    </div>
</div>
@endforeach
@endsection
