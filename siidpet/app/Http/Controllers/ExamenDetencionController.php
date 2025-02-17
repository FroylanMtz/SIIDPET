<?php

namespace App\Http\Controllers;

use App\Models\ExamenDetencion;
use Illuminate\Http\Request;

class ExamenDetencionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $examen_detencion = ExamenDetencion::all();
        return response( $examen_detencion );
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
            'fecha' => 'required',
            'hora'=> 'required',
            'resultado' => 'required'
        ]);

        $examen_detencion = ExamenDetencion::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'examen_detencion' => $examen_detencion ], 201);
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
        $examen_detencion = ExamenDetencion::find($id);

        //Compara si la consulta encontró datos
        if (! $examen_detencion ) {
            return response()->json(['mensaje' => 'Datos del examen de detencion no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['examen_detencion' => $examen_detencion ], 201);
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
        $examen_detencion = ExamenDetencion::find($id);

        // Verifica si el usuario existe
        if (! $examen_detencion ) {
            return response()->json(['mensaje' => 'Datos del examen de detencion no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $examen_detencion->update($request->all());

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

        $examen_detencion = ExamenDetencion::find($id);

        // Verificar si el usuario existe
        if ( $examen_detencion ) {
            // Eliminar el usuario
            $examen_detencion->delete();
            return response()->json(['mensaje' => 'Datos de la orden de aprencion eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
