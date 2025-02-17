<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Victima;

class VictimaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        // $victima = Victima::all();

        $victima = Victima::with('pais','estado', 'municipio', 'ocupacion')->get();


        return response($victima);
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
            'nombres' => 'required',
            'apellido_paterno' => 'required',
            'apellido_materno' => 'required',
            'telefono' => 'required',
            'domicilio' => 'required',
            'sexo' => 'required',
            'id_pais' => 'required',
            'id_estado' => 'required',
            'id_municipio' => 'required',
            'estado_civil' => 'required',
            'fecha_nacimiento' => 'required',
            'id_ocupacion' => 'required',
        ]);

        $victima = Victima::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos de la victima guardados con éxito', 'victima' => $victima ], 201);

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
        // $victima = Victima::find($id);

        $victima = Victima::with('pais', 'estado', 'municipio', 'ocupacion')
        ->where('id', $id)
        ->first();


        if (!$victima) {
            return response()->json(['mensaje' => 'Victima no encontrada'], 404);
        }

        return response()->json(['victima' => $victima], 201);
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
        $victima = Victima::find($id);

        // Verifica si el usuario existe
        if (!$victima) {
            return response()->json(['mensaje' => 'Victima no encontrada'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $victima->update($request->all());

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
        // Buscar el usuario por su ID
        $victima = Victima::find($id);

        // Verificar si el usuario existe
        if ($victima) {
            // Eliminar el usuario
            $victima->delete();
            return response()->json(['mensaje' => 'Victima eliminada correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado registro de la victima'], 201);
        }
    }
}
