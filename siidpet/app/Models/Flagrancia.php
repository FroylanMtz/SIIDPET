<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Flagrancia extends Model
{
    use HasFactory;

    protected $table = 'flagrancia';

    protected $fillable = [
        'fecha',
        'hora',
        'activo',
        // ... otras propiedades ...
    ];

}
