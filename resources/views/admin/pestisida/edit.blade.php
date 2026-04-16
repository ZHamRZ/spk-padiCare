@extends('layouts.app')

@section('title', 'Edit Pestisida')
@section('page-title', 'Edit Pestisida')

@section('content')
<div class="card">
    <div class="card-header">Form Edit Pestisida</div>
    <div class="card-body">
        <form action="{{ route('admin.pestisida.update', $pestisida) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="row g-3">
                <div class="col-md-3">
                    <label class="form-label">Kode</label>
                    <input type="text" name="kode" value="{{ old('kode', $pestisida->kode) }}" readonly class="form-control @error('kode') is-invalid @enderror">
                    <div class="form-text">Kode disimpan otomatis oleh sistem dan tidak perlu diubah manual.</div>
                    @error('kode')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label">Nama Pestisida</label>
                    <input type="text" name="nama" value="{{ old('nama', $pestisida->nama) }}" class="form-control @error('nama') is-invalid @enderror">
                    @error('nama')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-3">
                    <label class="form-label">Jenis</label>
                    <select name="jenis" class="form-select @error('jenis') is-invalid @enderror">
                        <option value="">Pilih jenis</option>
                        @foreach(['fungisida','bakterisida','insektisida','herbisida'] as $jenis)
                        <option value="{{ $jenis }}" {{ old('jenis', $pestisida->jenis) === $jenis ? 'selected' : '' }}>{{ ucfirst($jenis) }}</option>
                        @endforeach
                    </select>
                    @error('jenis')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label">Gambar Pestisida</label>
                    <input type="file" name="gambar" class="form-control @error('gambar') is-invalid @enderror">
                    @error('gambar')<div class="invalid-feedback">{{ $message }}</div>@enderror
                    @if($pestisida->gambar_url)
                    <img src="{{ $pestisida->gambar_url }}" alt="{{ $pestisida->nama }}" class="mt-2" style="width:96px;height:96px;object-fit:cover;border-radius:12px;">
                    @endif
                </div>
                <div class="col-md-6">
                    <label class="form-label">Bahan Aktif</label>
                    <input type="text" name="bahan_aktif" value="{{ old('bahan_aktif', $pestisida->bahan_aktif) }}" class="form-control @error('bahan_aktif') is-invalid @enderror">
                    @error('bahan_aktif')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-12">
                    <label class="form-label">Kandungan Detail</label>
                    <textarea name="kandungan_detail" rows="2" class="form-control @error('kandungan_detail') is-invalid @enderror">{{ old('kandungan_detail', $pestisida->kandungan_detail) }}</textarea>
                    @error('kandungan_detail')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-12">
                    <label class="form-label">Fungsi</label>
                    <textarea name="fungsi" rows="3" class="form-control @error('fungsi') is-invalid @enderror">{{ old('fungsi', $pestisida->fungsi) }}</textarea>
                    @error('fungsi')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-3">
                    <label class="form-label">Dosis Singkat</label>
                    <input type="text" name="dosis" value="{{ old('dosis', $pestisida->dosis) }}" class="form-control @error('dosis') is-invalid @enderror">
                    @error('dosis')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-5">
                    <label class="form-label">Takaran</label>
                    <input type="text" name="takaran" value="{{ old('takaran', $pestisida->takaran) }}" class="form-control @error('takaran') is-invalid @enderror">
                    @error('takaran')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-3">
                    <label class="form-label">Harga</label>
                    <input type="number" min="0" step="0.01" name="harga" value="{{ old('harga', $pestisida->harga) }}" class="form-control @error('harga') is-invalid @enderror">
                    @error('harga')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-4">
                    <label class="form-label">Satuan Harga</label>
                    <input type="text" name="satuan_harga" value="{{ old('satuan_harga', $pestisida->satuan_harga) }}" class="form-control @error('satuan_harga') is-invalid @enderror">
                    @error('satuan_harga')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-12">
                    <label class="form-label">Efek Penggunaan</label>
                    <textarea name="efek_penggunaan" rows="3" class="form-control @error('efek_penggunaan') is-invalid @enderror">{{ old('efek_penggunaan', $pestisida->efek_penggunaan) }}</textarea>
                    @error('efek_penggunaan')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-12">
                    <label class="form-label">Cara Aplikasi</label>
                    <textarea name="cara_aplikasi" rows="3" class="form-control @error('cara_aplikasi') is-invalid @enderror">{{ old('cara_aplikasi', $pestisida->cara_aplikasi) }}</textarea>
                    @error('cara_aplikasi')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label">Jadwal & Umur Aplikasi</label>
                    <textarea name="jadwal_umur_aplikasi" rows="3" class="form-control @error('jadwal_umur_aplikasi') is-invalid @enderror">{{ old('jadwal_umur_aplikasi', $pestisida->jadwal_umur_aplikasi) }}</textarea>
                    @error('jadwal_umur_aplikasi')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
                <div class="col-md-6">
                    <label class="form-label">Frekuensi Aplikasi</label>
                    <textarea name="frekuensi_aplikasi" rows="3" class="form-control @error('frekuensi_aplikasi') is-invalid @enderror">{{ old('frekuensi_aplikasi', $pestisida->frekuensi_aplikasi) }}</textarea>
                    @error('frekuensi_aplikasi')<div class="invalid-feedback">{{ $message }}</div>@enderror
                </div>
            </div>
            <div class="d-flex gap-2 mt-4">
                <a href="{{ route('admin.pestisida.index') }}" class="btn btn-outline-secondary">Kembali</a>
                <button type="submit" class="btn btn-spk">Perbarui</button>
            </div>
        </form>
    </div>
</div>
@endsection
