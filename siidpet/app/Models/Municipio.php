<?php

namespace App\Models;

use App\Models\Defensor;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Municipio extends Model
{
    use HasFactory;

    protected $table = 'municipio';

    protected $fillable = [
        'nombre',
        'estado',
        'activo',
    ];

    public function defensores()
    {
        // Especifica el nombre de la clave foránea si es diferente de la convención
        // return $this->hasMany(Defensor::class, 'id_municipio'); 
    }

}
