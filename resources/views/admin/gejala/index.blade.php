@extends('layouts.app')

@section('title', 'Data Gejala')
@section('page-title', 'Data Gejala')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h4 class="fw-bold mb-1">Kelola Data Gejala</h4>
        <p class="text-muted mb-0">Susun gejala yang akan dipakai untuk identifikasi penyakit tanaman padi.</p>
    </div>
    <a href="{{ route('admin.gejala.create') }}" class="btn btn-spk">
        <i class="bi bi-plus-circle me-1"></i> Tambah Gejala
    </a>
</div>

<div class="card">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Kode</th>
                        <th>Nama Gejala</th>
                        <th>Terkait Penyakit</th>
                        <th class="text-end">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($gejala as $item)
                    <tr>
                        <td><span class="badge text-bg-success">{{ $item->kode }}</span></td>
                        <td>{{ $item->nama_gejala }}</td>
                        <td>{{ $item->penyakit_count }} penyakit</td>
                        <td class="text-end">
                            <a href="{{ route('admin.gejala.edit', $item) }}" class="btn btn-sm btn-outline-primary">Edit</a>
                            <form action="{{ route('admin.gejala.destroy', $item) }}" method="POST" class="d-inline"
                                onsubmit="return confirm('Hapus gejala ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-outline-danger">Hapus</button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4" class="text-center py-4 text-muted">Belum ada data gejala.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    @if($gejala->hasPages())
    <div class="card-footer">{{ $gejala->links() }}</div>
    @endif
</div>
@endsection
