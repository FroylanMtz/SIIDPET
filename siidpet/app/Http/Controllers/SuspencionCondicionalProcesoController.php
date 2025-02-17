<?php

namespace App\Http\Controllers;

use App\Models\SuspencionCondicionalProceso;
use Illuminate\Http\Request;

class SuspencionCondicionalProcesoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //Se obtienen todos los objetos de la tabla flagrancia
        $suspencionCondicional = SuspencionCondicionalProceso::all();
        return response( $suspencionCondicional );
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
        //Se validan los datos a traves de laravel
        $request->validate([
            'fecha_inicio' => 'required',
            'fecha_fin' => 'required',
            'resultado' => 'required',
            'reporte_cumplimiento' => 'required',
            'observaciones' => 'required'
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $suspencionCondicional = SuspencionCondicionalProceso::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'suspencion_condicional' => $suspencionCondicional ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //Se obtiene el registro de la base de datos
        $SuspencionCondicional = SuspencionCondicionalProceso::find($id);

        //Compara si la consulta encontró datos
        if (! $SuspencionCondicional ) {
            return response()->json(['mensaje' => 'Datos de la suspencion condicional no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['suspencion_condicional' => $SuspencionCondicional], 201);
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
        // Encontramos el dato con el id
        $suspencionCondicional = SuspencionCondicionalProceso::find($id);

        // Verifica si el usuario existe
        if (! $suspencionCondicional ) {
            return response()->json(['mensaje' => 'Datos de la suspencion condicional no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $suspencionCondicional->update($request->all());

        // Puedes devolver una respuesta JSON, un mensaje de éxito, etc.
        return response()->json(['mensaje' => 'Datos actualizados con éxito']);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // Buscar el usuario por su ID
        $suspencionCondicional = SuspencionCondicionalProceso::find($id);

        // Verificar si el usuario existe
        if ( $suspencionCondicional ) {
            // Eliminar el usuario
            $suspencionCondicional->delete();
            return response()->json(['mensaje' => 'Datos de la suspecion condicional eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
