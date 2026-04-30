@extends('layouts.app')

@section('title', 'Diagnosis Penyakit')
@section('page-title', 'Diagnosis Penyakit')

@push('styles')
<style>
    .symptom-toolbar {
        background: linear-gradient(135deg, #f0fdf4 0%, #f8fafc 100%);
        border: 1px solid #d1fae5;
        border-radius: 20px;
    }

    .symptom-card {
        border: 1px solid #e2e8f0;
        border-radius: 18px;
        background: #fff;
        transition: transform .2s ease, box-shadow .2s ease, border-color .2s ease;
    }

    .symptom-card:hover {
        transform: translateY(-2px);
        border-color: #86efac;
        box-shadow: 0 18px 40px rgba(20, 83, 45, .08);
    }

    .symptom-card input:checked + label .symptom-shell {
        border-color: #16a34a;
        background: #f0fdf4;
    }

    .symptom-card .form-check-input {
        position: absolute;
        top: 1rem;
        right: 1rem;
        float: none;
        margin: 0;
        z-index: 2;
    }

    .symptom-card .form-check-label {
        display: block;
    }

    .symptom-shell {
        border: 1px solid transparent;
        border-radius: 16px;
        padding: 1rem;
        min-height: 100%;
    }

    .symptom-image {
        width: 100%;
        height: 160px;
        object-fit: cover;
        border-radius: 14px;
        background: #f8fafc;
    }

    .symptom-empty {
        height: 160px;
        border-radius: 14px;
        background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
    }
</style>
@endpush

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const input = document.getElementById('diagnosis-search');
        const cards = Array.from(document.querySelectorAll('[data-gejala-card]'));
        const emptyState = document.getElementById('diagnosis-empty-state');

        if (!input) return;

        input.addEventListener('input', () => {
            const query = input.value.trim().toLowerCase();
            let visibleCount = 0;

            cards.forEach((card) => {
                const haystack = `${card.dataset.kode} ${card.dataset.nama}`.toLowerCase();
                const visible = haystack.includes(query);
                card.classList.toggle('d-none', !visible);
                if (visible) visibleCount += 1;
            });

            if (emptyState) {
                emptyState.classList.toggle('d-none', visibleCount !== 0);
            }
        });
    });
</script>
@endpush

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
                <a href="{{ route('login') }}" class="btn btn-outline-success">Login untuk Simpan Hasil</a>
            </div>
            @endguest
            <form action="{{ route('user.diagnosis.identifikasi') }}" method="POST">
                @csrf
                <div class="symptom-toolbar p-3 p-lg-4 mb-4">
                    <div class="row g-3 align-items-center">
                        <div class="col-lg-7">
                            <div class="fw-semibold mb-1">Cari diagnosa berdasarkan gejala yang terlihat</div>
                            <div class="small text-muted">
                                Ketik kode atau nama gejala untuk mempercepat pencarian sebelum Anda mencentang gejala yang sesuai.
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0">
                                    <i class="bi bi-search"></i>
                                </span>
                                <input type="search" id="diagnosis-search" class="form-control border-start-0"
                                    placeholder="Cari gejala, misalnya bercak daun atau bulir hampa">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row g-3">
                    @foreach($gejala as $item)
                    <div class="col-md-6 col-xl-4" data-gejala-card data-kode="{{ $item->kode }}" data-nama="{{ $item->nama_gejala }}">
                        <div class="form-check symptom-card position-relative h-100">
                            <input class="form-check-input" type="checkbox" name="gejala[]" value="{{ $item->id }}"
                                id="gejala-{{ $item->id }}"
                                {{ in_array($item->id, old('gejala', [])) ? 'checked' : '' }}>
                            <label class="form-check-label" for="gejala-{{ $item->id }}">
                                <div class="symptom-shell h-100">
                                    @if($item->gambar_url)
                                    <img src="{{ $item->gambar_url }}" alt="{{ $item->nama_gejala }}" class="symptom-image mb-3">
                                    @else
                                    <div class="symptom-empty d-flex align-items-center justify-content-center mb-3">
                                        <i class="bi bi-image fs-1 text-secondary"></i>
                                    </div>
                                    @endif
                                    <div class="d-flex flex-wrap gap-2 align-items-center mb-2">
                                        <span class="badge text-bg-success">{{ $item->kode }}</span>
                                        <span class="small text-muted">Pilih jika gejala terlihat</span>
                                    </div>
                                    <div class="fw-semibold">{{ $item->nama_gejala }}</div>
                                </div>
                            </label>
                        </div>
                    </div>
                    @endforeach
                </div>
                <div id="diagnosis-empty-state" class="alert alert-light border text-muted mt-3 d-none">
                    Gejala yang Anda cari belum ditemukan. Coba kata kunci lain.
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
