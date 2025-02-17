<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Estado;

class estadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $estado = Estado::all();
        return response($estado);
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
            'id_pais' => 'required',
        ]);

        $estado = Estado::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Objeto creado con éxito', 'objeto' => $estado ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        $estado = Estado::where('id_pais', $id)->get();
        if (! $estado ) {
            return response()->json(['mensaje' => 'Estado no encontrado'], 404);
        }
        return response()->json(['estado' => $estado], 201);
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
        //
        // Encontramos el dato con el id
        $estado = Estado::find($id);

        // Verifica si el usuario existe
        if (!$estado ) {
            return response()->json(['mensaje' => 'Estado no encontrado'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $estado->update($request->all());

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
        // return response()->json(['mensaje' => 'ALGO DE RESPUESTA EN DELETE'], 201);
        // Buscar el usuario por su ID
        $estado = Estado::find($id);

        // Verificar si el usuario existe
        if ($estado) {
            // Eliminar el usuario
            $estado->delete();
            return response()->json(['mensaje' => 'Estado eliminado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el estado correspondiente'], 201);
        }
    }
}
