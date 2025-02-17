<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\DelitoProceso;

class DelitoProcesoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //Se obtienen todos los objetos de la tabla
        $delitoProceso = DelitoProceso::all();
        return response( $delitoProceso );
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
            'observaciones' => 'required',
            'activo' => 'required',
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $delitoProceso = DelitoProceso::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'delito_proceso' => $delitoProceso ], 201);
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
        $delitoProceso = DelitoProceso::find($id);

        //Compara si la consulta encontró datos
        if (! $delitoProceso ) {
            return response()->json(['mensaje' => 'Datos del delito proceso no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['delito_proceso' => $delitoProceso], 201);
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
        $delitoProceso = DelitoProceso::find($id);

        // Verifica si el usuario existe
        if (! $delitoProceso ) {
            return response()->json(['mensaje' => 'Datos del delito proceso no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $delitoProceso->update($request->all());

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
        // Buscar el dato por su ID
        $delitoProceso = DelitoProceso::find($id);

        // Verificar si el dato existe
        if ( $delitoProceso ) {
            // Eliminar el usuario
            $delitoProceso->delete();
            return response()->json(['mensaje' => 'Datos del delito proceso eliminado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
