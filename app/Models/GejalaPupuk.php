<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GejalaPupuk extends Model
{
    protected $table = 'gejala_pupuk';

    protected $fillable = [
        'id_gejala',
        'id_pupuk',
        'mb',
        'md',
    ];

    public function gejala()
    {
        return $this->belongsTo(Gejala::class, 'id_gejala');
    }

    public function pupuk()
    {
        return $this->belongsTo(Pupuk::class, 'id_pupuk');
    }
}
