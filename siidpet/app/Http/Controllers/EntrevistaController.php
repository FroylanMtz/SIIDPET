<?php

namespace App\Http\Controllers;

use App\Models\Entrevista;
use Illuminate\Http\Request;

class entrevistaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $entrevista = Entrevista::all();
        return response( $entrevista );
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
            'id_defensor' => 'required',
            'fecha'  => 'required',
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $entrevista = Entrevista::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'entrevista' => $entrevista ], 201);
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
        //Se obtiene el registro de la base de datos
        $entrevista = Entrevista::find($id);

        //Compara si la consulta encontró datos
        if (! $entrevista ) {
            return response()->json(['mensaje' => 'Datos de la entrevista no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['entrevista' => $entrevista ], 201);
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
        $request->validate([
            'id_defensor' => 'required',
            'fecha'  => 'required',
        ]);
        
        // Encontramos el dato con el id
        $entrevista = Entrevista::find($id);

        // Verifica si el usuario existe
        if (! $entrevista ) {
            return response()->json(['mensaje' => 'Datos de la entrevista no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $entrevista->update($request->all());

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
        $entrevista = Entrevista::find($id);

        // Verificar si el usuario existe
        if ( $entrevista ) {
            // Eliminar el usuario
            $entrevista->delete();
            return response()->json(['mensaje' => 'Datos de la entrevista eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
