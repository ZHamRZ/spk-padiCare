<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use App\Models\Penyakit;
use App\Models\Gejala;
use App\Models\Kriteria;
use App\Models\Pupuk;
use App\Models\Pestisida;
use App\Models\RatingPupuk;
use App\Models\RatingPestisida;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // ── USERS ────────────────────────────────────────────
        User::insert([
            ['nama' => 'Administrator',  'username' => 'admin',      'password' => Hash::make('admin123'),   'role' => 'admin',   'created_at' => now(), 'updated_at' => now()],
            ['nama' => 'H. Badaruddin',  'username' => 'badaruddin', 'password' => Hash::make('petani123'),  'role' => 'petani',  'created_at' => now(), 'updated_at' => now()],
            ['nama' => 'Diana Lestari',  'username' => 'diana',      'password' => Hash::make('petani123'),  'role' => 'petani',  'created_at' => now(), 'updated_at' => now()],
        ]);

        // ── PENYAKIT ──────────────────────────────────────────
        $penyakit = [
            ['kode' => 'P01', 'nama' => 'Blast (Blas)',                'deskripsi' => 'Penyakit yang disebabkan jamur Pyricularia oryzae, menyerang daun, leher malai, dan bulir padi.'],
            ['kode' => 'P02', 'nama' => 'Hawar Daun Bakteri (Kresek)', 'deskripsi' => 'Penyakit bakteri Xanthomonas oryzae pv. oryzae, menyebabkan daun menguning dari ujung.'],
            ['kode' => 'P03', 'nama' => 'Tungro',                      'deskripsi' => 'Penyakit virus ditularkan wereng hijau, menyebabkan tanaman kerdil dan menguning.'],
            ['kode' => 'P04', 'nama' => 'Busuk Pelepah (Sheath Blight)', 'deskripsi' => 'Penyakit jamur Rhizoctonia solani, menyerang pelepah daun padi.'],
            ['kode' => 'P05', 'nama' => 'Bercak Coklat (Brown Spot)',  'deskripsi' => 'Penyakit jamur Helminthosporium oryzae, menyebabkan bercak coklat pada daun dan gabah.'],
        ];
        foreach ($penyakit as $p) {
            Penyakit::create($p);
        }

        // ── GEJALA ────────────────────────────────────────────
        $gejala = [
            ['kode' => 'G01', 'nama_gejala' => 'Bercak belah ketupat pada daun'],
            ['kode' => 'G02', 'nama_gejala' => 'Leher malai membusuk dan patah'],
            ['kode' => 'G03', 'nama_gejala' => 'Bulir padi tidak berisi (hampa)'],
            ['kode' => 'G04', 'nama_gejala' => 'Daun menguning dari ujung seperti terbakar'],
            ['kode' => 'G05', 'nama_gejala' => 'Tepi daun mengering dan melengkung'],
            ['kode' => 'G06', 'nama_gejala' => 'Tanaman layu pada serangan berat'],
            ['kode' => 'G07', 'nama_gejala' => 'Tanaman kerdil dan pertumbuhan terhambat'],
            ['kode' => 'G08', 'nama_gejala' => 'Daun berwarna kuning hingga oranye'],
            ['kode' => 'G09', 'nama_gejala' => 'Anakan sedikit dan malai tidak berkembang'],
            ['kode' => 'G10', 'nama_gejala' => 'Bercak oval keabu-abuan pada pelepah daun'],
            ['kode' => 'G11', 'nama_gejala' => 'Bercak meluas ke atas hingga daun bendera'],
            ['kode' => 'G12', 'nama_gejala' => 'Tanaman mudah rebah pada serangan parah'],
            ['kode' => 'G13', 'nama_gejala' => 'Bercak coklat oval pada daun'],
            ['kode' => 'G14', 'nama_gejala' => 'Bercak pada gabah menyebabkan bulir berwarna hitam'],
            ['kode' => 'G15', 'nama_gejala' => 'Daun mengering lebih cepat dari seharusnya'],
        ];
        foreach ($gejala as $g) {
            Gejala::create($g);
        }

        // ── RELASI PENYAKIT-GEJALA ────────────────────────────
        $p1 = Penyakit::where('kode', 'P01')->first();
        $p2 = Penyakit::where('kode', 'P02')->first();
        $p3 = Penyakit::where('kode', 'P03')->first();
        $p4 = Penyakit::where('kode', 'P04')->first();
        $p5 = Penyakit::where('kode', 'P05')->first();

        $p1->gejala()->attach(Gejala::whereIn('kode', ['G01', 'G02', 'G03'])->pluck('id'));
        $p2->gejala()->attach(Gejala::whereIn('kode', ['G04', 'G05', 'G06'])->pluck('id'));
        $p3->gejala()->attach(Gejala::whereIn('kode', ['G07', 'G08', 'G09'])->pluck('id'));
        $p4->gejala()->attach(Gejala::whereIn('kode', ['G10', 'G11', 'G12'])->pluck('id'));
        $p5->gejala()->attach(Gejala::whereIn('kode', ['G13', 'G14', 'G15'])->pluck('id'));

        // ── KRITERIA ──────────────────────────────────────────
        Kriteria::insert([
            ['kode' => 'C1', 'nama' => 'Jenis Penyakit',    'jenis' => 'benefit', 'bobot' => 0.35, 'keterangan' => 'Kesesuaian produk terhadap jenis penyakit yang dipilih', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'C2', 'nama' => 'Harga',             'jenis' => 'cost',   'bobot' => 0.25, 'keterangan' => 'Harga per satuan produk yang tersedia di pasaran',      'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'C3', 'nama' => 'Efektivitas',       'jenis' => 'benefit', 'bobot' => 0.25, 'keterangan' => 'Tingkat keberhasilan mengendalikan penyakit',           'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'C4', 'nama' => 'Dampak Lingkungan', 'jenis' => 'cost',   'bobot' => 0.15, 'keterangan' => 'Pengaruh negatif terhadap lingkungan sawah',            'created_at' => now(), 'updated_at' => now()],
        ]);

        // ── PUPUK ─────────────────────────────────────────────
        Pupuk::insert([
            ['kode' => 'PK01', 'nama' => 'Urea',              'kandungan' => 'N 46%',               'fungsi_utama' => 'Pupuk nitrogen tinggi untuk pertumbuhan vegetatif',             'harga_per_kg' => 1800,  'satuan' => 'kg', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PK02', 'nama' => 'NPK Phonska',       'kandungan' => 'N15% P15% K15% S10%', 'fungsi_utama' => 'Pupuk majemuk lengkap untuk semua fase pertumbuhan padi',       'harga_per_kg' => 1840,  'satuan' => 'kg', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PK03', 'nama' => 'SP-36',             'kandungan' => 'P 36%',               'fungsi_utama' => 'Pupuk fosfat untuk perkembangan akar dan pembungaan',           'harga_per_kg' => 9900,  'satuan' => 'kg', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PK04', 'nama' => 'KCl',               'kandungan' => 'K 60%',               'fungsi_utama' => 'Pupuk kalium untuk memperkuat batang dan ketahanan penyakit',   'harga_per_kg' => 12900, 'satuan' => 'kg', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PK05', 'nama' => 'Pupuk Organik Kompos', 'kandungan' => 'C-organik ≥15%',    'fungsi_utama' => 'Memperbaiki struktur tanah dan kesuburan jangka panjang',       'harga_per_kg' => 640,   'satuan' => 'kg', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PK06', 'nama' => 'ZA (Amonium Sulfat)', 'kandungan' => 'N 21%, S 24%',       'fungsi_utama' => 'Pupuk nitrogen + sulfur, cocok untuk tanah basa atau masam',   'harga_per_kg' => 1360,  'satuan' => 'kg', 'created_at' => now(), 'updated_at' => now()],
        ]);

        // ── PESTISIDA ─────────────────────────────────────────
        Pestisida::insert([
            ['kode' => 'PS01', 'nama' => 'Amistartop 325 SC', 'jenis' => 'fungisida',  'bahan_aktif' => 'Azoksistrobin + Difenokonazol', 'dosis' => '0,5–1 ml/L', 'harga' => 150000, 'satuan_harga' => 'per 100ml', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PS02', 'nama' => 'Filia 525 SE',     'jenis' => 'fungisida',  'bahan_aktif' => 'Propikonazol + Trisiklazol',   'dosis' => '1–1,5 ml/L', 'harga' => 125000, 'satuan_harga' => 'per 250ml', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PS03', 'nama' => 'Bactocyn 12/5 WP', 'jenis' => 'bakterisida', 'bahan_aktif' => 'Streptomisin Sulfat',          'dosis' => '1–2 g/L',   'harga' => 45000, 'satuan_harga' => 'per 100g', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PS04', 'nama' => 'Agrept 20 WP',     'jenis' => 'bakterisida', 'bahan_aktif' => 'Streptomisin Sulfat 20%',      'dosis' => '1,5 g/L',   'harga' => 25000, 'satuan_harga' => 'per 50g',  'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PS05', 'nama' => 'Winder 50 EC',     'jenis' => 'insektisida', 'bahan_aktif' => 'Imidakloprid',                 'dosis' => '0,5–1 ml/L', 'harga' => 55000, 'satuan_harga' => 'per 100ml', 'created_at' => now(), 'updated_at' => now()],
            ['kode' => 'PS06', 'nama' => 'Validacin 3 L',    'jenis' => 'fungisida',  'bahan_aktif' => 'Validamisin A',                'dosis' => '1–2 ml/L',  'harga' => 25000, 'satuan_harga' => 'per 250ml', 'created_at' => now(), 'updated_at' => now()],
        ]);

        // ── RATING PUPUK ──────────────────────────────────────
        // [id_pupuk, id_kriteria, id_penyakit, nilai]
        // Skala 1-5: 5=terbaik
        $ratingPupuk = [
            // BLAST (P01) - C1(jenis), C2(harga), C3(efektifitas), C4(dampak)
            [1, 1, 1, 3],
            [1, 2, 1, 5],
            [1, 3, 1, 3],
            [1, 4, 1, 3],
            [2, 1, 1, 4],
            [2, 2, 1, 5],
            [2, 3, 1, 4],
            [2, 4, 1, 3],
            [3, 1, 1, 2],
            [3, 2, 1, 2],
            [3, 3, 1, 3],
            [3, 4, 1, 2],
            [4, 1, 1, 5],
            [4, 2, 1, 1],
            [4, 3, 1, 5],
            [4, 4, 1, 2],
            [5, 1, 1, 3],
            [5, 2, 1, 5],
            [5, 3, 1, 3],
            [5, 4, 1, 5],
            [6, 1, 1, 3],
            [6, 2, 1, 4],
            [6, 3, 1, 3],
            [6, 4, 1, 4],
            // HAWAR (P02)
            [1, 1, 2, 2],
            [1, 2, 2, 5],
            [1, 3, 2, 2],
            [1, 4, 2, 3],
            [2, 1, 2, 3],
            [2, 2, 2, 5],
            [2, 3, 2, 3],
            [2, 4, 2, 3],
            [3, 1, 2, 1],
            [3, 2, 2, 2],
            [3, 3, 2, 2],
            [3, 4, 2, 2],
            [4, 1, 2, 4],
            [4, 2, 2, 1],
            [4, 3, 2, 4],
            [4, 4, 2, 2],
            [5, 1, 2, 2],
            [5, 2, 2, 5],
            [5, 3, 2, 3],
            [5, 4, 2, 5],
            [6, 1, 2, 3],
            [6, 2, 2, 4],
            [6, 3, 2, 3],
            [6, 4, 2, 4],
            // TUNGRO (P03)
            [1, 1, 3, 2],
            [1, 2, 3, 5],
            [1, 3, 3, 2],
            [1, 4, 3, 3],
            [2, 1, 3, 3],
            [2, 2, 3, 5],
            [2, 3, 3, 3],
            [2, 4, 3, 3],
            [3, 1, 3, 1],
            [3, 2, 3, 2],
            [3, 3, 3, 2],
            [3, 4, 3, 2],
            [4, 1, 3, 4],
            [4, 2, 3, 1],
            [4, 3, 3, 5],
            [4, 4, 3, 2],
            [5, 1, 3, 3],
            [5, 2, 3, 5],
            [5, 3, 3, 4],
            [5, 4, 3, 5],
            [6, 1, 3, 3],
            [6, 2, 3, 4],
            [6, 3, 3, 3],
            [6, 4, 3, 4],
            // BUSUK PELEPAH (P04)
            [1, 1, 4, 2],
            [1, 2, 4, 5],
            [1, 3, 4, 2],
            [1, 4, 4, 3],
            [2, 1, 4, 3],
            [2, 2, 4, 5],
            [2, 3, 4, 3],
            [2, 4, 4, 3],
            [3, 1, 4, 1],
            [3, 2, 4, 2],
            [3, 3, 4, 2],
            [3, 4, 4, 2],
            [4, 1, 4, 5],
            [4, 2, 4, 1],
            [4, 3, 4, 5],
            [4, 4, 4, 2],
            [5, 1, 4, 3],
            [5, 2, 4, 5],
            [5, 3, 4, 4],
            [5, 4, 4, 5],
            [6, 1, 4, 2],
            [6, 2, 4, 4],
            [6, 3, 4, 2],
            [6, 4, 4, 4],
            // BERCAK COKLAT (P05)
            [1, 1, 5, 2],
            [1, 2, 5, 5],
            [1, 3, 5, 2],
            [1, 4, 5, 3],
            [2, 1, 5, 3],
            [2, 2, 5, 5],
            [2, 3, 5, 3],
            [2, 4, 5, 3],
            [3, 1, 5, 2],
            [3, 2, 5, 2],
            [3, 3, 5, 2],
            [3, 4, 5, 2],
            [4, 1, 5, 5],
            [4, 2, 5, 1],
            [4, 3, 5, 4],
            [4, 4, 5, 2],
            [5, 1, 5, 3],
            [5, 2, 5, 5],
            [5, 3, 5, 4],
            [5, 4, 5, 5],
            [6, 1, 5, 2],
            [6, 2, 5, 4],
            [6, 3, 5, 3],
            [6, 4, 5, 4],
        ];
        foreach ($ratingPupuk as $r) {
            RatingPupuk::create(['id_pupuk' => $r[0], 'id_kriteria' => $r[1], 'id_penyakit' => $r[2], 'nilai' => $r[3]]);
        }

        // ── RATING PESTISIDA ──────────────────────────────────
        $ratingPestisida = [
            // BLAST (P01)
            [1, 1, 1, 5],
            [1, 2, 1, 1],
            [1, 3, 1, 5],
            [1, 4, 1, 2],
            [2, 1, 1, 4],
            [2, 2, 1, 2],
            [2, 3, 1, 4],
            [2, 4, 1, 2],
            [3, 1, 1, 1],
            [3, 2, 1, 4],
            [3, 3, 1, 1],
            [3, 4, 1, 4],
            [4, 1, 1, 1],
            [4, 2, 1, 5],
            [4, 3, 1, 1],
            [4, 4, 1, 4],
            [5, 1, 1, 1],
            [5, 2, 1, 3],
            [5, 3, 1, 2],
            [5, 4, 1, 3],
            [6, 1, 1, 3],
            [6, 2, 1, 5],
            [6, 3, 1, 3],
            [6, 4, 1, 3],
            // HAWAR (P02)
            [1, 1, 2, 1],
            [1, 2, 2, 1],
            [1, 3, 2, 1],
            [1, 4, 2, 2],
            [2, 1, 2, 1],
            [2, 2, 2, 2],
            [2, 3, 2, 1],
            [2, 4, 2, 2],
            [3, 1, 2, 5],
            [3, 2, 2, 4],
            [3, 3, 2, 5],
            [3, 4, 2, 3],
            [4, 1, 2, 5],
            [4, 2, 2, 5],
            [4, 3, 2, 4],
            [4, 4, 2, 3],
            [5, 1, 2, 1],
            [5, 2, 2, 3],
            [5, 3, 2, 1],
            [5, 4, 2, 3],
            [6, 1, 2, 1],
            [6, 2, 2, 5],
            [6, 3, 2, 1],
            [6, 4, 2, 3],
            // TUNGRO (P03)
            [1, 1, 3, 1],
            [1, 2, 3, 1],
            [1, 3, 3, 1],
            [1, 4, 3, 2],
            [2, 1, 3, 1],
            [2, 2, 3, 2],
            [2, 3, 3, 1],
            [2, 4, 3, 2],
            [3, 1, 3, 1],
            [3, 2, 3, 4],
            [3, 3, 3, 1],
            [3, 4, 3, 4],
            [4, 1, 3, 1],
            [4, 2, 3, 5],
            [4, 3, 3, 1],
            [4, 4, 3, 4],
            [5, 1, 3, 5],
            [5, 2, 3, 3],
            [5, 3, 3, 5],
            [5, 4, 3, 3],
            [6, 1, 3, 1],
            [6, 2, 3, 5],
            [6, 3, 3, 1],
            [6, 4, 3, 3],
            // BUSUK PELEPAH (P04)
            [1, 1, 4, 4],
            [1, 2, 4, 1],
            [1, 3, 4, 4],
            [1, 4, 4, 2],
            [2, 1, 4, 5],
            [2, 2, 4, 2],
            [2, 3, 4, 5],
            [2, 4, 4, 2],
            [3, 1, 4, 1],
            [3, 2, 4, 4],
            [3, 3, 4, 1],
            [3, 4, 4, 4],
            [4, 1, 4, 1],
            [4, 2, 4, 5],
            [4, 3, 4, 1],
            [4, 4, 4, 4],
            [5, 1, 4, 1],
            [5, 2, 4, 3],
            [5, 3, 4, 1],
            [5, 4, 4, 3],
            [6, 1, 4, 5],
            [6, 2, 4, 5],
            [6, 3, 4, 5],
            [6, 4, 4, 3],
            // BERCAK COKLAT (P05)
            [1, 1, 5, 5],
            [1, 2, 5, 1],
            [1, 3, 5, 4],
            [1, 4, 5, 2],
            [2, 1, 5, 3],
            [2, 2, 5, 2],
            [2, 3, 5, 3],
            [2, 4, 5, 2],
            [3, 1, 5, 1],
            [3, 2, 5, 4],
            [3, 3, 5, 1],
            [3, 4, 5, 4],
            [4, 1, 5, 1],
            [4, 2, 5, 5],
            [4, 3, 5, 1],
            [4, 4, 5, 4],
            [5, 1, 5, 1],
            [5, 2, 5, 3],
            [5, 3, 5, 1],
            [5, 4, 5, 3],
            [6, 1, 5, 4],
            [6, 2, 5, 5],
            [6, 3, 5, 5],
            [6, 4, 5, 3],
        ];
        foreach ($ratingPestisida as $r) {
            RatingPestisida::create(['id_pestisida' => $r[0], 'id_kriteria' => $r[1], 'id_penyakit' => $r[2], 'nilai' => $r[3]]);
        }
    }
}
