<?php

namespace App\Http\Controllers;

use App\Models\imputado;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class imputadoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //return response("Imputados guardado con éxito", 200);
        $imputado = imputado::with('pais','estado', 'municipio', 'escolaridad', 'ocupacion')->get();

        // $expediente = Expediente::with('ugi','')->get();
        return response( $imputado );
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function imputadoPorExpediente($idExpediente)
    {
        //return response("Imputados guardado con éxito", 200);
        $imputado = imputado::all();
        return response( $imputado );
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
        /*$this->validate($request, [
            'nombres' => 'required',
            'apellidoP' => 'required',
            'apellidoM' => 'required',
            'CURP' => 'required|min:18|max:18',
            'IDMunicipio' => 'required',
            'direccion' => 'required',
            'correo' => 'required|email',
            'telefono' => 'required|min:10',
        ]);
        
        $id=DB::table('imputado')->insertGetID([
            'nombres' => $request->input('nombres'),
            'apellidoP' => $request->input('apellidoP'),
            'apellidoM' => $request->input('apellidoM'),
            'CURP' => $request->input('CURP'),
            'IDMunicipio' => $request->input('IDMunicipio'),
            'IDSexo' => $request->input('IDSexo'),
            'direccion' => $request->input('direccion'),
            'correo' => $request->input('correo'),
            'telefono' => $request->input('telefono'),
            'estado' => "En proceso",
        ]);

        //$idnuc = DB::table('NUC')->where('NUC', $request->input('IDNUC'))->get();
        $idnuc = DB::table('NUC')->where('NUC',$request->input('IDNUC'))->get();
        DB::table('NUCImputado')->insert([
            'IDImputado' =>  $id,
            'IDNUC' => $idnuc[0]->id,
        ]);

        return response($id); */

        //Se validan los datos a traves de laravel
        $request->validate([
            'nombres' => 'required',
            'apellido_paterno'=> 'required',
            // 'apellido_materno'=> 'required',
            'telefono'=> 'required',
            'domicilio'=> 'required',
            'sexo'=> 'required',
            'id_pais'=> 'required',
            'id_estado'=> 'required',
            'id_municipio'=> 'required',
            'estado_civil'=> 'required',
            'fecha_de_nacimiento'=> 'required',
            'id_escolaridad'=> 'required',
            'id_ocupacion'=> 'required',
        ]);

        $imputado = imputado::create( $request->all() );

        // Puedes realizar otras acciones después de la creación, como redireccionar o devolver una respuesta JSON
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'imputado' => $imputado ], 201);

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
        // $imputado = imputado::find($id);

        $imputado = Imputado::with('pais', 'estado', 'municipio', 'escolaridad', 'ocupacion')
        ->where('id', $id)
        ->first();


        //Compara si la consulta encontró datos
        if (! $imputado) {
            return response()->json(['mensaje' => 'Datos del imputado no encontrados'], 404);
        }

        //Lo retorna con un código 201
        return response()->json(['imputado' => $imputado ], 201);
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
        $imputado = imputado::find($id);

        // Verifica si el usuario existe
        if (! $imputado ) {
            return response()->json(['mensaje' => 'Datos del imputado no encontrados'], 404);
        }

        // Actualiza los datos con los nuevos datos proporcionados
        $imputado->update($request->all());

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
        $imputado = imputado::find($id);

        // Verificar si el usuario existe
        if ( $imputado ) {
            // Eliminar el usuario
            // $imputado->delete();
            $imputado->activo = 0;
            $imputado->save();
            return response()->json(['mensaje' => 'Datos del imputado eliminados correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el dato'], 201);
        }
    }


    public function getImputadosPorNuc(string $nuc){
        //return response($nuc);
        $idnuc = DB::table('NUC')->where('NUC', $nuc)->value('id');
        $datos=DB::table('NUCImputado')
        ->join('imputado','NUCImputado.IDImputado','=','imputado.id')
        ->where('NUCImputado.IDNUC',$idnuc)
        ->get();
        return response($datos);
    }
}
