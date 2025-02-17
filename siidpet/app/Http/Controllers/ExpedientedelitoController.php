<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


use App\Models\ExpedienteDelito;
use App\Models\Delito;

class ExpedientedelitoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $delitos = ExpedienteDelito::with('expediente', 'delito')->get();
        return response( $delitos );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        //Se validan los datos a traves de laravel
        $request->validate([
            'id_expediente' => 'required',
            'id_delito' => 'required',
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $delito = ExpedienteDelito::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'delito' => $delito ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delitosExpediente($id)
    {
        $delitos = ExpedienteDelito::with('expediente', 'delito')
        ->where('id_expediente', $id)
        ->get();

        if ($delito) {
            return response()->json(['mensaje' => 'Delito no encontrado'], 404);
        }

        return response()->json(['delito' => $delito], 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $delito = ExpedienteDelito::find($id);

        if ($delito) {
      
            $delito->activo = 1;
            $delito->save();        
            return response()->json(['mensaje' => 'Delito activado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el Delito correspondiente'], 201);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function eliminar($idExpediente, $idDelito)
    {
        //
        // $delito = ExpedienteDelito::find($id, );

        $delito = ExpedienteDelito::where('id_expediente', $idExpediente)
                            ->where('id_delito', $idDelito)
                            ->first();


        
        // Verificar si el usuario existe
        if ($delito) {
            // Eliminar el usuario
            // $delito->delete();

            ExpedienteDelito::where('id_expediente', $idExpediente)
                ->where('id_delito', $idDelito)
                ->delete();

            return response()->json(['mensaje' => 'Registo desactivado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el registro correspondiente'], 201);
        }

    }


    public function showPorExpediente($id)
    {
        $id_expediente = $id; // Este es el valor con el que deseas comparar
        $delitos = Delito::join('expediente_delito', 'delito.id', '=', 'expediente_delito.id_delito')
                 ->where('expediente_delito.id_expediente', $id_expediente)
                 ->where('delito.activo', 1)
                 ->get();

        return response($delitos);
    }
}
