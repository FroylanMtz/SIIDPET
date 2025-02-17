<?php

namespace App\Http\Controllers;

use App\Models\Estado;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use App\Models\Municipio;


class municipioController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //$municipios = Municipio::all();
        //return response( $municipios );
        $Municipios =  Municipio::all();
        return response($Municipios);
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
            'estado' => 'required',
        ]);

        $municipio = Municipio::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Objeto creado con éxito', 'objeto' => $municipio ], 201);
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
        $municipios = Municipio::where('id_estado', $id)->get();

        if (!$municipios) {
            return response()->json(['mensaje' => 'Municipios no encontrados'], 404);
        }

        return response()->json(['municipio' => $municipios], 201);
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
        $municipio = Municipio::find($id);

        // Verifica si el usuario existe
        if (! $municipio ) {
            return response()->json(['mensaje' => 'Usuario no encontrado'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $municipio->update($request->all());

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
        $municipio = Municipio::find($id);

        // Verificar si el usuario existe
        if ($municipio) {
            // Eliminar el usuario
            $municipio->delete();
            return response()->json(['mensaje' => 'Municipio eliminado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el municipio '], 201);
        }
    }
}
