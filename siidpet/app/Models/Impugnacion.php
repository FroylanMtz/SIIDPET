<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Impugnacion extends Model
{
    use HasFactory;

    protected $table = 'impugnacion';

    protected $fillable = [
        'nombre',
        'fecha_impugnacion',
        'observaciones',
        'activo',
    ];


}
