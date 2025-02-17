<?php

namespace App\Http\Controllers;

use App\Models\Municipio;
use Illuminate\Http\Request;
use App\Models\Defensor;
use App\Models\User;


use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;


class DefensorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $defensores = Defensor::with('municipio', 'user', 'coordinacion')->where('activo', 1)->get();

        $defensores = Defensor::with('municipio', 'user', 'coordinacion')->get();
        return response($defensores);
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

        $this->validate($request, [
            'id_usuario' => 'required',
            'id_municipio' => 'required',
            'id_coordinacion' => 'required',
            'activo' => 'required'
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $defensor = Defensor::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'defensor' => $defensor ], 201);
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
        $defensor = Defensor::find($id);

        //Compara si la consulta encontró datos
        if (! $defensor ) {
            return response()->json(['mensaje' => 'Datos del defensor no encontrado'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['defensor' => $defensor], 201);
    }


    public function obtenerDefensorPorIdUsuario($id)
    {
        //Se obtiene el registro de la base de datos
        $defensor = Defensor::with('municipio', 'user', 'coordinacion')
        ->where('id_usuario', $id)
        ->get();

        //Compara si la consulta encontró datos
        if (! $defensor ) {
            return response()->json(['mensaje' => 'Datos del defensor no encontrado'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['defensor' => $defensor], 201);
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function obtenerDefensoresMunicipio($id)
    {
        $defensores = Defensor::with('municipio', 'user', 'coordinacion')
        ->where('id_municipio', $id)
        ->get();
        return response($defensores);

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
        $defensor = Defensor::find($id);

        // Verifica si el usuario existe
        if (! $defensor ) {
            return response()->json(['mensaje' => 'Datos del defensor no encontrados'], 404);
        }



        // Actualiza los datos con los nuevos datos proporcionados
        $defensor->update($request->all());

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
        // Encontramos el dato con el id
        $defensor = Defensor::find($id);

        // Verificar si el usuario existe
        if ($defensor) {
            // Eliminar el usuario
            //$delito->delete();
            if( $defensor->activo == 0 ){
                $defensor->activo = 1;
            }else{
                $defensor->activo = 0;
            }
            
            $defensor->save();
            return response()->json(['mensaje' => 'Registo desactivado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el registro correspondiente'], 201);
        }


    }
}
