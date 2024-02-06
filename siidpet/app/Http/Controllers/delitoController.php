<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Delito;

class delitoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $juez = Delito::all();
        return response( $juez );
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
            'nombre' => 'required',
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $delito = Delito::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'delito' => $delito ], 201);
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
        $juez = Delito::find($id);

        //Compara si la consulta encontró datos
        if (!$juez) {
            return response()->json(['mensaje' => 'Delito no encontrado'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['delito' => $juez], 201);
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
        $delito = Delito::find($id);

        // Verifica si el usuario existe
        if (!$delito) {
            return response()->json(['mensaje' => 'Delito no encontrado'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $delito->update($request->all());

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
        //
        // Buscar el registro por su ID
        $delito = Delito::find($id);

        // Verificar si el usuario existe
        if ($delito) {
            // Eliminar el registro
            $delito->delete();
            return response()->json(['mensaje' => 'Delito eliminado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el delito'], 201);
        }
    }
}
