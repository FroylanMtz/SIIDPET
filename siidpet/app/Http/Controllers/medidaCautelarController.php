<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MedidaCautelar;

class medidaCautelarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $medida_cautelar = MedidaCautelar::all();
        return response( $medida_cautelar );
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
        $request->validate([
            'nombre' => 'required',
            'fecha' => 'required'
        ]);

        $medida_cautelar = MedidaCautelar::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'medida_cautelar' => $medida_cautelar ], 201);
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
        $medida_cautelar = MedidaCautelar::find($id);

        //Compara si la consulta encontró datos
        if (! $medida_cautelar ) {
            return response()->json(['mensaje' => 'Datos de la medida cautelar no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['medida_cautelar' => $medida_cautelar ], 201);
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
        $medida_cautelar = MedidaCautelar::find($id);

        // Verifica si el usuario existe
        if (! $medida_cautelar ) {
            return response()->json(['mensaje' => 'Datos de la medida cautelar no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $medida_cautelar->update($request->all());

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
        $medida_cautelar = MedidaCautelar::find($id);

        // Verificar si el usuario existe
        if ( $medida_cautelar ) {
            // Eliminar el usuario
            // $medida_cautelar->delete();

            if( $medida_cautelar->activo == 0 ){
                $medida_cautelar->activo = 1;
            }else{
                $medida_cautelar->activo = 0;
            }

            $medida_cautelar->save();


            return response()->json(['mensaje' => 'Datos de la medida cautelar eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
