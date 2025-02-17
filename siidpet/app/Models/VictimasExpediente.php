<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\Victima;
use App\Models\Expediente;

class VictimasExpediente extends Model
{
    use HasFactory;
    
    public $timestamps = false;
    
    protected $table = 'victimasExpediente';

    protected $fillable = [
        "id_expediente",
        "id_victima",
    ];

    public function expediente()
    {
        return $this->belongsTo(Expediente::class, 'id_expediente'); 
    }

    public function victima()
    {
        return $this->belongsTo(Victima::class, 'id_victima'); 
    }


}
