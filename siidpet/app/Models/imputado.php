<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\Pais;
use App\Models\Estado;
use App\Models\Municipio;
use App\Models\Escolaridad;
use App\Models\Ocupacion;

class imputado extends Model
{
    use HasFactory;

    protected $table = 'imputado';

    protected $fillable = [
        'nombres',
        'apellido_paterno',
        'apellido_materno',
        'telefono',
        'domicilio',
        'sexo',
        'id_pais',
        'id_estado',
        'id_municipio',
        'estado_civil',
        'fecha_de_nacimiento',
        'id_escolaridad',
        'id_ocupacion',
        'activo',
    ];

    public function pais(){
        return $this->belongsTo(Pais::class, 'id_pais'); 
    }

    public function municipio(){
        return $this->belongsTo(Municipio::class, 'id_municipio'); 
    }

    public function estado(){
        return $this->belongsTo(Estado::class, 'id_estado'); 
    }

    public function escolaridad(){
        return $this->belongsTo(Escolaridad::class, 'id_escolaridad'); 
    }

    public function ocupacion(){
        return $this->belongsTo(Ocupacion::class, 'id_ocupacion'); 
    }


}
