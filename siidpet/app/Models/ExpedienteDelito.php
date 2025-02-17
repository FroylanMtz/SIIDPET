<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\Delito;
use App\Models\Expediente;

class ExpedienteDelito extends Model
{
    use HasFactory;

    public $timestamps = false;
    
    protected $table = 'expediente_delito';

    protected $fillable = [
        "id_expediente",
        "id_delito",
        // ... otras propiedades ...
    ];

    public function expediente()
    {
        return $this->belongsTo(Expediente::class, 'id_expediente'); 
    }

    public function delito()
    {
        return $this->belongsTo(Delito::class, 'id_delito'); 
    }



}
