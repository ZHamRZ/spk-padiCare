<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Gejala extends Model
{
    protected $table    = 'gejala';
    protected $fillable = ['kode', 'nama_gejala'];

    public function penyakit()
    {
        return $this->belongsToMany(
            Penyakit::class,
            'penyakit_gejala',
            'id_gejala',
            'id_penyakit'
        );
    }
}
