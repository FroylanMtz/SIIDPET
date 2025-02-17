<?php

namespace App\Http\Controllers;

use App\Models\Expediente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class expedienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Obtén el usuario loggeado
        $user = Auth::user();
        $id_defensor = \Session::get('defensor');

        if( $user->IDRol === 1 ){
            // Consulta si es administrador
            $expediente = Expediente::with('ugi', 'defensor.user', 'defensor.municipio', 'defensor.coordinacion' ,'entrevista', 'imputado', 'delito', 'victima', 'flagrancia', 'asignacionmedidas', 'acuerdosedeministerial', 'juez', 'defensoraudiencia', 'acuerdoreparatorio', 'delitoproceso', 'investigacioncomplementaria', 'prorrogaplazoinvestigacioncomplementaria', 'medidacautelar', 'suspencioncondicionalproceso', 'procedimientoabreviado', 'tribunalenjuiciamiento', 'conclusion', 'impugnacion', 'ordenaprencion', 'imputados')->get();

        }else {
            // Consulta si es otro rol que no sea administrador
            $expediente = Expediente::with('ugi', 'defensor.user', 'defensor.municipio', 'defensor.coordinacion', 'entrevista', 'imputado', 'delito', 'victima', 'flagrancia', 'asignacionmedidas', 'acuerdosedeministerial', 'juez', 'defensoraudiencia', 'acuerdoreparatorio', 'delitoproceso', 'investigacioncomplementaria', 'prorrogaplazoinvestigacioncomplementaria', 'medidacautelar', 'suspencioncondicionalproceso', 'procedimientoabreviado', 'tribunalenjuiciamiento', 'conclusion', 'impugnacion', 'ordenaprencion', 'imputados')->select('*') 
            ->where('id_defensor', $id_defensor )
            ->get();

        }

        return response( $expediente );
        // return response( $user );
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
        
        // Obtén el usuario loggeado
        $user = Auth::user();

        //Se validan los datos a traves de laravel
        $request->validate([
            'id_ugi' => 'required',
            'nuc' => 'required',
        ]);
        
        // Crea una copia de los datos del request y agrega el campo adicional
        $data = $request->all();
        // $data['id_defensor'] = $user->id;

        // Se usa la función create() con el request que guarda el objeto
        $expediente = Expediente::create( $data );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'expediente' => $data ], 201);
        
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
        $expediente = Expediente::with('ugi', 'defensor.user', 'defensor.municipio', 'defensor.coordinacion' ,'entrevista', 'imputado', 'delito', 'victima', 'flagrancia', 'asignacionmedidas', 'acuerdosedeministerial', 'juez', 'defensoraudiencia', 'acuerdoreparatorio', 'delitoproceso', 'investigacioncomplementaria', 'prorrogaplazoinvestigacioncomplementaria', 'medidacautelar', 'suspencioncondicionalproceso', 'procedimientoabreviado', 'tribunalenjuiciamiento', 'conclusion', 'impugnacion', 'ordenaprencion', 'imputados')->find($id);

        //Compara si la consulta encontró datos
        if (! $expediente ) {
            return response()->json(['mensaje' => 'Datos del expediente no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['expediente' => $expediente], 201);
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
        $expediente = Expediente::find($id);

        // Verifica si el usuario existe
        if (! $expediente ) {
            return response()->json(['mensaje' => 'Datos del expediente no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $expediente->update($request->all());

        // Puedes devolver una respuesta JSON, un mensaje de éxito, etc.
        return response()->json(['mensaje' => 'Datos actualizados con éxito']);
    }



    public function busquedaConFiltros(Request $request)
    {
        // Obtén los parámetros desde la solicitud
        $id_coordinacion = $request->input('id_coordinacion'); // Ejemplo: [1,2,3,4,5]
        $id_municipio = $request->input('id_municipio'); // Ejemplo: 1 (puedes pasarlo como null para incluir todos)
        $id_defensor = $request->input('id_defensor'); // Ejemplo: [1,3,5,7]


        
        // Construir la consulta
        $query = Expediente::with([
            'ugi', 'defensor.user', 'defensor.municipio', 'defensor.coordinacion', 'entrevista', 'imputado', 'delito', 'victima', 'flagrancia', 'asignacionmedidas', 'acuerdosedeministerial', 'juez', 'defensoraudiencia', 'acuerdoreparatorio', 'delitoproceso', 'investigacioncomplementaria', 'prorrogaplazoinvestigacioncomplementaria', 'medidacautelar', 'suspencioncondicionalproceso', 'procedimientoabreviado', 'tribunalenjuiciamiento', 'conclusion', 'impugnacion', 'ordenaprencion', 'imputados'
        ]);

        // Aplicar los filtros dinámicos
        // Aplicar filtros en la relación defensor
        if ($id_defensor || $id_coordinacion || $id_municipio) {
            $query->whereHas('defensor', function ($query) use ($id_defensor, $id_coordinacion, $id_municipio) {
                if ($id_defensor) {
                    $query->whereIn('id', $id_defensor); // Filtro dinámico para defensor.id
                }

                if ($id_coordinacion) {
                    $query->whereIn('id_coordinacion', $id_coordinacion); // Filtro dinámico para defensor.id_coordinacion
                }

                if ($id_municipio) {
                    $query->where('id_municipio', $id_municipio); // Filtro específico para defensor.id_municipio
                }
            });
        }

        // Obtener los resultados
        $expedientes = $query->get();

        return response()->json($expedientes);
        

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
        $expediente = Expediente::find($id);

        // Verificar si el usuario existe
        if ( $expediente ) {
            // Eliminar el usuario
            $expediente->delete();
            return response()->json(['mensaje' => 'Datos del expediente eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }
}
