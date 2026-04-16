@extends('layouts.app')

@section('title', 'Edit Penyakit')
@section('page-title', 'Edit Penyakit')

@section('content')
<div class="card">
    <div class="card-header">Form Edit Penyakit</div>
    <div class="card-body">
        <form action="{{ route('admin.penyakit.update', $penyakit) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Kode Penyakit</label>
                    <input type="text" name="kode" value="{{ old('kode', $penyakit->kode) }}" readonly class="form-control @error('kode') is-invalid @enderror">
                    <div class="form-text">Kode disimpan otomatis oleh sistem dan tidak perlu diubah manual.</div>
                    @error('kode')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-8">
                    <label class="form-label">Nama Penyakit</label>
                    <input type="text" name="nama" value="{{ old('nama', $penyakit->nama) }}" class="form-control @error('nama') is-invalid @enderror">
                    @error('nama')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label">Gambar Penyakit</label>
                    <input type="file" name="gambar" class="form-control @error('gambar') is-invalid @enderror">
                    @error('gambar')<div class="invalid-feedback">{{ $message }}</div>@enderror
                    @if($penyakit->gambar_url)
                    <img src="{{ $penyakit->gambar_url }}" alt="{{ $penyakit->nama }}" class="mt-2" style="width:96px;height:96px;object-fit:cover;border-radius:12px;">
                    @endif
                </div>
                <div class="col-12">
                    <label class="form-label">Deskripsi</label>
                    <textarea name="deskripsi" rows="4" class="form-control @error('deskripsi') is-invalid @enderror">{{ old('deskripsi', $penyakit->deskripsi) }}</textarea>
                    @error('deskripsi')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-12">
                    <label class="form-label">Gejala Terkait</label>
                    <div class="row g-2">
                        @php($selected = old('gejala', $gejalaSelected))
                        @foreach($gejala as $item)
                        <div class="col-md-4">
                            <div class="form-check border rounded p-2">
                                <input class="form-check-input" type="checkbox" name="gejala[]" value="{{ $item->id }}" id="gejala-{{ $item->id }}" {{ in_array($item->id, $selected) ? 'checked' : '' }}>
                                <label class="form-check-label" for="gejala-{{ $item->id }}">
                                    <strong>{{ $item->kode }}</strong> - {{ $item->nama_gejala }}
                                </label>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="d-flex gap-2 mt-4">
                <a href="{{ route('admin.penyakit.index') }}" class="btn btn-outline-secondary">Kembali</a>
                <button type="submit" class="btn btn-spk">Perbarui</button>
            </div>
        </form>
    </div>
</div>
@endsection
