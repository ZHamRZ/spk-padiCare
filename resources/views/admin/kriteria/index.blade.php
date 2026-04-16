@extends('layouts.app')

@section('title', 'Kriteria & Bobot')
@section('page-title', 'Kriteria & Bobot')

@section('content')
<div class="row g-4">
    <div class="col-xl-8">
        <div class="card">
            <div class="card-header">Daftar Kriteria SAW</div>
            <div class="card-body p-0">
                <div class="table-responsive">
                    <table class="table table-hover mb-0 align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Kode</th>
                                <th>Nama</th>
                                <th>Jenis</th>
                                <th>Bobot</th>
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
                            <tr><td colspan="6" class="text-center py-4 text-muted">Belum ada data kriteria.</td></tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-4">
        <div class="card h-100">
            <div class="card-header">Validasi Bobot</div>
            <div class="card-body">
                <div class="display-6 fw-bold {{ abs($totalBobot - 1) < 0.001 ? 'text-success' : 'text-warning' }}">{{ number_format($totalBobot, 2) }}</div>
                <p class="text-muted">Total bobot ideal adalah <strong>1.00</strong> sesuai metode SAW.</p>
                <div class="alert {{ abs($totalBobot - 1) < 0.001 ? 'alert-success' : 'alert-warning' }}">
                    {{ abs($totalBobot - 1) < 0.001 ? 'Bobot siap dipakai untuk perhitungan.' : 'Bobot belum seimbang. Silakan sesuaikan agar totalnya 1.00.' }}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
