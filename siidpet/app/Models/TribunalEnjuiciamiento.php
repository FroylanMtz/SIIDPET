<?php

namespace App\Models;


use App\Models\Juez;
use App\Models\Expediente;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TribunalEnjuiciamiento extends Model
{
    use HasFactory;

    protected $table = 'tribunal_enjuiciamiento';

    protected $fillable = [
        'id_expediente',
        'id_juez',
        'activo',
        // ... otras propiedades ...
    ];


    public function expediente()
    {
        return $this->belongsTo(Expediente::class, 'id_expediente'); 
    }


    public function juez()
    {
        return $this->belongsTo(Juez::class, 'id_juez'); 
    }


}
