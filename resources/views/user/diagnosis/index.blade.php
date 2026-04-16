@extends('layouts.app')

@section('title', 'Diagnosis Penyakit')
@section('page-title', 'Diagnosis Penyakit')

@section('content')
@guest
<div class="container py-4">
    @endguest
    <div class="card">
        <div class="card-header">Pilih Gejala yang Dialami Tanaman</div>
        <div class="card-body">
            @guest
            <div class="alert alert-info">
                Anda bisa melakukan diagnosis tanpa login. Login hanya dibutuhkan jika hasil diagnosis ingin disimpan ke
                riwayat pribadi.
            </div>
            <div class="d-flex flex-wrap gap-2 mb-4">
                <a href="{{ route('home') }}" class="btn btn-outline-secondary">Kembali</a>
                <a href="{{ route('login') }}" class="btn btn-outline-success">Login untuk Simpan Hasil</a>
            </div>
            @endguest
            <form action="{{ route('user.diagnosis.identifikasi') }}" method="POST">
                @csrf
                <div class="row g-3">
                    @foreach($gejala as $item)
                    <div class="col-md-4">
                        <div class="form-check border rounded p-3 h-100">
                            <input class="form-check-input" type="checkbox" name="gejala[]" value="{{ $item->id }}"
                                id="gejala-{{ $item->id }}"
                                {{ in_array($item->id, old('gejala', [])) ? 'checked' : '' }}>
                            <label class="form-check-label" for="gejala-{{ $item->id }}">
                                <strong>{{ $item->kode }}</strong><br>
                                <span class="text-muted">{{ $item->nama_gejala }}</span>
                            </label>
                        </div>
                    </div>
                    @endforeach
                </div>
                @error('gejala')<div class="text-danger small mt-2">{{ $message }}</div>@enderror
                <div class="d-flex flex-wrap gap-2 mt-4">
                    @guest

                    @endguest
                    <button type="submit" class="btn btn-spk">Identifikasi Penyakit</button>
                </div>
            </form>
        </div>
    </div>
    @guest
</div>
@endguest
@endsection