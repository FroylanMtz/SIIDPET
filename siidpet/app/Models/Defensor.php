<?php

namespace App\Models;

use App\Models\Municipio;
use App\Models\User;
use App\Models\Coordinacion;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Defensor extends Model
{
    use HasFactory;

    protected $table = 'defensor';

    protected $fillable = [
        'id_usuario',
        'id_municipio',
        'id_coordinacion',
        'activo',
    ];

    public function municipio()
    {
        return $this->belongsTo(Municipio::class, 'id_municipio'); 
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'id_usuario');
    }

    public function coordinacion()
    {
        return $this->belongsTo(Coordinacion::class, 'id_coordinacion');
    }

}
