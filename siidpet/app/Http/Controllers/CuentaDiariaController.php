<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\CuentaDiaria;

class CuentaDiariaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        /*$cuentaDiaria = DB::table('cuenta_diaria')->get();
        return response( $cuentaDiaria );*/

        $cuentaDiaria = CuentaDiaria::all();
        return response( $cuentaDiaria );
    }

    public function obenerImputados(){

        $imputados = DB::table('imputado')->get();
        return response($imputados );

    }

    public function obtenerDelitos(){

        $delitos = DB::table('delito')->get();
        return response( $delitos );

    }

    public function obtenerAudiencias(){

       //  $audiencias = DB::table('audiencia')->get();
        
       return response( "asdfasdf" );

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
        $request->validate([
            'num' => 'required',
            'cp' => 'required',
            'fecha' => 'required',
            'hora' => 'required',
            'sala' => 'required',
            'observaciones' => 'required',
            'resultado' => 'required',
            'imputado' => 'required',
            'delito' => 'required',
            'audiencia' => 'required',
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $cuentaDiaria = CuentaDiaria::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'cuentadiaria' => $cuentaDiaria ], 201);


        /*$this->validate($request, [
            'num' => 'required',
            'cp' => 'required|max:10',
            'fecha' => 'required',
            'hora' => 'required',
            'sala' => 'required|max:10',
            'imputado' => 'required',
            'delito' => 'required',
            'audiencia' => 'required',
        ]);
        
        DB::table('cuenta_diaria')->insert([
            'num' => $request->input('num'),
            'cp' => $request->input('cp'),
            'fecha' =>  $request->input('fecha'),
            'hora' => $request->input('hora'),
            'sala' => $request->input('sala'),
            'observaciones' => $request->input('observaciones'),
            'resultado' => $request->input('resultado'),
            'imputado' => $request->input('imputado'),
            'delito' => $request->input('delito'),
            'audiencia' => $request->input('audiencia')
        ]);

        return response("Registro guardado con éxito", 200); */
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
        $cuentadiaria = CuentaDiaria::find($id);

        //Compara si la consulta encontró datos
        if (! $cuentadiaria ) {
            return response()->json(['mensaje' => 'Datos de la cuenta diaria no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['cuentadiaria' => $cuentadiaria ], 201);
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
        $cuentadiaria = CuentaDiaria::find($id);

        // Verifica si el usuario existe
        if (! $cuentadiaria ) {
            return response()->json(['mensaje' => 'Datos de la cuenta diaria no encontrado'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $cuentadiaria->update($request->all());

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
        $cuentadiaria = CuentaDiaria::find($id);

        // Verificar si el usuario existe
        if ( $cuentadiaria ) {
            // Eliminar el usuario
            $cuentadiaria->delete();
            return response()->json(['mensaje' => 'Datos de la cuenta diaria eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
