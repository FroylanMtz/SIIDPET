<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MedidaProteccion;

class MedidaProteccionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $medidaproteccion = MedidaProteccion::all();
        return response( $medidaproteccion );
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
        $medidaproteccion = MedidaProteccion::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'medidaproteccion' => $medidaproteccion ], 201);
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
        $medidaProteccion = MedidaProteccion::find($id);

        //Compara si la consulta encontró datos
        if (!$medidaProteccion) {
            return response()->json(['mensaje' => 'Medida proteccion no encontrada'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['medidaproteccion' => $medidaProteccion ], 201);
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
        $medidaProteccion = MedidaProteccion::find($id);

        // Verifica si el usuario existe
        if (! $medidaProteccion ) {
            return response()->json(['mensaje' => 'Medida proteccion no encontrada'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $medidaProteccion->update($request->all());

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
        $medidaProteccion = MedidaProteccion::find($id);

        // Verificar si el usuario existe
        if ($medidaProteccion) {
            $medidaProteccion->delete();
            return response()->json(['mensaje' => 'Medida proteccion eliminada correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado la medida de proteccion'], 201);
        }
    }
}
