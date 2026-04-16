@extends('layouts.app')

@section('title', 'Rating Pupuk')
@section('page-title', 'Rating Pupuk')

@section('content')
<div class="card">
    <div class="card-header">Input Rating Pupuk per Penyakit dan Kriteria</div>
    <div class="card-body">
        @if($penyakit->isEmpty() || $pupuk->isEmpty() || $kriteria->isEmpty())
        <div class="alert alert-warning mb-0">Lengkapi data penyakit, pupuk, dan kriteria sebelum mengisi rating.</div>
        @else
        <form action="{{ route('admin.rating.pupuk.simpan') }}" method="POST">
            @csrf
            @foreach($penyakit as $penyakitItem)
            <div class="border rounded p-3 mb-4">
                <h5 class="fw-bold mb-3">{{ $penyakitItem->kode }} - {{ $penyakitItem->nama }}</h5>
                <div class="table-responsive">
                    <table class="table table-bordered align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Pupuk</th>
                                @foreach($kriteria as $kriteriaItem)
                                <th>{{ $kriteriaItem->kode }}<br><small class="text-muted">{{ $kriteriaItem->nama }}</small></th>
                                @endforeach
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($pupuk as $pupukItem)
                            <tr>
                                <td><strong>{{ $pupukItem->nama }}</strong><br><small class="text-muted">{{ $pupukItem->kode }}</small></td>
                                @foreach($kriteria as $kriteriaItem)
                                @php($key = $pupukItem->id . '_' . $kriteriaItem->id . '_' . $penyakitItem->id)
                                <td style="min-width:110px;">
                                    <input type="number" min="1" max="5" step="0.01"
                                        name="rating[{{ $penyakitItem->id }}][{{ $pupukItem->id }}][{{ $kriteriaItem->id }}]"
                                        value="{{ old("rating.{$penyakitItem->id}.{$pupukItem->id}.{$kriteriaItem->id}", optional($ratings->get($key))->nilai) }}"
                                        class="form-control">
                                </td>
                                @endforeach
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
            @endforeach
            <button type="submit" class="btn btn-spk">Simpan Rating Pupuk</button>
        </form>
        @endif
    </div>
</div>
@endsection
