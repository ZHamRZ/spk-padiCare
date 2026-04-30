<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cetak Hasil Rekomendasi</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            color: #1f2937;
            margin: 24px;
            line-height: 1.5;
        }
        h1, h2, h3, h4, p {
            margin: 0 0 10px;
        }
        .toolbar {
            display: flex;
            gap: 12px;
            margin-bottom: 24px;
        }
        .btn {
            display: inline-block;
            padding: 10px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
        }
        .btn-print {
            background: #166534;
            color: #fff;
        }
        .btn-download {
            background: #f3f4f6;
            color: #111827;
            border: 1px solid #d1d5db;
        }
        .report-card {
            border: 1px solid #d1d5db;
            border-radius: 14px;
            padding: 20px;
            margin-bottom: 24px;
            page-break-inside: avoid;
        }
        .section {
            margin-top: 18px;
        }
        .chips {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }
        .chip {
            display: inline-block;
            padding: 6px 10px;
            border-radius: 999px;
            border: 1px solid #d1d5db;
            background: #f9fafb;
            font-size: 12px;
        }
        .detail-grid {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 14px;
        }
        .detail-box {
            border: 1px solid #e5e7eb;
            border-radius: 12px;
            padding: 14px;
            background: #fff;
        }
        .detail-box h4 {
            margin-bottom: 8px;
        }
        .detail-list p {
            margin-bottom: 6px;
            font-size: 14px;
        }
        .detail-list strong {
            display: inline-block;
            min-width: 120px;
        }
        @media print {
            .toolbar {
                display: none !important;
            }
            body {
                margin: 0;
            }
        }
    </style>
</head>
<body>
    <div class="toolbar">
        <button class="btn btn-print" type="button" onclick="window.print()">Cetak / Simpan PDF</button>
        <a class="btn btn-download" href="{{ route('user.rekomendasi.preview.cetak', ['download' => 1]) }}">Download HTML</a>
    </div>

    <h1>Hasil Rekomendasi Pupuk dan Pestisida</h1>
    <p>Tanggal cetak: {{ now()->format('d M Y H:i') }}</p>

    @foreach($hasilDiagnosa as $hasil)
    @php
        $rekomendasi = $hasil['rekomendasi'];
        $gejala = collect(data_get($rekomendasi, 'gejala_cocok', []));
        $sortedPupuk = $rekomendasi->detailPupuk->sortBy('peringkat')->values();
        $sortedPestisida = $rekomendasi->detailPestisida->sortBy('peringkat')->values();
        $topPupuk = $sortedPupuk->first();
        $topPestisida = $sortedPestisida->first();
        $pupukThreshold = max(0.6, (float) ($topPupuk->nilai_vi ?? 0) - 0.1);
        $pestisidaThreshold = max(0.6, (float) ($topPestisida->nilai_vi ?? 0) - 0.1);
        $recommendedPupuk = $sortedPupuk
            ->filter(fn ($item) => (float) ($item->nilai_vi ?? 0) >= $pupukThreshold)
            ->values();
        $recommendedPestisida = $sortedPestisida
            ->filter(fn ($item) => (float) ($item->nilai_vi ?? 0) >= $pestisidaThreshold)
            ->values();
    @endphp
    <div class="report-card">
        <h2>{{ $rekomendasi->penyakit->nama ?? '-' }}</h2>
        @if($rekomendasi->preferensi_label)
        <p>Prioritas pengguna: {{ $rekomendasi->preferensi_label }}</p>
        @endif

        <div class="section">
            <h3>Gejala yang Cocok</h3>
            <div class="chips">
                @foreach($gejala as $item)
                <span class="chip">{{ data_get($item, 'kode') ? data_get($item, 'kode') . ' - ' : '' }}{{ data_get($item, 'nama_gejala') }}</span>
                @endforeach
                @if($gejala->isEmpty())
                <span class="chip">Tidak ada gejala cocok yang tersimpan.</span>
                @endif
            </div>
        </div>

        <div class="section">
            <h3>Rekomendasi Pupuk</h3>
            <div class="detail-grid">
                @foreach($recommendedPupuk as $item)
                <div class="detail-box">
                    <h4>{{ $item->pupuk->nama ?? '-' }}</h4>
                    <div class="detail-list">
                        <p><strong>Kode</strong> {{ $item->pupuk->kode ?? '-' }}</p>
                        <p><strong>Peringkat</strong> {{ $item->peringkat ?? '-' }}</p>
                        <p><strong>Skor</strong> {{ number_format((float) $item->nilai_vi, 4) }}</p>
                        <p><strong>Kandungan</strong> {{ $item->pupuk->kandungan ?? '-' }}</p>
                        <p><strong>Detail</strong> {{ $item->pupuk->kandungan_detail ?? '-' }}</p>
                        <p><strong>Fungsi</strong> {{ $item->pupuk->fungsi_utama ?? '-' }}</p>
                        <p><strong>Takaran</strong> {{ $item->pupuk->takaran ?? '-' }}</p>
                        <p><strong>Efek</strong> {{ $item->pupuk->efek_penggunaan ?? '-' }}</p>
                        <p><strong>Cara</strong> {{ $item->pupuk->cara_aplikasi ?? '-' }}</p>
                        <p><strong>Jadwal</strong> {{ $item->pupuk->jadwal_umur_aplikasi ?? '-' }}</p>
                        <p><strong>Frekuensi</strong> {{ $item->pupuk->frekuensi_aplikasi ?? '-' }}</p>
                    </div>
                </div>
                @endforeach
            </div>
        </div>

        <div class="section">
            <h3>Rekomendasi Pestisida</h3>
            <div class="detail-grid">
                @foreach($recommendedPestisida as $item)
                <div class="detail-box">
                    <h4>{{ $item->pestisida->nama ?? '-' }}</h4>
                    <div class="detail-list">
                        <p><strong>Kode</strong> {{ $item->pestisida->kode ?? '-' }}</p>
                        <p><strong>Peringkat</strong> {{ $item->peringkat ?? '-' }}</p>
                        <p><strong>Skor</strong> {{ number_format((float) $item->nilai_vi, 4) }}</p>
                        <p><strong>Bahan aktif</strong> {{ $item->pestisida->bahan_aktif ?? '-' }}</p>
                        <p><strong>Fungsi</strong> {{ $item->pestisida->fungsi ?? '-' }}</p>
                        <p><strong>Dosis</strong> {{ $item->pestisida->dosis ?? '-' }}</p>
                        <p><strong>Efek</strong> {{ $item->pestisida->efek_penggunaan ?? '-' }}</p>
                        <p><strong>Cara</strong> {{ $item->pestisida->cara_aplikasi ?? '-' }}</p>
                        <p><strong>Jadwal</strong> {{ $item->pestisida->jadwal_umur_aplikasi ?? '-' }}</p>
                        <p><strong>Frekuensi</strong> {{ $item->pestisida->frekuensi_aplikasi ?? '-' }}</p>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </div>
    @endforeach
</body>
</html>
