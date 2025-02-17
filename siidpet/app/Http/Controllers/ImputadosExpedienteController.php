<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\ImputadosExpediente;
use App\Models\imputado;
use Illuminate\Support\Facades\DB;

class ImputadosExpedienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $expediente = ImputadosExpediente::with('expediente', 'imputado')->get();
        return response( $expediente );
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
        
        /*$request->validate([
            "id_expediente" => 'required',
            "id_imputado" => 'required',
        ]);*/
        
        // Se usa la función create() con el request que guarda el objeto
        $imputadosExpediente = ImputadosExpediente::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'imputadosExpediente' => $imputadosExpediente ], 201);
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
        $imputadosExpediente = ImputadosExpediente::with('expediente', 'imputado')->where('id_expediente', $id);

        //Compara si la consulta encontró datos
        if (! $imputadosExpediente ) {
            return response()->json(['mensaje' => 'Datos del expediente no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['expediente' => $imputadosExpediente], 201);
    }


    public function showPorExpediente($id)
    {
        $id_expediente = $id; // Este es el valor con el que deseas comparar
        $imputados = Imputado::with('pais', 'estado', 'municipio', 'escolaridad', 'ocupacion')
            ->join('ImputadosExpediente', 'imputado.id', '=', 'ImputadosExpediente.id_imputado')
            ->where('ImputadosExpediente.id_expediente', $id_expediente)
            ->where('imputado.activo', 1)
            ->get();

        return response($imputados);
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
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($idExpediente, $idImputado)
    {
        //
        $imputadosExpediente = DB::table('ImputadosExpediente')
        ->where('id_imputado', $idImputado)
        ->where('id_expediente', $idExpediente)
        ->delete();

        return response()->json(['mensaje' => 'Datos eliminados con éxito', 'imputadosExpediente' => $imputadosExpediente ], 201);

    }
}
