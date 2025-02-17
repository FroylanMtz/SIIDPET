<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Impugnacion;


class ImpugnacionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //Se obtienen todos los objetos de la tabla de la impugnación
        $impugnacion = Impugnacion::all();
        return response( $impugnacion );

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
            'fecha_impugnacion' => 'required',
            'observaciones' => 'required'
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $impugnacion = Impugnacion::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'impugnacion' => $impugnacion ], 201);
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
        $impugnacion = Impugnacion::find($id);

        //Compara si la consulta encontró datos
        if (! $impugnacion ) {
            return response()->json(['mensaje' => 'Datos de la impugnacion no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['impugnacion' => $impugnacion], 201);
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
        $impugnacion = Impugnacion::find($id);

        // Verifica si el usuario existe
        if (! $impugnacion) {
            return response()->json(['mensaje' => 'Datos de la impugnacion no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $impugnacion->update($request->all());

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
        $impugnacion = Impugnacion::find($id);

        // Verificar si el usuario existe
        if ( $impugnacion ) {
            // Eliminar el usuario
            $impugnacion->delete();
            return response()->json(['mensaje' => 'Datos de la flagrancia eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
