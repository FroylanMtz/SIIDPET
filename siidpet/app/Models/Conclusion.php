<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Conclusion extends Model
{
    use HasFactory;

    protected $table = 'conclusion';

    protected $fillable = [
        'nombre',
        'fecha_conclusion',
    ];

}
