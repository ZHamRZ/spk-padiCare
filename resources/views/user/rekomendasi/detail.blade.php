@extends('layouts.app')

@section('title', 'Penjelasan Hasil Rekomendasi')
@section('page-title', 'Penjelasan Hasil Rekomendasi')

@push('styles')
<style>
    .explain-hero {
        background: linear-gradient(135deg, #ecfdf5 0%, #f0fdf4 100%);
        border: 1px solid #bbf7d0;
        border-radius: 20px;
    }

    .step-card,
    .result-card {
        border: 1px solid #e5e7eb;
        border-radius: 18px;
        background: #fff;
        height: 100%;
    }

    .score-badge {
        min-width: 90px;
        text-align: center;
        border-radius: 999px;
        padding: .45rem .9rem;
        font-weight: 700;
        background: #14532d;
        color: #fff;
    }

    .reason-chip {
        display: inline-flex;
        align-items: center;
        padding: .35rem .7rem;
        border-radius: 999px;
        background: #f8fafc;
        color: #334155;
        border: 1px solid #e2e8f0;
        font-size: .82rem;
    }
</style>
@endpush

@section('content')
@php($isPreview = $isPreview ?? false)
@guest
<div class="container py-4">
@endguest
<div class="explain-hero p-4 p-lg-5 mb-4">
    <div class="row g-4 align-items-center">
        <div class="col-lg-8">
            <span class="badge bg-success-subtle text-success border border-success-subtle mb-3">Versi Mudah Dipahami</span>
            <h2 class="fw-bold mb-2">Penjelasan hasil untuk penyakit {{ $rekomendasi->penyakit->nama }}</h2>
            <p class="text-muted mb-0">
                Halaman ini menjelaskan kenapa suatu pupuk atau pestisida dipilih. Angka yang lebih tinggi berarti pilihan tersebut lebih cocok dengan kebutuhan yang Anda masukkan.
            </p>
        </div>
        <div class="col-lg-4">
            <div class="bg-white rounded-4 p-4 h-100">
                <div class="small text-muted mb-2">Inti hasil</div>
                <div class="mb-2"><strong>Pupuk terbaik:</strong> {{ data_get($preview, 'pupuk.0.nama', '-') }}</div>
                <div class="mb-2"><strong>Pestisida terbaik:</strong> {{ data_get($preview, 'pestisida.0.nama', '-') }}</div>
                <div class="small text-muted">Sistem memilih alternatif dengan skor kecocokan akhir paling tinggi.</div>
            </div>
        </div>
    </div>
</div>

@if($rekomendasi->preferensi_label)
<div class="alert alert-success mb-4">
    <div class="fw-semibold mb-1">Preferensi yang dipilih: {{ $rekomendasi->preferensi_label }}</div>
    @if(data_get($rekomendasi->preferensi_pengguna, 'alasan'))
    <div class="small">Alasan pengguna: {{ data_get($rekomendasi->preferensi_pengguna, 'alasan') }}</div>
    @endif
    @if(data_get($rekomendasi->preferensi_pengguna, 'catatan'))
    <div class="small">Catatan tambahan: {{ data_get($rekomendasi->preferensi_pengguna, 'catatan') }}</div>
    @endif
</div>
@endif

<div class="row g-3 mb-4">
    <div class="col-md-4">
        <div class="step-card p-4">
            <div class="fw-bold mb-2">1. Sistem membaca nilai tiap pilihan</div>
            <div class="text-muted small">Setiap pupuk dan pestisida dibandingkan berdasarkan harga, manfaat, dan kriteria lain yang sudah diatur admin.</div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="step-card p-4">
            <div class="fw-bold mb-2">2. Nilai disesuaikan dengan prioritas Anda</div>
            <div class="text-muted small">Kriteria yang lebih penting bagi pengguna akan diberi pengaruh lebih besar dalam perhitungan.</div>
        </div>
    </div>
    <div class="col-md-4">
        <div class="step-card p-4">
            <div class="fw-bold mb-2">3. Skor tertinggi jadi rekomendasi utama</div>
            <div class="text-muted small">Semakin tinggi skor kecocokan akhir, semakin sesuai alternatif tersebut untuk kondisi yang dipilih.</div>
        </div>
    </div>
</div>

@foreach(['pupuk' => 'Pupuk', 'pestisida' => 'Pestisida'] as $key => $label)
<div class="card mb-4">
    <div class="card-header">{{ $label }} yang Direkomendasikan</div>
    <div class="card-body">
        <div class="alert alert-light border mb-4">
            <div class="fw-semibold mb-1">Cara membaca hasil {{ strtolower($label) }}</div>
            <div class="small text-muted mb-0">
                Peringkat 1 adalah pilihan yang paling disarankan. Skor kecocokan yang lebih besar menunjukkan bahwa pilihan tersebut lebih sesuai dengan prioritas pengguna dan data penilaian yang ada.
            </div>
        </div>

        <div class="row g-3 mb-4">
            @foreach($preview[$key] as $item)
            @php($alasanUtama = collect($item['detail'])->sortByDesc('wj_rij')->take(3))
            <div class="col-12">
                <div class="result-card p-4 {{ $item['peringkat'] === 1 ? 'border-success' : '' }}">
                    <div class="d-flex flex-column flex-lg-row justify-content-between align-items-lg-center gap-3 mb-3">
                        <div>
                            <div class="d-flex flex-wrap align-items-center gap-2 mb-2">
                                <span class="badge {{ $item['peringkat'] === 1 ? 'text-bg-success' : 'text-bg-secondary' }}">Peringkat {{ $item['peringkat'] }}</span>
                                <span class="badge bg-light text-dark border">{{ $item['kode'] }}</span>
                                @if($item['peringkat'] === 1)
                                <span class="badge bg-warning text-dark">Paling disarankan</span>
                                @endif
                            </div>
                            <h5 class="fw-bold mb-1">{{ $item['nama'] }}</h5>
                            <div class="text-muted small">Semakin besar skor, semakin sesuai dengan kebutuhan yang dipilih pengguna.</div>
                        </div>
                        <div class="score-badge">
                            {{ number_format($item['vi'], 4) }}
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="small text-muted mb-2">Alasan utama pilihan ini</div>
                        <div class="d-flex flex-wrap gap-2">
                            @foreach($alasanUtama as $detail)
                            <span class="reason-chip">
                                {{ $detail['kriteria'] }}: kontribusi {{ number_format($detail['wj_rij'], 4) }}
                            </span>
                            @endforeach
                        </div>
                    </div>

                    <div class="accordion" id="accordion-{{ $key }}-{{ $loop->index }}">
                        <div class="accordion-item border rounded-4 overflow-hidden">
                            <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#detail-{{ $key }}-{{ $loop->index }}">
                                    Lihat rincian teknis perhitungan
                                </button>
                            </h2>
                            <div id="detail-{{ $key }}-{{ $loop->index }}" class="accordion-collapse collapse" data-bs-parent="#accordion-{{ $key }}-{{ $loop->index }}">
                                <div class="accordion-body">
                                    <div class="table-responsive">
                                        <table class="table table-sm table-striped align-middle mb-0">
                                            <thead class="table-light">
                                                <tr>
                                                    <th>Kriteria</th>
                                                    <th>Jenis</th>
                                                    <th>Nilai awal</th>
                                                    <th>Prioritas user</th>
                                                    <th>Bobot akhir</th>
                                                    <th>Nilai normalisasi</th>
                                                    <th>Kontribusi ke skor</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach($item['detail'] as $kode => $detail)
                                                <tr>
                                                    <td>
                                                        <strong>{{ $kode }}</strong><br>
                                                        <span class="small text-muted">{{ $detail['kriteria'] }}</span>
                                                    </td>
                                                    <td>{{ ucfirst($detail['jenis']) }}</td>
                                                    <td>{{ number_format($detail['xij'], 2) }}</td>
                                                    <td>{{ $detail['preferensi_user'] }}/5</td>
                                                    <td>{{ number_format($detail['bobot_final'], 4) }}</td>
                                                    <td>{{ number_format($detail['rij'], 4) }}</td>
                                                    <td>{{ number_format($detail['wj_rij'], 4) }}</td>
                                                </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="mt-3 small text-muted">
                                        Rumus normalisasi yang dipakai:
                                        benefit = {{ $preview['rumus']['benefit'] }},
                                        cost = {{ $preview['rumus']['cost'] }}.
                                        Nilai akhir dihitung dari penjumlahan bobot akhir x nilai normalisasi.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</div>
@endforeach

<div class="d-flex flex-wrap gap-2">
    @if($isPreview)
    <a href="{{ route('user.rekomendasi.preview') }}" class="btn btn-outline-secondary">Kembali</a>
    <a href="{{ route('login') }}" class="btn btn-outline-success">Login untuk Simpan Hasil</a>
    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-spk">Diagnosis Lagi</a>
    @else
    <a href="{{ route('user.rekomendasi.show', $rekomendasi->id) }}" class="btn btn-outline-secondary">Kembali ke Hasil</a>
    <a href="{{ route('user.riwayat.index') }}" class="btn btn-spk">Buka Riwayat</a>
    @endif
</div>
@guest
</div>
@endguest
@endsection
