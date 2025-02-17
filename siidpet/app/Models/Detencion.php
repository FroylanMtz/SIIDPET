<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Detencion extends Model
{
    use HasFactory;

    protected $table = 'detencion';

    protected $fillable = [
        'fecha',
        'hora',
        'resultado_examen',
        'activo',

    ];


}
