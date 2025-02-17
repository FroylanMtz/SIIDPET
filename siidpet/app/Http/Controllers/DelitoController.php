<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Delito;

class DelitoController extends Controller
{
    
    public function index()
    {
        //
        $delito = Delito::orderBy('activo', 'DESC')->get();

        return response( $delito );
    }

    public function create()
    {
        return view('delitos.create');
    }

    public function store(Request $request)
    {
        //Se validan los datos a traves de laravel
        $request->validate([
            'nombre' => 'required',
            'activo' => 'required',
        ]);

        //Se usa la función create() con el request que guarda el objeto
        Delito::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'delito' => $request ], 201);
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
        $delito = Delito::find($id);

        //Compara si la consulta encontró datos
        if ($delito) {
            return response()->json(['mensaje' => 'Delito no encontrado'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['delito' => $delito], 201);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $delito = Delito::find($id);

        if ($delito) {
            // Eliminar el usuario
            //$delito->delete();
        
      
            $delito->activo = 1;
            $delito->save();
        
            return response()->json(['mensaje' => 'Delito activado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el Delito correspondiente'], 201);
        }
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
        $delito = Delito::find($id);

        // Verifica si el usuario existe
        if (!$delito) {
            return response()->json(['mensaje' => 'Delito no encontrado'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $delito->update($request->all());

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
        $delito = Delito::find($id);

        // Verificar si el usuario existe
        if ($delito) {
            // Eliminar el usuario
            //$delito->delete();
        
      
            if( $delito->activo == 0 ){
                $delito->activo = 1;
            }else{
                $delito->activo = 0;
            }
            
            $delito->save();
            return response()->json(['mensaje' => 'Registo desactivado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el registro correspondiente'], 201);
        }
    }

    public function showPorExpediente($id)
    {
        $id_expediente = $id; // Este es el valor con el que deseas comparar
        $delitos = Delito::join('expediente_delito', 'delito.id', '=', 'expediente_delito.delito_id')
                 ->where('expediente_delito.expediente_id', $id_expediente)
                 ->where('delito.activo', 1)
                 ->get();

        return response($imputados);
    }
}
