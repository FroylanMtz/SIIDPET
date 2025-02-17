<?php

namespace App\Http\Controllers;

use App\Models\Ocupacion;
use Illuminate\Http\Request;

class ocupacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ocupacion = Ocupacion::all();
        return response( $ocupacion );
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
        $request->validate([
            'nombre' => 'required',
        ]);

        $ocupacion = Ocupacion::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'ocupacion' => $ocupacion ], 201);
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
        $ocupacion = Ocupacion::find($id);

        //Compara si la consulta encontró datos
        if (! $ocupacion) {
            return response()->json(['mensaje' => 'Datos de la ocupacion no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['ocupacion' => $ocupacion ], 201);
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
        $ocupacion = Ocupacion::find($id);

        // Verifica si el usuario existe
        if (! $ocupacion ) {
            return response()->json(['mensaje' => 'Datos de la ocupacion no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $ocupacion->update($request->all());

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
        $ocupacion = Ocupacion::find($id);

        // Verificar si el usuario existe
        if ( $ocupacion ) {
            // Eliminar el usuario
            $ocupacion->delete();
            return response()->json(['mensaje' => 'Datos de la ocupacion eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
