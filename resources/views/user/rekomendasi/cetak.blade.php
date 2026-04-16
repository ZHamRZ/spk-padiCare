<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cetak Rekomendasi</title>
    <style>
        body { font-family: Arial, sans-serif; color: #222; margin: 24px; }
        table { width: 100%; border-collapse: collapse; margin-top: 16px; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        h1, h2, h3, p { margin: 0 0 12px; }
        .section { margin-top: 24px; }
    </style>
</head>
<body onload="window.print()">
    <h2>Laporan Rekomendasi Pupuk dan Pestisida</h2>
    <p>Nama Pengguna: {{ $rekomendasi->user->nama ?? '-' }}</p>
    <p>Penyakit: {{ $rekomendasi->penyakit->nama ?? '-' }}</p>
    <p>Tanggal: {{ optional($rekomendasi->created_at)->format('d M Y H:i') }}</p>

    <div class="section">
        <h3>Ranking Pupuk</h3>
        <table>
            <thead><tr><th>Peringkat</th><th>Nama</th><th>Nilai Vi</th></tr></thead>
            <tbody>
                @foreach($rekomendasi->detailPupuk as $item)
                <tr>
                    <td>{{ $item->peringkat }}</td>
                    <td>{{ $item->pupuk->nama ?? '-' }}</td>
                    <td>{{ number_format($item->nilai_vi, 6) }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <div class="section">
        <h3>Ranking Pestisida</h3>
        <table>
            <thead><tr><th>Peringkat</th><th>Nama</th><th>Nilai Vi</th></tr></thead>
            <tbody>
                @foreach($rekomendasi->detailPestisida as $item)
                <tr>
                    <td>{{ $item->peringkat }}</td>
                    <td>{{ $item->pestisida->nama ?? '-' }}</td>
                    <td>{{ number_format($item->nilai_vi, 6) }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>
</html>
