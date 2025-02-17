<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\VictimasExpediente;
use App\Models\Victima;
use Illuminate\Support\Facades\DB;


class victimaExpedienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $expediente = VictimasExpediente::with('expediente', 'victima')->get();
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
        $imputadosExpediente = VictimasExpediente::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'victimasExpediente' => $imputadosExpediente ], 201);
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
        $victimasExpediente = VictimasExpediente::with('expediente', 'victima')->where('id_expediente', $id);

        //Compara si la consulta encontró datos
        if (! $victimasExpediente ) {
            return response()->json(['mensaje' => 'Datos del expediente no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['expediente' => $victimasExpediente], 201);

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
    public function destroy($idExpediente, $idVictima)
    {
        $victimasExpediente = DB::table('victimasExpediente')
        ->where('id_victima', $idVictima)
        ->where('id_expediente', $idExpediente)
        ->delete();
        return response()->json(['mensaje' => 'Datos eliminados con éxito', 'victimaExpediente' => $victimasExpediente ], 201);
    }

    public function showPorExpediente($id)
    {
        $id_expediente = $id;
        $imputados = Victima::with('pais', 'estado', 'municipio', 'ocupacion')
            ->join('victimasExpediente', 'victima.id', '=', 'victimasExpediente.id_victima')
            ->where('victimasExpediente.id_expediente', $id_expediente)
            ->where('victima.activo', 1)
            ->get();
        return response($imputados);
    }
}
