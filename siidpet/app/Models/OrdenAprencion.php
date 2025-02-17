<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrdenAprencion extends Model
{
    use HasFactory;

    protected $table = 'orden_aprencion';

    protected $fillable = [
        'fecha',
        'hora',
        'observaciones',
        'activo',
    ];

}
