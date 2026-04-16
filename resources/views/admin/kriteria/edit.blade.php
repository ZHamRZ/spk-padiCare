@extends('layouts.app')

@section('title', 'Edit Kriteria')
@section('page-title', 'Edit Kriteria')

@section('content')
<div class="card">
    <div class="card-header">Form Edit Kriteria</div>
    <div class="card-body">
        <form action="{{ route('admin.kriteria.update', $kriteria) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="row g-3">
                <div class="col-md-2">
                    <label class="form-label">Kode</label>
                    <input type="text" value="{{ $kriteria->kode }}" class="form-control" disabled>
                </div>
                <div class="col-md-5">
                    <label class="form-label">Nama Kriteria</label>
                    <input type="text" name="nama" value="{{ old('nama', $kriteria->nama) }}" class="form-control @error('nama') is-invalid @enderror">
                    @error('nama')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-2">
                    <label class="form-label">Jenis</label>
                    <select name="jenis" class="form-select @error('jenis') is-invalid @enderror">
                        <option value="benefit" {{ old('jenis', $kriteria->jenis) === 'benefit' ? 'selected' : '' }}>Benefit</option>
                        <option value="cost" {{ old('jenis', $kriteria->jenis) === 'cost' ? 'selected' : '' }}>Cost</option>
                    </select>
                    @error('jenis')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-3">
                    <label class="form-label">Bobot</label>
                    <input type="number" step="0.01" min="0" max="1" name="bobot" value="{{ old('bobot', $kriteria->bobot) }}" class="form-control @error('bobot') is-invalid @enderror">
                    @error('bobot')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-12">
                    <label class="form-label">Keterangan</label>
                    <textarea name="keterangan" rows="4" class="form-control @error('keterangan') is-invalid @enderror">{{ old('keterangan', $kriteria->keterangan) }}</textarea>
                    @error('keterangan')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
            </div>
            <div class="d-flex gap-2 mt-4">
                <a href="{{ route('admin.kriteria.index') }}" class="btn btn-outline-secondary">Kembali</a>
                <button type="submit" class="btn btn-spk">Perbarui</button>
            </div>
        </form>
    </div>
</div>
@endsection
