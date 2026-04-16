<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

// ── RatingPupuk ──────────────────────────────────────────────
class RatingPupuk extends Model
{
    protected $table    = 'rating_pupuk';
    protected $fillable = ['id_pupuk', 'id_kriteria', 'id_penyakit', 'nilai'];

    public function pupuk()
    {
        return $this->belongsTo(Pupuk::class,    'id_pupuk');
    }
    public function kriteria()
    {
        return $this->belongsTo(Kriteria::class, 'id_kriteria');
    }
    public function penyakit()
    {
        return $this->belongsTo(Penyakit::class, 'id_penyakit');
    }
}
