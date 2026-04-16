<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\Storage;

class Penyakit extends Model
{
    use HasFactory;

    protected $table    = 'penyakit';
    protected $fillable = ['kode', 'nama', 'deskripsi', 'gambar'];

    public function gejala()
    {
        return $this->belongsToMany(
            Gejala::class,
            'penyakit_gejala',
            'id_penyakit',
            'id_gejala'
        );
    }

    public function ratingPupuk()
    {
        return $this->hasMany(RatingPupuk::class, 'id_penyakit');
    }

    public function ratingPestisida()
    {
        return $this->hasMany(RatingPestisida::class, 'id_penyakit');
    }

    public function rekomendasi()
    {
        return $this->hasMany(Rekomendasi::class, 'id_penyakit');
    }

    public function getGambarUrlAttribute(): ?string
    {
        return $this->gambar ? Storage::url($this->gambar) : null;
    }
}
