<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExamenDetencion extends Model
{
    use HasFactory;

    protected $table = 'examen_detencion';

    public $timestamps = false;

    protected $fillable = ['fecha', 'hora', 'resultado'];
}
