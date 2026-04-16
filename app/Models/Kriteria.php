<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kriteria extends Model
{
    protected $table    = 'kriteria';
    protected $fillable = ['kode', 'nama', 'jenis', 'bobot', 'keterangan'];

    public function ratingPupuk()
    {
        return $this->hasMany(RatingPupuk::class, 'id_kriteria');
    }

    public function ratingPestisida()
    {
        return $this->hasMany(RatingPestisida::class, 'id_kriteria');
    }
}
