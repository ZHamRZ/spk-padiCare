<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Pupuk extends Model
{
    protected $table    = 'pupuk';
    protected $fillable = [
        'kode',
        'nama',
        'kandungan',
        'kandungan_detail',
        'fungsi_utama',
        'takaran',
        'efek_penggunaan',
        'cara_aplikasi',
        'jadwal_umur_aplikasi',
        'frekuensi_aplikasi',
        'harga_per_kg',
        'satuan',
        'gambar',
    ];

    public function ratingPupuk()
    {
        return $this->hasMany(RatingPupuk::class, 'id_pupuk');
    }

    public function detailRekomendasi()
    {
        return $this->hasMany(DetailRekomendasiPupuk::class, 'id_pupuk');
    }

    public function getHargaFormattedAttribute(): string
    {
        return 'Rp ' . number_format($this->harga_per_kg, 0, ',', '.');
    }

    public function getGambarUrlAttribute(): ?string
    {
        return $this->gambar ? Storage::url($this->gambar) : null;
    }
}
