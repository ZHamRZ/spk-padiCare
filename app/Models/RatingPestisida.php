<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RatingPestisida extends Model
{
    protected $table    = 'rating_pestisida';
    protected $fillable = ['id_pestisida', 'id_kriteria', 'id_penyakit', 'nilai'];

    public function pestisida()
    {
        return $this->belongsTo(Pestisida::class, 'id_pestisida');
    }
    public function kriteria()
    {
        return $this->belongsTo(Kriteria::class,  'id_kriteria');
    }
    public function penyakit()
    {
        return $this->belongsTo(Penyakit::class,  'id_penyakit');
    }
}
