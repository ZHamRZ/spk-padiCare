@extends('layouts.app')

@section('title', 'Data Pestisida')
@section('page-title', 'Data Pestisida')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h4 class="fw-bold mb-1">Kelola Data Pestisida</h4>
        <p class="text-muted mb-0">Data pestisida dipakai sebagai alternatif rekomendasi pengendalian.</p>
    </div>
    <a href="{{ route('admin.pestisida.create') }}" class="btn btn-spk">Tambah Pestisida</a>
</div>

<div class="card">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover mb-0 align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Gambar</th>
                        <th>Kode</th>
                        <th>Nama</th>
                        <th>Info Teknis</th>
                        <th>Harga</th>
                        <th class="text-end">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($pestisida as $item)
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
                        <td><span class="badge text-bg-warning">{{ $item->kode }}</span></td>
                        <td>
                            <div class="fw-semibold">{{ $item->nama }}</div>
                            <div class="small mt-1"><span class="badge bg-{{ $item->jenis_badge }}">{{ ucfirst($item->jenis) }}</span></div>
                        </td>
                        <td>
                            <div class="small"><strong>Bahan aktif:</strong> {{ $item->bahan_aktif ?: '-' }}</div>
                            <div class="small"><strong>Takaran:</strong> {{ $item->takaran ?: ($item->dosis ?: '-') }}</div>
                            <div class="small"><strong>Jadwal:</strong> {{ $item->jadwal_umur_aplikasi ?: '-' }}</div>
                        </td>
                        <td>{{ $item->harga_formatted }}/{{ $item->satuan_harga }}</td>
                        <td class="text-end">
                            <a href="{{ route('admin.pestisida.edit', $item) }}" class="btn btn-sm btn-outline-primary">Edit</a>
                            <form action="{{ route('admin.pestisida.destroy', $item) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus data pestisida ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-outline-danger">Hapus</button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="6" class="text-center py-4 text-muted">Belum ada data pestisida.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    @if($pestisida->hasPages())
    <div class="card-footer">{{ $pestisida->links() }}</div>
    @endif
</div>
@endsection
