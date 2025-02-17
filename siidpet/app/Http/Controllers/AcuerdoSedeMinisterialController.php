<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AcuerdoSedeMinisterial;

class AcuerdoSedeMinisterialController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $acuerdoSedeMinisterial = AcuerdoSedeMinisterial::all();
        return response( $acuerdoSedeMinisterial );
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
            'medidas_de_proteccion' => 'required',
            'fecha_inicio'  => 'required',
            'fecha_fin'  => 'required',
            'id_estatus_sede_ministerial'  => 'required',
            'fecha'  => 'required'
        ]);

        $acuerdoSedeMinisterial = AcuerdoSedeMinisterial::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos del acuerdo sede ministerial creados con éxito', 'acuerdosedeministerial' => $acuerdoSedeMinisterial ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $acuerdoSedeMinisterial = AcuerdoSedeMinisterial::find($id);

        if (! $acuerdoSedeMinisterial ) {
            return response()->json(['mensaje' => 'Datos del acuerdo no encontrados'], 404);
        }

        return response()->json(['acuerdosedeministerial' => $acuerdoSedeMinisterial ], 201);
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
        $acuerdoSedeMinisterial = AcuerdoSedeMinisterial::find($id);

        // Verifica si el usuario existe
        if (!$acuerdoSedeMinisterial) {
            return response()->json(['mensaje' => 'Datos del acuerdo no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $acuerdoSedeMinisterial->update($request->all());

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
        $acuerdoSedeMinisterial = AcuerdoSedeMinisterial::find($id);

        // Verificar si el usuario existe
        if ($acuerdoSedeMinisterial) {
            // Eliminar el usuario
            $acuerdoSedeMinisterial->delete();
            return response()->json(['mensaje' => 'Datos del acuerdo ministerial eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado datos del acuerdo ministerial'], 201);
        }
    }
}
