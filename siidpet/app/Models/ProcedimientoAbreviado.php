<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProcedimientoAbreviado extends Model
{
    use HasFactory;

    protected $table = 'procedimiento_abreviado';

    protected $fillable = [
        'fecha',
        'activo',
        'sentencia',
        // ... otras propiedades ...
    ];

}
