<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Coordinacion;

class CoordinacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $coordinacion = Coordinacion::all();
        return response( $coordinacion );
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
        $coordinacion = Coordinacion::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'coordinacion' => $coordinacion ], 201);
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
        $coordinacion = Coordinacion::find($id);

        //Compara si la consulta encontró datos
        if (! $coordinacion ) {
            return response()->json(['mensaje' => 'Datos de la coordinacion no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['coordinacion' => $coordinacion ], 201);
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
        $coordinacion = Coordinacion::find($id);

        // Verifica si el usuario existe
        if (! $coordinacion ) {
            return response()->json(['mensaje' => 'Datos de la coordinacion no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $coordinacion->update($request->all());

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
        $coordinacion = Coordinacion::find($id);

        // Verificar si el usuario existe
        if ( $coordinacion ) {
            // Eliminar el usuario
            // $coordinacion->delete();
            // $coordinacion->activo = ! $coordinacion->activo;

            if( $coordinacion->activo == 0 ){
                $coordinacion->activo = 1;
            }else{
                $coordinacion->activo = 0;
            }

            $coordinacion->save();
            
            return response()->json(['mensaje' => 'Datos de la coordinacion eliminados correctamente', 'coordinacion' => $coordinacion ], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
