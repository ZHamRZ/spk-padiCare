<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GejalaPestisida extends Model
{
    protected $table = 'gejala_pestisida';

    protected $fillable = [
        'id_gejala',
        'id_pestisida',
        'mb',
        'md',
    ];

    public function gejala()
    {
        return $this->belongsTo(Gejala::class, 'id_gejala');
    }

    public function pestisida()
    {
        return $this->belongsTo(Pestisida::class, 'id_pestisida');
    }
}
