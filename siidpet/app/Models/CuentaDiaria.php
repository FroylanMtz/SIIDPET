<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CuentaDiaria extends Model
{
    use HasFactory;

    protected $table = 'cuenta_diaria';

    public $timestamps = false;

    protected $fillable = [
        'num',
        'cp',
        'fecha',
        'hora',
        'sala',
        'observaciones',
        'resultado',
        'imputado',
        'delito',
        'audiencia',
        'activo',

    ];
}
