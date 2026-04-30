@extends('layouts.app')

@section('title', 'Profil Saya')
@section('page-title', 'Profil Saya')

@push('styles')
<style>
    .profile-avatar {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
        border: 4px solid #fff;
        box-shadow: 0 12px 24px rgba(15, 23, 42, .12);
    }

    .profile-fallback {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        background: linear-gradient(135deg, #14532d, #2d8a4e);
        color: #fff;
        font-size: 2.2rem;
        font-weight: 700;
        border: 4px solid #fff;
        box-shadow: 0 12px 24px rgba(15, 23, 42, .12);
    }

    .info-row {
        display: flex;
        justify-content: space-between;
        gap: 1rem;
        padding: .9rem 0;
        border-bottom: 1px dashed #e2e8f0;
        align-items: start;
    }

    .info-row:last-child {
        border-bottom: 0;
    }
</style>
@endpush

@section('content')
<div class="row g-4">
    <div class="col-lg-4">
        <div class="card">
            <div class="card-header">Profil Utama</div>
            <div class="card-body text-center">
                @if($user->foto_profil_url)
                <img src="{{ $user->foto_profil_url }}" alt="Foto Profil" class="profile-avatar mb-3">
                @else
                <div class="profile-fallback mx-auto mb-3">{{ strtoupper(substr($user->nama, 0, 1)) }}</div>
                @endif
                <h5 class="fw-bold mb-1">{{ $user->nama }}</h5>
                <div class="text-muted small mb-3">{{ $user->isAdmin() ? 'Admin' : 'Petani' }}</div>
                <button class="btn btn-outline-success btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#form-foto">
                    Edit Foto Profil
                </button>
                <div id="form-foto" class="collapse mt-3">
                    <form action="{{ $user->isAdmin() ? route('admin.profile.update') : route('user.profile.update') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <input type="hidden" name="nama" value="{{ old('nama', $user->nama) }}">
                        <input type="hidden" name="username" value="{{ old('username', $user->username) }}">
                        <input type="hidden" name="email" value="{{ old('email', $user->email) }}">
                        <input type="hidden" name="no_telp" value="{{ old('no_telp', $user->no_telp) }}">
                        <input type="hidden" name="alamat" value="{{ old('alamat', $user->alamat) }}">
                        <input type="hidden" name="catatan_profil" value="{{ old('catatan_profil', $user->catatan_profil) }}">
                        <input type="file" name="foto_profil" class="form-control @error('foto_profil') is-invalid @enderror">
                        @error('foto_profil')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        <button type="submit" class="btn btn-spk btn-sm mt-2">Simpan Foto</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-8">
        <div class="card mb-4">
            <div class="card-header">Informasi Akun</div>
            <div class="card-body">
                <div class="info-row">
                    <div>
                        <div class="small text-muted">Nama Lengkap</div>
                        <div class="fw-semibold">{{ $user->nama }}</div>
                    </div>
                    <button class="btn btn-sm btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#edit-nama">Edit</button>
                </div>
                <div id="edit-nama" class="collapse mt-3">
                    <form action="{{ $user->isAdmin() ? route('admin.profile.update') : route('user.profile.update') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        @method('PUT')
                        <div class="row g-2">
                            <div class="col-md-8">
                                <input type="text" name="nama" value="{{ old('nama', $user->nama) }}" class="form-control @error('nama') is-invalid @enderror">
                                @error('nama')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <input type="hidden" name="username" value="{{ old('username', $user->username) }}">
                            <input type="hidden" name="email" value="{{ old('email', $user->email) }}">
                            <input type="hidden" name="no_telp" value="{{ old('no_telp', $user->no_telp) }}">
                            <input type="hidden" name="alamat" value="{{ old('alamat', $user->alamat) }}">
                            <input type="hidden" name="catatan_profil" value="{{ old('catatan_profil', $user->catatan_profil) }}">
                            <div class="col-md-4"><button type="submit" class="btn btn-spk w-100">Simpan</button></div>
                        </div>
                    </form>
                </div>

                <div class="info-row">
                    <div>
                        <div class="small text-muted">Username</div>
                        <div class="fw-semibold">{{ $user->username }}</div>
                    </div>
                    <button class="btn btn-sm btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#edit-username">Edit</button>
                </div>
                <div id="edit-username" class="collapse mt-3">
                    <form action="{{ $user->isAdmin() ? route('admin.profile.update') : route('user.profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row g-2">
                            <input type="hidden" name="nama" value="{{ old('nama', $user->nama) }}">
                            <input type="hidden" name="email" value="{{ old('email', $user->email) }}">
                            <input type="hidden" name="no_telp" value="{{ old('no_telp', $user->no_telp) }}">
                            <input type="hidden" name="alamat" value="{{ old('alamat', $user->alamat) }}">
                            <input type="hidden" name="catatan_profil" value="{{ old('catatan_profil', $user->catatan_profil) }}">
                            <div class="col-md-8">
                                <input type="text" name="username" value="{{ old('username', $user->username) }}" class="form-control @error('username') is-invalid @enderror">
                                @error('username')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-4"><button type="submit" class="btn btn-spk w-100">Simpan</button></div>
                        </div>
                    </form>
                </div>

                <div class="info-row">
                    <div>
                        <div class="small text-muted">Email</div>
                        <div class="fw-semibold">{{ $user->email ?: 'Belum diisi' }}</div>
                        <div class="small mt-1">
                            @if($user->hasVerifiedEmail())
                            <span class="badge text-bg-success">Terverifikasi</span>
                            @else
                            <span class="badge text-bg-warning">Belum diverifikasi</span>
                            @endif
                        </div>
                        @unless($user->hasVerifiedEmail())
                        <form action="{{ route('verification.send') }}" method="POST" class="mt-2">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-outline-success">Kirim Email Verifikasi</button>
                        </form>
                        @endunless
                    </div>
                    <button class="btn btn-sm btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#edit-email">Edit</button>
                </div>
                <div id="edit-email" class="collapse mt-3">
                    <form action="{{ $user->isAdmin() ? route('admin.profile.update') : route('user.profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row g-2">
                            <input type="hidden" name="nama" value="{{ old('nama', $user->nama) }}">
                            <input type="hidden" name="username" value="{{ old('username', $user->username) }}">
                            <input type="hidden" name="no_telp" value="{{ old('no_telp', $user->no_telp) }}">
                            <input type="hidden" name="alamat" value="{{ old('alamat', $user->alamat) }}">
                            <input type="hidden" name="catatan_profil" value="{{ old('catatan_profil', $user->catatan_profil) }}">
                            <div class="col-md-8">
                                <input type="email" name="email" value="{{ old('email', $user->email) }}" class="form-control @error('email') is-invalid @enderror">
                                @error('email')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-4"><button type="submit" class="btn btn-spk w-100">Simpan</button></div>
                        </div>
                    </form>
                </div>

                <div class="info-row">
                    <div>
                        <div class="small text-muted">No. Telepon</div>
                        <div class="fw-semibold">{{ $user->no_telp ?: 'Belum diisi' }}</div>
                    </div>
                    <button class="btn btn-sm btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#edit-telp">Edit</button>
                </div>
                <div id="edit-telp" class="collapse mt-3">
                    <form action="{{ $user->isAdmin() ? route('admin.profile.update') : route('user.profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row g-2">
                            <input type="hidden" name="nama" value="{{ old('nama', $user->nama) }}">
                            <input type="hidden" name="username" value="{{ old('username', $user->username) }}">
                            <input type="hidden" name="email" value="{{ old('email', $user->email) }}">
                            <input type="hidden" name="alamat" value="{{ old('alamat', $user->alamat) }}">
                            <input type="hidden" name="catatan_profil" value="{{ old('catatan_profil', $user->catatan_profil) }}">
                            <div class="col-md-8">
                                <input type="text" name="no_telp" value="{{ old('no_telp', $user->no_telp) }}" class="form-control @error('no_telp') is-invalid @enderror">
                                @error('no_telp')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-4"><button type="submit" class="btn btn-spk w-100">Simpan</button></div>
                        </div>
                    </form>
                </div>

                <div class="info-row">
                    <div>
                        <div class="small text-muted">Alamat</div>
                        <div class="fw-semibold">{{ $user->alamat ?: 'Belum diisi' }}</div>
                    </div>
                    <button class="btn btn-sm btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#edit-alamat">Edit</button>
                </div>
                <div id="edit-alamat" class="collapse mt-3">
                    <form action="{{ $user->isAdmin() ? route('admin.profile.update') : route('user.profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <input type="hidden" name="nama" value="{{ old('nama', $user->nama) }}">
                        <input type="hidden" name="username" value="{{ old('username', $user->username) }}">
                        <input type="hidden" name="email" value="{{ old('email', $user->email) }}">
                        <input type="hidden" name="no_telp" value="{{ old('no_telp', $user->no_telp) }}">
                        <input type="hidden" name="catatan_profil" value="{{ old('catatan_profil', $user->catatan_profil) }}">
                        <textarea name="alamat" rows="3" class="form-control @error('alamat') is-invalid @enderror">{{ old('alamat', $user->alamat) }}</textarea>
                        @error('alamat')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        <button type="submit" class="btn btn-spk mt-2">Simpan</button>
                    </form>
                </div>

                <div class="info-row">
                    <div>
                        <div class="small text-muted">Catatan Profil</div>
                        <div class="fw-semibold">{{ $user->catatan_profil ?: 'Belum diisi' }}</div>
                    </div>
                    <button class="btn btn-sm btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#edit-catatan">Edit</button>
                </div>
                <div id="edit-catatan" class="collapse mt-3">
                    <form action="{{ $user->isAdmin() ? route('admin.profile.update') : route('user.profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <input type="hidden" name="nama" value="{{ old('nama', $user->nama) }}">
                        <input type="hidden" name="username" value="{{ old('username', $user->username) }}">
                        <input type="hidden" name="email" value="{{ old('email', $user->email) }}">
                        <input type="hidden" name="no_telp" value="{{ old('no_telp', $user->no_telp) }}">
                        <input type="hidden" name="alamat" value="{{ old('alamat', $user->alamat) }}">
                        <textarea name="catatan_profil" rows="3" class="form-control @error('catatan_profil') is-invalid @enderror">{{ old('catatan_profil', $user->catatan_profil) }}</textarea>
                        @error('catatan_profil')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                        <button type="submit" class="btn btn-spk mt-2">Simpan</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">Keamanan Akun</div>
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <div>
                        <div class="small text-muted">Password</div>
                        <div class="fw-semibold">Disembunyikan demi keamanan</div>
                    </div>
                    <button class="btn btn-sm btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#edit-password">Edit</button>
                </div>
                <div id="edit-password" class="collapse">
                    <form action="{{ $user->isAdmin() ? route('admin.profile.update') : route('user.profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')
                        <input type="hidden" name="nama" value="{{ old('nama', $user->nama) }}">
                        <input type="hidden" name="username" value="{{ old('username', $user->username) }}">
                        <input type="hidden" name="email" value="{{ old('email', $user->email) }}">
                        <input type="hidden" name="no_telp" value="{{ old('no_telp', $user->no_telp) }}">
                        <input type="hidden" name="alamat" value="{{ old('alamat', $user->alamat) }}">
                        <input type="hidden" name="catatan_profil" value="{{ old('catatan_profil', $user->catatan_profil) }}">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label class="form-label">Password Lama</label>
                                <input type="password" name="password_lama" class="form-control @error('password_lama') is-invalid @enderror">
                                @error('password_lama')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Password Baru</label>
                                <input type="password" name="password" class="form-control @error('password') is-invalid @enderror">
                                @error('password')<div class="invalid-feedback d-block">{{ $message }}</div>@enderror
                            </div>
                            <div class="col-md-4">
                                <label class="form-label">Konfirmasi Password Baru</label>
                                <input type="password" name="password_confirmation" class="form-control">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-spk mt-3">Simpan Password Baru</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
