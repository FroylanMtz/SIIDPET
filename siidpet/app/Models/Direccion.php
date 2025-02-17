<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Direccion extends Model
{
    use HasFactory;

    protected $table = 'direccion';

    protected $primaryKey = 'id';
    
    protected $fillable = [
        'id',
        'calle',
        'colonia',
        'municipio',
        'ciudad',
        'estado',
        'pais',
        'num_ext',
        'num_int',
        'activo',
        'created_at',
        'updated_at'
    ];   
}