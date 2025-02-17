<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\EstatusSedeMinisterial;

class estatusSedeMinisterialController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //.
        $sedeMinisterial = EstatusSedeMinisterial::all();
        return response()->json(['estatussedeministerial' => $sedeMinisterial ], 201);
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
        ]);

        $estatusSedeMinisterial = EstatusSedeMinisterial::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos de la sede ministerial creado con éxito', 'estatussedeministerial' => $estatusSedeMinisterial ], 201);

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
        $estatusSedeMinisterial = EstatusSedeMinisterial::find($id);

        if (!$estatusSedeMinisterial) {
            return response()->json(['mensaje' => 'Datos de la sede ministerial no encontrada'], 404);
        }

        return response()->json(['sede' => $estatusSedeMinisterial], 201);
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
        $sedeMinisterial = EstatusSedeMinisterial::find($id);

        // Verifica si el usuario existe
        if (!$sedeMinisterial) {
            return response()->json(['mensaje' => 'Sede ministerial no encontrada'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $sedeMinisterial->update($request->all());

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
        $sedeMinisterial = EstatusSedeMinisterial::find($id);

        // Verificar si el usuario existe
        if ($sedeMinisterial) {
            // Eliminar el usuario
            $sedeMinisterial->delete();
            return response()->json(['mensaje' => 'Datos de sede ministerial eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado registro de la sede ministerial'], 201);
        }
    }
}
