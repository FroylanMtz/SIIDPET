<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Peticionario extends Model
{
    use HasFactory;

    protected $table = 'peticionario';

    protected $primaryKey = 'id';


    protected $fillable = [
        'id',
        'nombres',
        'apellidoP',
        'apellidoM',
        'CURP',
        'IDMunicipio',
        'correo',
        'telefono',
        'telefono_particular',
        'id_direccion',
        'activo',
        'created_at',
        'updated_at'
    ];

    
}
