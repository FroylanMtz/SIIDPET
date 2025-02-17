<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Escolaridad;

class escolaridadController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Se obtienen todos los registros de escolaridad que tenga la base de datos
        $escolaridad = Escolaridad::all();
        return response( $escolaridad );
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
            'nombre' => 'required',
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $escolaridad = Escolaridad::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'datos' => $escolaridad ], 201);
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
        $escolaridad = Escolaridad::find($id);

        //Compara si la consulta encontró datos
        if (!$escolaridad) {
            return response()->json(['mensaje' => 'Dato de escolaridad no encontrado'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['escolaridad' => $escolaridad], 201);
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
        $escolaridad = Escolaridad::find($id);

        // Verifica si el usuario existe
        if (!$escolaridad) {
            return response()->json(['mensaje' => 'Dato de escolaridad no encontrado'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $escolaridad->update($request->all());

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
        $escolaridad = Escolaridad::find($id);

        // Verificar si el usuario existe
        if ($escolaridad) {
            // Eliminar el usuario
            $escolaridad->delete();
            return response()->json(['mensaje' => 'Dato de escolaridad eliminado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el juez'], 201);
        }
    }
}
