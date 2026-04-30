@extends('layouts.app')

@section('title', 'Aturan CF Pupuk')
@section('page-title', 'Aturan CF Pupuk')

@section('content')
<div class="card">
    <div class="card-header">Input Rule Certainty Factor Pupuk per Gejala</div>
    <div class="card-body">
        @unless($cfReady ?? false)
        <div class="alert alert-warning">
            Tabel rule CF pupuk belum tersedia di database. Jalankan migration terlebih dahulu agar panel ini bisa dipakai.
        </div>
        @endunless
        @if($gejala->isEmpty() || $pupuk->isEmpty())
        <div class="alert alert-warning mb-0">Lengkapi data gejala dan pupuk sebelum mengisi aturan CF.</div>
        @elseif(!($cfReady ?? false))
        <div class="alert alert-light border mb-0">Setelah migration dijalankan, form rule CF pupuk akan aktif otomatis.</div>
        @else
        <div class="alert alert-info">
            Pakar mengisi nilai <strong>MB</strong> dan <strong>MD</strong> untuk hubungan antara gejala dan pupuk. Satu pupuk bisa terhubung ke banyak gejala, dan satu gejala bisa ditangani beberapa pupuk.
        </div>

        <form action="{{ route('admin.rating.pupuk.simpan') }}" method="POST">
            @csrf
            @foreach($gejala as $gejalaItem)
            <div class="border rounded-4 p-3 mb-4">
                <h5 class="fw-bold mb-3">{{ $gejalaItem->kode }} - {{ $gejalaItem->nama_gejala }}</h5>
                <div class="table-responsive">
                    <table class="table table-bordered align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Pupuk</th>
                                <th>MB</th>
                                <th>MD</th>
                                <th>CF Dasar</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($pupuk as $pupukItem)
                            @php($key = $gejalaItem->id . '_' . $pupukItem->id)
                            @php($rule = $rules->get($key))
                            @php($mb = old("rules.{$gejalaItem->id}.{$pupukItem->id}.mb", optional($rule)->mb ?? 0.700))
                            @php($md = old("rules.{$gejalaItem->id}.{$pupukItem->id}.md", optional($rule)->md ?? 0.100))
                            <tr>
                                <td>
                                    <strong>{{ $pupukItem->nama }}</strong><br>
                                    <small class="text-muted">{{ $pupukItem->kode }}</small>
                                </td>
                                <td style="min-width:130px;">
                                    <input type="number" min="0" max="1" step="0.001"
                                        name="rules[{{ $gejalaItem->id }}][{{ $pupukItem->id }}][mb]"
                                        value="{{ $mb }}"
                                        class="form-control">
                                </td>
                                <td style="min-width:130px;">
                                    <input type="number" min="0" max="1" step="0.001"
                                        name="rules[{{ $gejalaItem->id }}][{{ $pupukItem->id }}][md]"
                                        value="{{ $md }}"
                                        class="form-control">
                                </td>
                                <td class="fw-semibold">{{ number_format((float) $mb - (float) $md, 3) }}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            @endforeach
            <button type="submit" class="btn btn-spk">Simpan Aturan CF Pupuk</button>
        </form>
        @endif
    </div>
</div>
@endsection
