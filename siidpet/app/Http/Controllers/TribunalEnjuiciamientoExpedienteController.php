<?php

namespace App\Http\Controllers;
use App\Models\Juez;
use Illuminate\Http\Request;

class TribunalEnjuiciamientoExpedienteController extends Controller
{
    //

    public function showPorExpediente($id)
    {
        $id_expediente = $id; // Este es el valor con el que deseas comparar
       /* $tribunal = Juez::join('nombre')
            ->join('tribunal_enjuiciamiento', 'juez.id', '=', 'tribunal_enjuiciamiento.id_juez')
            ->where('tribunal_enjuiciamiento.id',$id);
            ->get();*/

            $tribunal = Juez::select('juez_control.nombre') // Selecciona columnas necesarias
            ->join('tribunal_enjuiciamiento', 'juez_control.id', '=', 'tribunal_enjuiciamiento.id_juez')
            ->where('tribunal_enjuiciamiento.id_expediente', $id_expediente)
            ->get();
        
        return response($tribunal);
    }


   

}
