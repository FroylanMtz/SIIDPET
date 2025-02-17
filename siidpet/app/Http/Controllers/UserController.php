<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $users = DB::table('users')->get();
        return response($users);
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
        
        $this->validate($request, [
            'name' => 'required|max:30',
            'fathername' => 'required|max:50',
            'mothername' => 'required|max:50',
            'phone' => 'required|max:15',
            'email' => 'required|email',
            'password' => 'required',
            'IDRol' => 'required',
            'gender' => 'required'
        ]);
        
        
        $id_usuario = DB::table('users')->insertGetId([
            'email' => $request->input('email'),
            'gender' => $request->input('gender'),
            'activo' => $request->input('activo'),
            'phone' => $request->input('phone'),
            'name' => $request->input('name'),
            'fathername' => $request->input('fathername'),
            'mothername' => $request->input('mothername'),
            'password' => Hash::make($request->input('password')),
            'created_at' => date('Y-m-d'),
            'IDRol' => $request->input('IDRol')
        ]);


        $id = DB::table('defensor')->insertGetId([

            'id_usuario' => $request->input('email'),
            'id_municipio' => $request->input('email'),
            'id_coordinacion' => $request->input('email'),
            'activo' => 1,

            'gender' => $request->input('gender'),
            'activo' => $request->input('activo'),
            'phone' => $request->input('phone'),
            'name' => $request->input('name'),
            'fathername' => $request->input('fathername'),
            'mothername' => $request->input('mothername'),
            'password' => Hash::make($request->input('password')),
            'created_at' => date('Y-m-d'),
            'IDRol' => $request->input('IDRol')
        ]);

        // return response("Usuario guardado con éxito", 200);
        return response()->json(['mensaje' => 'Datos guardados con éxito', 'defensor' => $id ], 201);
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
        $this->validate($request, [
            'name' => 'required',
            'fathername' => 'required',
            'mothername' => 'required',
            'phone' => 'required',
            'gender' => 'required',
            'email' => 'required|email',
            'IDRol' => 'required'
        ]);
        //
        $usuario = User::find($id);
        $usuario->name = $request->input('name');
        $usuario->email = $request->input('email');
        $usuario->fathername = $request->input('fathername');
        $usuario->mothername = $request->input('mothername');
        $usuario->phone = $request->input('phone');
        $usuario->gender = $request->input('gender');
        $usuario->IDRol = $request->input('IDRol');
        
        if( $request->input('password') != "" ){
            $usuario->password = Hash::make( $request->input('password') );
        }

        $usuario->IDRol = $request->input('IDRol');
        $usuario->save();

        
        return response("Usuario almacenado correctamente ", 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $usuario = User::find($id);

        // Verificar si el usuario existe
        if ($usuario) {

            if( $usuario->activo == 0 ){
                $usuario->activo = 1;
            }else{
                $usuario->activo = 0;
            }
            
            $usuario->save();
        
            return response()->json(['mensaje' => 'Usuario desactivado correctamente'], 201);
        } else {
            return response()->json(['mensaje' => 'No se ha encontrado el registro correspondiente'], 201);
        }


    }

    public function eliminarUsuario($id)
    {
        $usuario = User::find($id);
        $usuario->delete();
        return response(["Usuario eliminado correctamente"]);
    }
}
