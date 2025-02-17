<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SuspencionCondicionalProceso extends Model
{
    use HasFactory;

    protected $table = 'suspencion_condicional_proceso';

    protected $fillable = [
        'fecha_inicio',
        'fecha_fin',
        'resultado',
        'reporte_cumplimiento',
        'observaciones',
        'activo',
        // ... otras propiedades ...
    ];


}
