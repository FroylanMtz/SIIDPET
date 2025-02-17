<?php

namespace App\Models;

use App\Models\Municipio;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Juez extends Model
{
    use HasFactory;

    protected $table = 'juez_control';
    

    protected $fillable = [
        'nombre',
        'id_municipio',
        'activo',
        // ... otras propiedades ...
    ];

    public function municipio()
    {
        return $this->belongsTo(Municipio::class, 'id_municipio'); 
    }


}
