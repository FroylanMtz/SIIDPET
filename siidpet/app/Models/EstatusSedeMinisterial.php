<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EstatusSedeMinisterial extends Model
{
    use HasFactory;

    protected $table = 'estatus_sede_ministerial';

    protected $fillable = [
        'nombre',
        'activo',
    ];
}
