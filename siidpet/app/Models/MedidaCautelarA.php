<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MedidaCautelarA extends Model
{
    use HasFactory;

    protected $table = 'medida_cautelar_a';

    protected $fillable = [
        'nombre',
        'id_medida_cautelar'
        'activo',
    ];
}
