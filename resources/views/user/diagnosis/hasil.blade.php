@extends('layouts.app')

@section('title', 'Hasil Identifikasi')
@section('page-title', 'Hasil Identifikasi')

@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', () => {
        document.querySelectorAll('.preset-radio').forEach((radio) => {
            radio.addEventListener('change', () => {
                const target = radio.dataset.target;
                const wrapper = document.getElementById(target);
                if (!wrapper) return;
                wrapper.classList.toggle('d-none', radio.value !== 'custom');
            });
        });
    });
</script>
@endpush

@section('content')
@guest
<div class="container py-4">
@endguest
<div class="row g-4">
    <div class="col-lg-4">
        <div class="card">
            <div class="card-header">Gejala Dipilih</div>
            <div class="card-body">
                <ul class="mb-0">
                    @foreach($gejalaInput as $item)
                    <li><strong>{{ $item->kode }}</strong> - {{ $item->nama_gejala }}</li>
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
    <div class="col-lg-8">
        <div class="card">
            <div class="card-header">Kemungkinan Penyakit</div>
            <div class="card-body">
                <form action="{{ route('user.diagnosis.proses') }}" method="POST">
                    @csrf
                @foreach($gejalaInput as $gejalaDipilih)
                <input type="hidden" name="gejala_terpilih[]" value="{{ $gejalaDipilih->id }}">
                @endforeach

                @guest
                <div class="d-flex flex-wrap gap-2 mb-3">
                    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-outline-secondary">Kembali</a>
                    <a href="{{ route('login') }}" class="btn btn-outline-success">Login untuk Simpan Hasil</a>
                </div>
                @endguest
                <div class="alert alert-info">
                    Setelah penyakit dipilih, Anda bisa menentukan prioritas keputusan. Contohnya: ingin hasil paling efektif meski biaya lebih tinggi, ingin lebih hemat, atau mengatur tingkat penting tiap kriteria sendiri.
                </div>
                <div class="border rounded p-3 bg-light mb-4">
                    <div class="fw-semibold mb-2">Atur Kebutuhan dan Prioritas Anda</div>
                    <div class="row g-2 mb-3">
                        @foreach($presetPreferensi as $key => $preset)
                        <div class="col-md-6">
                            <label class="border rounded p-3 d-block h-100 bg-white">
                                <input class="form-check-input me-2 preset-radio" type="radio" name="preferensi_tipe"
                                    value="{{ $key }}" data-target="custom-priority"
                                    {{ old('preferensi_tipe', 'seimbang') === $key ? 'checked' : '' }}>
                                <span class="fw-semibold">{{ $preset['label'] }}</span>
                                <div class="small text-muted mt-1">{{ $preset['description'] }}</div>
                            </label>
                        </div>
                        @endforeach
                    </div>

                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label">Alasan utama</label>
                            <input type="text" name="preferensi_alasan" value="{{ old('preferensi_alasan') }}" class="form-control"
                                placeholder="Contoh: ingin cepat menekan penyakit">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Catatan tambahan</label>
                            <input type="text" name="preferensi_catatan" value="{{ old('preferensi_catatan') }}" class="form-control"
                                placeholder="Contoh: anggaran terbatas minggu ini">
                        </div>
                    </div>

                    <div id="custom-priority" class="{{ old('preferensi_tipe', 'seimbang') === 'custom' ? '' : 'd-none' }}">
                        <div class="fw-semibold small mb-2">Prioritas per kriteria</div>
                        <div class="row g-2">
                            @foreach($kriteria as $kriteriaItem)
                            <div class="col-md-6">
                                <label class="form-label small mb-1">{{ $kriteriaItem->kode }} - {{ $kriteriaItem->nama }}</label>
                                <select name="preferensi_kriteria[{{ $kriteriaItem->id }}]" class="form-select form-select-sm">
                                    @foreach([1,2,3,4,5] as $score)
                                    <option value="{{ $score }}" {{ (int) old("preferensi_kriteria.{$kriteriaItem->id}", 3) === $score ? 'selected' : '' }}>
                                        {{ $score }} - {{ ['Sangat rendah','Rendah','Sedang','Tinggi','Sangat tinggi'][$score - 1] }}
                                    </option>
                                    @endforeach
                                </select>
                                <div class="small text-muted mt-1">{{ ucfirst($kriteriaItem->jenis) }} | Bobot dasar {{ number_format($kriteriaItem->bobot, 2) }}</div>
                            </div>
                            @endforeach
                        </div>
                    </div>
                </div>

                @foreach($skorPenyakit as $index => $item)
                <div class="border rounded p-3 mb-3">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" name="id_penyakit[]" value="{{ $item['penyakit']->id }}"
                                    id="penyakit-{{ $item['penyakit']->id }}"
                                    {{ in_array($item['penyakit']->id, old('id_penyakit', collect($skorPenyakit)->pluck('penyakit.id')->all())) ? 'checked' : '' }}>
                                <label class="form-check-label fw-semibold" for="penyakit-{{ $item['penyakit']->id }}">
                                    Pilih penyakit ini untuk ditampilkan di hasil rekomendasi
                                </label>
                            </div>
                            <h5 class="fw-bold mb-1">{{ $item['penyakit']->nama }}</h5>
                            <div class="small text-muted">{{ $item['penyakit']->kode }}</div>
                        </div>
                        @if($index === 0)
                        <span class="badge text-bg-success">Paling cocok</span>
                        @endif
                    </div>
                    <p class="small text-muted mb-2">{{ $item['penyakit']->deskripsi ?: 'Belum ada deskripsi penyakit.' }}</p>
                    <div class="progress mb-2" style="height: 10px;">
                        <div class="progress-bar bg-success" style="width: {{ $item['persen'] }}%"></div>
                    </div>
                    <div class="small text-muted mb-3">Kecocokan gejala: {{ $item['cocok'] }} dari {{ $item['total'] }} gejala ({{ $item['persen'] }}%)</div>
                    <div class="small text-muted">Jika dicentang, solusi pupuk dan pestisida untuk penyakit ini akan ditampilkan bersama penyakit lain yang Anda pilih.</div>
                </div>
                @endforeach

                @guest
                <div class="alert alert-light border small mb-0">
                    Hasil bisa dihitung tanpa login. Jika nanti ingin menyimpan hasil ke riwayat pribadi, Anda bisa login setelah melihat rekomendasinya.
                </div>
                @endguest

                @error('id_penyakit')
                <div class="text-danger small mt-3">{{ $message }}</div>
                @enderror

                <div class="d-flex flex-wrap gap-2 mt-4">
                    @guest
                    <a href="{{ route('user.diagnosis.index') }}" class="btn btn-outline-secondary">Kembali</a>
                    <a href="{{ route('login') }}" class="btn btn-outline-success">Login untuk Simpan Hasil</a>
                    @endguest
                    <button type="submit" class="btn btn-spk">
                        {{ auth()->check() ? 'Lihat dan Simpan Semua Rekomendasi Terpilih' : 'Lihat Semua Rekomendasi Penyakit Terpilih' }}
                    </button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
@guest
</div>
@endguest
@endsection
