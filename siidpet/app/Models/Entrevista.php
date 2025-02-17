<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Entrevista extends Model
{
    use HasFactory;
    protected $table = 'entrevista';

    protected $fillable = [
        'id_defensor',
        'fecha',
        'observaciones',
        'activo',
    ];
}
