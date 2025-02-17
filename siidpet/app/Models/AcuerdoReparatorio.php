<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AcuerdoReparatorio extends Model
{
    use HasFactory;

    protected $table = 'acuerdo_reparatorio';

    protected $fillable = [
        'fecha_inicio',
        'fecha_fin',
        'resultado',
        'observaciones',
        'activo',

    ];

}
