<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AcuerdoReparatorio;

class AcuerdoReparatorioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $acuerdosReparatorios = AcuerdoReparatorio::all();
        return response( $acuerdosReparatorios );
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
            'fecha_inicio' => 'required|date',
            'fecha_fin' => 'required|date',
            'resultado' => 'required',
            'observaciones' => 'required',
        ]);

        $acuerdoReparatorio = AcuerdoReparatorio::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos del acuerdo repatario creados con éxito', 'acuerdoreparatorio' => $acuerdoReparatorio ], 201);
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
        $acuerdoReparatorio = AcuerdoReparatorio::find($id);

        if (!$acuerdoReparatorio) {
            return response()->json(['mensaje' => 'Datos del acuerdo no encontrados'], 404);
        }

        return response()->json(['acuerdoreparatorio' => $acuerdoReparatorio], 201);
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
        $acuerdoReparatorio = AcuerdoReparatorio::find($id);

        // Verifica si el usuario existe
        if (!$acuerdoReparatorio) {
            return response()->json(['mensaje' => 'Datos del acuerdo reparatorio no encontrado'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $acuerdoReparatorio->update($request->all());

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
        $acuerdoReparatorio = AcuerdoReparatorio::find($id);

        // Verificar si el usuario existe
        if ($acuerdoReparatorio) {
            // Eliminar el usuario
            $acuerdoReparatorio->delete();
            return response()->json(['mensaje' => 'Acuerdo reparatorio eliminado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se han encontrado datos del acuerdo reparatorio '], 201);
        }
    }
}
