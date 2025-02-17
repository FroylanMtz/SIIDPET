<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
         
        
        DB::table('roles')->insert(['nombre' => 'Administrador']);
        DB::table('roles')->insert(['nombre' => 'Director General']);
        DB::table('roles')->insert(['nombre' => 'Director Defensoria']);
        DB::table('roles')->insert(['nombre' => 'Director Asesoria']);
        DB::table('roles')->insert(['nombre' => 'Jefe de Asesorias']);
        DB::table('roles')->insert(['nombre' => 'Defensor']);
        DB::table('roles')->insert(['nombre' => 'Asesor']);
        DB::table('users')->insert(['name'=>'Administrador1','email'=>'prueba1@idpet.com.mx','password'=>Hash::make('12345678'),'IDRol'=>1]);
        DB::table('users')->insert(['name'=>'Administrador1','email'=>'prueba2@idpet.com.mx','password'=>Hash::make('12345678'),'IDRol'=>1]);

        


        //Seeds de Permisos 
        /*DB::table('permisos')->insert(['nombre' => 'Dashboard','detalles' => 'Ver dashboard', 'ruta' => '/' ,'fecha' => '2023-03-10']);
        DB::table('permisos')->insert(['nombre' => 'Ver usuarios','detalles' => 'Ver usuarios', 'ruta' => '/usuarios' ,'fecha' => '2023-03-10']);
        DB::table('permisos')->insert(['nombre' => 'Editar usuarios','detalles' => 'Editar usuarios', 'ruta' => '/usuarios' ,'fecha' => '2023-03-10']);
        DB::table('permisos')->insert(['nombre' => 'Eliminar usuarios','detalles' => 'Eliminar usuarios', 'ruta' => '/usuarios' ,'fecha' => '2023-03-10']);
        DB::table('permisos')->insert(['nombre' => 'Registrar usuarios','detalles' => 'Registrar usuarios', 'ruta' => '/usuarios' ,'fecha' => '2023-03-10']);
        DB::table('permisos')->insert(['nombre' => 'Ver NUC','detalles' => 'Ver dashboard', 'ruta' => '/NUC' ,'fecha' => '2023-03-10']);
        DB::table('permisos')->insert(['nombre' => 'Editar NUC','detalles' => 'Editar dashboard', 'ruta' => '/NUC' ,'fecha' => '2023-03-10']);
        DB::table('permisos')->insert(['nombre' => 'Eliminar NUC','detalles' => 'Eliminar dashboard', 'ruta' => '/NUC' ,'fecha' => '2023-03-10']);
        DB::table('permisos')->insert(['nombre' => 'Registrar NUC','detalles' => 'Registrar dashboard', 'ruta' => '/NUC' ,'fecha' => '2023-03-10']);*/
        



		
    }
}
