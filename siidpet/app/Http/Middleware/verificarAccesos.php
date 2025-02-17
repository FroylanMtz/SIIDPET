<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Session;

class verificarAccesos
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {   
        
        // $rol = Auth::user()->IDRol;
        // $user = Auth::user();

        // Session::put('rol', json_encode($rol) );
        // Session::put('user', json_encode($user) );
        // session(['user' => $user]);

        
        if (Auth::check()) {
            $rol = Auth::user()->IDRol;
            $user = Auth::user();
            $id_user = Auth::user()->id;
            
            $defensor = DB::table('defensor')
            ->select('id')
            ->where('id_usuario', $id_user)
            ->first()->id;


            /*
            $permisos = DB::table('rol_permiso')
            ->select('*')
            ->join('permisos', 'rol_permiso.idpermiso', '=', 'permisos.id')
            ->where('rol_permiso.idrol', $rol)
            ->get(); 
            */

            Session::put('rol', json_encode($rol) );
            Session::put('user', json_encode($user) );
            Session::put('id_user', json_encode($id_user) );
            Session::put('defensor', json_encode($defensor));

        }else{

            if (!$request->is('login') ) {
               return redirect()->route('login'); // Redirigir a la ruta de inicio de sesión
            }


        }
    
       
        return $next($request); 
    }
}
