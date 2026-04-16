@extends('layouts.app')

@section('title', 'Data Pupuk')
@section('page-title', 'Data Pupuk')

@section('content')
<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h4 class="fw-bold mb-1">Kelola Data Pupuk</h4>
        <p class="text-muted mb-0">Alternatif pupuk akan dipakai dalam proses perhitungan SAW.</p>
    </div>
    <a href="{{ route('admin.pupuk.create') }}" class="btn btn-spk">Tambah Pupuk</a>
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
                    @forelse($pupuk as $item)
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
                        <td><span class="badge text-bg-success">{{ $item->kode }}</span></td>
                        <td>
                            <div class="fw-semibold">{{ $item->nama }}</div>
                            <div class="small text-muted">{{ $item->fungsi_utama ?: 'Fungsi belum diisi' }}</div>
                        </td>
                        <td>
                            <div class="small"><strong>Kandungan:</strong> {{ $item->kandungan ?: '-' }}</div>
                            <div class="small"><strong>Takaran:</strong> {{ $item->takaran ?: '-' }}</div>
                            <div class="small"><strong>Jadwal:</strong> {{ $item->jadwal_umur_aplikasi ?: '-' }}</div>
                        </td>
                        <td>{{ $item->harga_formatted }}/{{ $item->satuan }}</td>
                        <td class="text-end">
                            <a href="{{ route('admin.pupuk.edit', $item) }}" class="btn btn-sm btn-outline-primary">Edit</a>
                            <form action="{{ route('admin.pupuk.destroy', $item) }}" method="POST" class="d-inline" onsubmit="return confirm('Hapus data pupuk ini?')">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-outline-danger">Hapus</button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="6" class="text-center py-4 text-muted">Belum ada data pupuk.</td></tr>
                    @endforelse
                </tbody>
            </table>
        </div>
    </div>
    @if($pupuk->hasPages())
    <div class="card-footer">{{ $pupuk->links() }}</div>
    @endif
</div>
@endsection
