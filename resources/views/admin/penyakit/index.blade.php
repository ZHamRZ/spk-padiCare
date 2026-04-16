@extends('layouts.app')

@section('title', 'Data Penyakit')
@section('page-title', 'Data Penyakit')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h4 class="fw-bold mb-1">Kelola Data Penyakit</h4>
        <p class="text-muted mb-0">Hubungkan penyakit dengan gejala agar identifikasi berjalan akurat.</p>
    </div>
    <a href="{{ route('admin.penyakit.create') }}" class="btn btn-spk">
        <i class="bi bi-plus-circle me-1"></i> Tambah Penyakit
    </a>
</div>

<div class="card">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Gambar</th>
                        <th>Kode</th>
                        <th>Nama Penyakit</th>
                        <th>Jumlah Gejala</th>
                        <th>Deskripsi</th>
                        <th class="text-end">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($penyakit as $item)
                    <tr>
                        <td>
                            @if($item->gambar_url)
                            <img src="{{ $item->gambar_url }}" alt="{{ $item->nama }}" style="width:56px;height:56px;object-fit:cover;border-radius:10px;">
                            @else
                            <div class="bg-light text-muted d-flex align-items-center justify-content-center" style="width:56px;height:56px;border-radius:10px;">
                                <i class="bi bi-image"></i>
                            </div>
                            @endif
                        </td>
                        <td><span class="badge text-bg-danger">{{ $item->kode }}</span></td>
                        <td>{{ $item->nama }}</td>
                        <td>{{ $item->gejala_count }} gejala</td>
                        <td class="small text-muted">{{ \Illuminate\Support\Str::limit($item->deskripsi, 80) ?: '-' }}</td>
                        <td class="text-end">
                            <a href="{{ route('admin.penyakit.edit', $item) }}" class="btn btn-sm btn-outline-primary">Edit</a>
                            <form action="{{ route('admin.penyakit.destroy', $item) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus penyakit ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-outline-danger">Hapus</button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="6" class="text-center py-4 text-muted">Belum ada data penyakit.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    @if($penyakit->hasPages())
    <div class="card-footer">{{ $penyakit->links() }}</div>
    @endif
</div>
@endsection
