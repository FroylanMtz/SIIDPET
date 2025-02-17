<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Pais;

class Estado extends Model
{
    use HasFactory;

    protected $table = 'estado';

    protected $fillable = [
        'nombre',
        'id_pais',
        'activo',

        // ... otras propiedades ...
    ];

    public function pais()
    {
        return $this->hasOne(Pais::class, 'id_pais');
    }


}
