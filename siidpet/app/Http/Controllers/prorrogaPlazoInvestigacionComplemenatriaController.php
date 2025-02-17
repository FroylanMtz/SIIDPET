<?php

namespace App\Http\Controllers;

use App\Models\ProrrogaPlazoInvestigacionComplementaria;
use Illuminate\Http\Request;

class prorrogaPlazoInvestigacionComplemenatriaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //Se obtienen todos los objetos de la tabla de base de datos
        $prorrogaPlazoInvestigacionComplementaria = ProrrogaPlazoInvestigacionComplementaria::all();
        return response( $prorrogaPlazoInvestigacionComplementaria );
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
            'fecha_inicio' => 'required',
            'fecha_vencimiento' => 'required',
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $prorrogaPlazoInvestigacionComplementaria = ProrrogaPlazoInvestigacionComplementaria::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'prorroga_plazo_investigacion_complementaria' => $prorrogaPlazoInvestigacionComplementaria ], 201);
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
        $prorrogaPlazoInvestigacionComplementaria = ProrrogaPlazoInvestigacionComplementaria::find($id);

        //Compara si la consulta encontró datos
        if (! $prorrogaPlazoInvestigacionComplementaria ) {
            return response()->json(['mensaje' => 'Datos de la prorroga complementario no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['prorroga_plazo_investigacion_complementaria' => $prorrogaPlazoInvestigacionComplementaria], 201);
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
        $prorrogaPlazoInvestigacionComplementaria = ProrrogaPlazoInvestigacionComplementaria::find($id);

        // Verifica si el usuario existe
        if (! $prorrogaPlazoInvestigacionComplementaria ) {
            return response()->json(['mensaje' => 'Datos de la prorroga no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $prorrogaPlazoInvestigacionComplementaria->update($request->all());

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
        $prorrogaPlazoInvestigacionComplementaria = ProrrogaPlazoInvestigacionComplementaria::find($id);

        // Verificar si el usuario existe
        if ( $prorrogaPlazoInvestigacionComplementaria ) {
            // Eliminar el usuario
            $prorrogaPlazoInvestigacionComplementaria->delete();
            return response()->json(['mensaje' => 'Datos de la prorroga eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
