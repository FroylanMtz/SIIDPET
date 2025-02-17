<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Coordinacion extends Model
{
    use HasFactory;

    protected $table = 'coordinacion';

    public $timestamps = false;

    protected $fillable = [
        'nombre',
        'activo',

    ];
}
