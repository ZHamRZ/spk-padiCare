@extends('layouts.app')

@section('title', 'Parameter Prioritas')
@section('page-title', 'Parameter Prioritas')

@section('content')
<div class="row g-4">
    <div class="col-xl-8">
        <div class="card">
            <div class="card-header">Daftar Parameter Preferensi Pengguna</div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0 align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Kode</th>
                                <th>Nama</th>
                                <th>Jenis</th>
                                <th>Faktor Dasar</th>
                                <th>Keterangan</th>
                                <th class="text-end">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($kriteria as $item)
                            <tr>
                                <td><span class="badge text-bg-info">{{ $item->kode }}</span></td>
                                <td>{{ $item->nama }}</td>
                                <td><span class="badge {{ $item->jenis === 'benefit' ? 'text-bg-success' : 'text-bg-warning' }}">{{ ucfirst($item->jenis) }}</span></td>
                                <td>{{ number_format($item->bobot, 2) }}</td>
                                <td class="small text-muted">{{ $item->keterangan ?: '-' }}</td>
                                <td class="text-end"><a href="{{ route('admin.kriteria.edit', $item) }}" class="btn btn-sm btn-outline-primary">Edit</a></td>
                            </tr>
                            @empty
                            <tr><td colspan="6" class="text-center py-4 text-muted">Belum ada parameter prioritas.</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4">
        <div class="card h-100">
            <div class="card-header">Panduan Parameter</div>
            <div class="card-body">
                <div class="display-6 fw-bold text-success">{{ number_format($averageBobot, 2) }}</div>
                <p class="text-muted">Nilai ini menunjukkan rata-rata faktor dasar yang dipakai saat pengguna memilih prioritas atau mode custom.</p>
                <div class="alert alert-info">
                    Pada pendekatan CF, parameter ini dipakai sebagai dasar pengaruh rule saat sistem menyesuaikan rekomendasi dengan prioritas pengguna.
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
