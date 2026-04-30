@extends('layouts.app')

@section('title', 'Aturan CF Pestisida')
@section('page-title', 'Aturan CF Pestisida')

@section('content')
<div class="card">
    <div class="card-header">Input Rule Certainty Factor Pestisida per Gejala</div>
    <div class="card-body">
        @unless($cfReady ?? false)
        <div class="alert alert-warning">
            Tabel rule CF pestisida belum tersedia di database. Jalankan migration terlebih dahulu agar panel ini bisa dipakai.
        </div>
        @endunless
        @if($gejala->isEmpty() || $pestisida->isEmpty())
        <div class="alert alert-warning mb-0">Lengkapi data gejala dan pestisida sebelum mengisi aturan CF.</div>
        @elseif(!($cfReady ?? false))
        <div class="alert alert-light border mb-0">Setelah migration dijalankan, form rule CF pestisida akan aktif otomatis.</div>
        @else
        <div class="alert alert-info">
            Gunakan nilai <strong>MB</strong> dan <strong>MD</strong> dari pakar untuk menentukan kekuatan rule antara gejala dan pestisida. Satu pestisida bisa terhubung ke banyak gejala, dan satu gejala bisa ditangani beberapa pestisida.
        </div>

        <form action="{{ route('admin.rating.pestisida.simpan') }}" method="POST">
            @csrf
            @foreach($gejala as $gejalaItem)
            <div class="border rounded-4 p-3 mb-4">
                <h5 class="fw-bold mb-3">{{ $gejalaItem->kode }} - {{ $gejalaItem->nama_gejala }}</h5>
                <div class="table-responsive">
                    <table class="table table-bordered align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Pestisida</th>
                                <th>MB</th>
                                <th>MD</th>
                                <th>CF Dasar</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($pestisida as $pestisidaItem)
                            @php($key = $gejalaItem->id . '_' . $pestisidaItem->id)
                            @php($rule = $rules->get($key))
                            @php($mb = old("rules.{$gejalaItem->id}.{$pestisidaItem->id}.mb", optional($rule)->mb ?? 0.700))
                            @php($md = old("rules.{$gejalaItem->id}.{$pestisidaItem->id}.md", optional($rule)->md ?? 0.100))
                            <tr>
                                <td>
                                    <strong>{{ $pestisidaItem->nama }}</strong><br>
                                    <small class="text-muted">{{ $pestisidaItem->kode }}</small>
                                </td>
                                <td style="min-width:130px;">
                                    <input type="number" min="0" max="1" step="0.001"
                                        name="rules[{{ $gejalaItem->id }}][{{ $pestisidaItem->id }}][mb]"
                                        value="{{ $mb }}"
                                        class="form-control">
                                </td>
                                <td style="min-width:130px;">
                                    <input type="number" min="0" max="1" step="0.001"
                                        name="rules[{{ $gejalaItem->id }}][{{ $pestisidaItem->id }}][md]"
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
            <button type="submit" class="btn btn-spk">Simpan Aturan CF Pestisida</button>
        </form>
        @endif
    </div>
</div>
@endsection
