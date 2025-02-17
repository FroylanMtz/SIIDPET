<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProrrogaPlazoInvestigacionComplementaria extends Model
{
    use HasFactory;

    protected $table = 'prorroga_plazo_investigacion_complementaria';

    protected $fillable = [
        'fecha_inicio',
        'fecha_vencimiento',
        'activo',
        // ... otras propiedades ...
    ];

}
