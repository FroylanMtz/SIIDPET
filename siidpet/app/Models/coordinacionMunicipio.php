<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\Coordinacion;
use App\Models\Municipio;

class coordinacionMunicipio extends Model
{
    use HasFactory;

    public $timestamps = false;
    
    protected $table = 'coordinacionMunicipio';

    protected $fillable = [
        "id_coordinacion",
        "id_municipio",
    ];

    public function coordinacion()
    {
        return $this->belongsTo(Coordinacion::class, 'id_coordinacion'); 
    }

    public function municipio()
    {
        return $this->belongsTo(Municipio::class, 'id_municipio'); 
    }


}
