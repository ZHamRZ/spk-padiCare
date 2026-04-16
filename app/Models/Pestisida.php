<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;

class Pestisida extends Model
{
    protected $table    = 'pestisida';
    protected $fillable = [
        'kode',
        'nama',
        'jenis',
        'bahan_aktif',
        'kandungan_detail',
        'fungsi',
        'dosis',
        'takaran',
        'efek_penggunaan',
        'cara_aplikasi',
        'jadwal_umur_aplikasi',
        'frekuensi_aplikasi',
        'harga',
        'satuan_harga',
        'gambar',
    ];

    public function ratingPestisida()
    {
        return $this->hasMany(RatingPestisida::class, 'id_pestisida');
    }

    public function detailRekomendasi()
    {
        return $this->hasMany(DetailRekomendasiPestisida::class, 'id_pestisida');
    }

    public function getHargaFormattedAttribute(): string
    {
        return 'Rp ' . number_format($this->harga, 0, ',', '.');
    }

    public function getJenisBadgeAttribute(): string
    {
        return match ($this->jenis) {
            'fungisida'   => 'success',
            'bakterisida' => 'info',
            'insektisida' => 'warning',
            'herbisida'   => 'secondary',
            default       => 'primary',
        };
    }

    public function getGambarUrlAttribute(): ?string
    {
        return $this->gambar ? Storage::url($this->gambar) : null;
    }
}
