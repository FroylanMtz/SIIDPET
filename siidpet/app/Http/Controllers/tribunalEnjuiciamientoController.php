<?php

namespace App\Http\Controllers;

use App\Models\TribunalEnjuiciamiento;
use Illuminate\Http\Request;

class tribunalEnjuiciamientoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $defensores = Defensor::with('municipio', 'user', 'coordinacion')->where('activo', 1)->get();
        // return response($defensores);


        //Se obtienen todos los objetos de la tabla flagrancia
        // $tribunalEnjuiciamiento = TribunalEnjuiciamiento::all();

        $tribunalEnjuiciamiento = TribunalEnjuiciamiento::with('expediente', 'juez')->get();
        return response( $tribunalEnjuiciamiento );
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
            'id_juez' => 'required',
            'id_expediente' => 'required',
        ]);

        //Se usa la función create() con el request que guarda el objeto
        $tribunalEnjuiciamiento = TribunalEnjuiciamiento::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'tribunal_enjuiciamiento' => $tribunalEnjuiciamiento ], 201);
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
        $tribunalEnjuiciamiento = TribunalEnjuiciamiento::find($id);

        //Compara si la consulta encontró datos
        if (! $tribunalEnjuiciamiento ) {
            return response()->json(['mensaje' => 'Datos del tribunal de enjuiciamiento no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['tribunal_enjuiciamiento' => $tribunalEnjuiciamiento], 201);
    }


    public function obtenerTribunalPorExpediente($id)
    {
        //Se obtiene el registro de la base de datos
        $tribunalEnjuiciamiento = TribunalEnjuiciamiento::with('expediente', 'juez', 'juez.municipio') 
        ->where('id_expediente', $id )
        ->get();

        // $tribunalEnjuiciamiento = TribunalEnjuiciamiento::with('expediente', 'juez')->get();

        //Compara si la consulta encontró datos
        if (! $tribunalEnjuiciamiento ) {
            return response()->json(['mensaje' => 'Datos del tribunal de enjuiciamiento no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['tribunal_enjuiciamiento' => $tribunalEnjuiciamiento], 201);
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
            // Validar los datos recibidos en el $request
        $validatedData = $request->validate([
            'id_juez_control' => 'required|integer|exists:juez_control,id', // Asegúrate de que el ID del juez sea válido
        ]);

        try {
            // Insertar los datos en la tabla
            $inserted = DB::table('tribunal_enjuiciamiento')->insert([
                'activo' => 1, // Establece el valor predeterminado para 'activo'
                'created_at' => now(), // Fecha y hora actuales
                'updated_at' => now(), // Fecha y hora actuales
                'id_expediente' => $id, // ID del expediente
                'id_juez' => $validatedData['id_juez_control'], // ID del juez control del formulario
            ]);

            if ($inserted) {
                return response()->json([
                    'message' => 'Registro creado exitosamente.',
                ], 201);
            } else {
                return response()->json([
                    'message' => 'Error al crear el registro.',
                ], 500);
            }
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Ocurrió un error: ' . $e->getMessage(),
            ], 500);
        }
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
        $tribunalEnjuiciamiento = TribunalEnjuiciamiento::find($id);
        // Verificar si el usuario existe
        if ( $tribunalEnjuiciamiento ) {
            // Eliminar el usuario
            // $tribunalEnjuiciamiento->delete();
            if( $tribunalEnjuiciamiento->activo == 0 ){
                $tribunalEnjuiciamiento->activo = 1;
            }else{
                $tribunalEnjuiciamiento->activo = 0;
            }
            $tribunalEnjuiciamiento->save();
            return response()->json(['mensaje' => 'Datos del tribunal de enjuiciamiento eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }



    public function eliminar($id)
    {
        $tribunalEnjuiciamiento = TribunalEnjuiciamiento::find($id);
        if ( $tribunalEnjuiciamiento ) {
            $tribunalEnjuiciamiento->delete();
            return response()->json(['mensaje' => 'Datos del tribunal de enjuiciamiento eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }


}
