<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Estado;
class Pais extends Model
{
    use HasFactory;

    protected $table = 'pais';

    protected $fillable = [
        'nombre',
        'activo',
        // ... otras propiedades ...
    ];

    /*public function Estado()
    {
        return $this->belongsTo(Estado::class);
    }*/


}
