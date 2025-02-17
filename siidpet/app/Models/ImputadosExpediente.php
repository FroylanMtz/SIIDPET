<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\imputado;
use App\Models\Expediente;

class ImputadosExpediente extends Model
{
    use HasFactory;

    public $timestamps = false;
    
    protected $table = 'ImputadosExpediente';

    protected $fillable = [
        "id_expediente",
        "id_imputado",
    ];

    public function expediente()
    {
        return $this->belongsTo(Expediente::class, 'id_expediente'); 
    }

    public function imputado()
    {
        return $this->belongsTo(imputado::class, 'id_imputado'); 
    }


}
