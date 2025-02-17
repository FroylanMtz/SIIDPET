<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AsignacionMedidas extends Model
{
    use HasFactory;

    protected $table = 'asignacion_medidas';

    protected $fillable = [
        'fecha_inicio',
        'fecha_vencimiento',
        'id_medida_proteccion',
        'activo',

        // ... otras propiedades ...
    ];


}
