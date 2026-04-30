@extends('layouts.app')

@section('title', 'Parameter Prioritas')
@section('page-title', 'Parameter Prioritas')

@section('content')
<div class="row g-4">
    <div class="col-12">
        @if(session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        @endif
        @if(session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        @endif
    </div>
</div>

<form action="{{ route('admin.kriteria.updateBulk') }}" method="POST">
    @csrf
    <div class="row g-4">
        <div class="col-xl-8">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <span>Daftar Parameter Preferensi Pengguna</span>
                    <button type="submit" class="btn btn-spk btn-sm">Simpan Semua Perubahan</button>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0 align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th style="width: 80px;">Kode</th>
                                    <th>Nama Parameter</th>
                                    <th style="width: 120px;">Jenis</th>
                                    <th style="width: 130px;">Faktor Dasar</th>
                                    <th>Keterangan</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse($kriteria as $item)
                                <tr>
                                    <td><span class="badge text-bg-info">{{ $item->kode }}</span></td>
                                    <td>
                                        <input type="text" name="kriteria[{{ $item->id }}][nama]" 
                                               value="{{ old('kriteria.'.$item->id.'.nama', $item->nama) }}" 
                                               class="form-control form-control-sm" required>
                                    </td>
                                    <td>
                                        <select name="kriteria[{{ $item->id }}][jenis]" class="form-select form-select-sm">
                                            <option value="benefit" {{ old('kriteria.'.$item->id.'.jenis', $item->jenis) === 'benefit' ? 'selected' : '' }}>Benefit</option>
                                            <option value="cost" {{ old('kriteria.'.$item->id.'.jenis', $item->jenis) === 'cost' ? 'selected' : '' }}>Cost</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" step="0.01" min="0" max="1" 
                                               name="kriteria[{{ $item->id }}][bobot]" 
                                               value="{{ old('kriteria.'.$item->id.'.bobot', $item->bobot) }}" 
                                               class="form-control form-control-sm" required>
                                    </td>
                                    <td>
                                        <input type="text" name="kriteria[{{ $item->id }}][keterangan]" 
                                               value="{{ old('kriteria.'.$item->id.'.keterangan', $item->keterangan) }}" 
                                               class="form-control form-control-sm" placeholder="Opsional">
                                    </td>
                                </tr>
                                @empty
                                <tr><td colspan="5" class="text-center py-4 text-muted">Belum ada parameter prioritas.</td></tr>
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
                    <hr>
                    <h6 class="fw-bold">Cara Menggunakan:</h6>
                    <ol class="small mb-0">
                        <li>Edit langsung nilai di tabel sebelah kiri</li>
                        <li>Ubah nama, jenis (benefit/cost), faktor dasar (0-1), dan keterangan</li>
                        <li>Klik tombol <strong>"Simpan Semua Perubahan"</strong> untuk menyimpan</li>
                        <li>Atau gunakan tombol Edit untuk mengubah satu parameter secara detail</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</form>

<div class="row g-4 mt-2">
    <div class="col-12">
        <div class="card">
            <div class="card-header">Edit Detail Per Parameter</div>
            <div class="card-body">
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
                                <td class="text-end"><a href="{{ route('admin.kriteria.edit', $item) }}" class="btn btn-sm btn-outline-primary">Edit Detail</a></td>
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
</div>
@endsection
