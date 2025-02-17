<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('coordinacion', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('pais', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('estado', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->foreignId('id_pais')->constrained('pais')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('municipio', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->foreignId('id_estado')->constrained('estado')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('ugi', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('ugi_municipio', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_municipio')->constrained('municipio')->nullable();
            $table->foreignId('id_ugi')->constrained('ugi')->nullable();
            $table->timestamps();
        });

        Schema::create('defensor', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_usuario')->constrained('users')->nullable();
            $table->foreignId('id_municipio')->constrained('municipio')->nullable();
            $table->string('sexo')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('defensor_ugi', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_defensor')->constrained('defensor')->nullable();
            $table->foreignId('id_ugi')->constrained('ugi')->nullable();
            $table->timestamps();
        });

        Schema::create('entrevista', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_defensor')->constrained('defensor')->nullable();
            $table->date('fecha')->nullable();
            $table->text('observaciones')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('escolaridad', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('ocupacion', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('imputado', function (Blueprint $table) {
            $table->id();
            $table->string('nombres')->nullable();
            $table->string('apellido_paterno')->nullable();
            $table->string('apellido_materno')->nullable();
            $table->string('telefono')->nullable();
            $table->string('domicilio')->nullable();
            $table->string('sexo')->nullable();
            $table->foreignId('id_pais')->constrained('pais')->nullable();
            $table->foreignId('id_estado')->constrained('estado')->nullable();
            $table->foreignId('id_municipio')->constrained('municipio')->nullable();
            $table->string('estado_civil')->nullable();
            $table->string('fecha_de_nacimiento')->nullable();
            $table->foreignId('id_escolaridad')->constrained('escolaridad')->nullable();
            $table->foreignId('id_ocupacion')->constrained('ocupacion')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });
        
        Schema::create('delito', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('victima', function (Blueprint $table) {
            $table->id();
            $table->string('nombres')->nullable();
            $table->string('apellido_paterno')->nullable();
            $table->string('apellido_materno')->nullable();
            $table->string('telefono')->nullable();
            $table->string('domicilio')->nullable();
            $table->string('sexo')->nullable();
            $table->foreignId('id_pais')->constrained('pais')->nullable();
            $table->foreignId('id_estado')->constrained('estado')->nullable();
            $table->foreignId('id_municipio')->constrained('municipio')->nullable();
            $table->string('estado_civil')->nullable();
            $table->string('fecha_nacimiento')->nullable();
            $table->foreignId('id_ocupacion')->constrained('ocupacion')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('flagrancia', function (Blueprint $table) {
            $table->id();
            $table->string('fecha')->nullable();
            $table->string('hora')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('medida_proteccion', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('asignacion_medidas', function (Blueprint $table) {
            $table->id();
            $table->string('fecha_inicio')->nullable();
            $table->string('fecha_vencimiento')->nullable();
            $table->foreignId('id_medida_proteccion')->constrained('medida_proteccion')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('estatus_sede_ministerial', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('acuerdo_sede_ministerial', function (Blueprint $table) {
            $table->id();
            $table->string('medidas_de_proteccion')->nullable();
            $table->string('fecha_inicio')->nullable();
            $table->string('fecha_fin')->nullable();
            $table->foreignId('id_estatus_sede_ministerial')->constrained('estatus_sede_ministerial')->nullable();
            $table->string('fecha')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        }); 

        Schema::create('juez_control', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->foreignId('id_municipio')->constrained('municipio')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('acuerdo_reparatorio', function (Blueprint $table) {
            $table->id();
            $table->string('fecha_inicio')->nullable();
            $table->string('fecha_fin')->nullable();
            $table->string('resultado')->nullable();
            $table->string('observaciones')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('delito_proceso', function (Blueprint $table) {
            $table->id();
            $table->string('fecha_inicio')->nullable();
            $table->string('fecha_fin')->nullable();
            $table->string('resultado')->nullable();
            $table->string('observaciones')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('investigacion_complementaria', function (Blueprint $table) {
            $table->id();
            $table->string('fecha')->nullable();
            $table->string('hora')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        #prorroga_plazo_investigacion_complementaria
        Schema::create('prorroga_plazo_investigacion_complementaria', function (Blueprint $table) {
            $table->id();
            $table->string('fecha')->nullable();
            $table->string('hora')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('medida_cautelar', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('medida_cautelar_a', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->foreignId('id_medida_cautelar')->constrained('medida_cautelar')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('suspencion_condicional_proceso', function (Blueprint $table) {
            $table->id();
            $table->string('fecha_inicio')->nullable();
            $table->string('fecha_fin')->nullable();
            $table->string('resultado')->nullable();
            $table->string('reporte_cumplimiento')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('procedimiento_abreviado', function (Blueprint $table) {
            $table->id();
            $table->string('fecha')->nullable();
            $table->string('sentencia')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('tribunal_enjuiciamiento', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->foreignId('id_municipio')->constrained('municipio')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('conclusion', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->string('fecha_conclusion')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('impugnacion', function (Blueprint $table) {
            $table->id();
            $table->string('nombre')->nullable();
            $table->string('fecha_impugnacion')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('detencion', function (Blueprint $table) {
            $table->id();
            $table->string('fecha')->nullable();
            $table->string('hora')->nullable();
            $table->text('resultado_examen')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

        Schema::create('orden_aprencion', function (Blueprint $table) {
            $table->id();
            $table->string('fecha')->nullable();
            $table->string('hora')->nullable();
            $table->text('observaciones')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });
        
        Schema::create('expediente', function (Blueprint $table) {
            $table->id();
            $table->string('foja')->nullable();
            $table->foreignId('id_ugi')->constrained('ugi')->nullable();
            $table->foreignId('id_defensor')->constrained('defensor')->nullable();
            $table->foreignId('id_entrevista')->constrained('entrevista')->nullable();
            $table->string('nuc')->nullable();
            $table->foreignId('id_imputado')->constrained('imputado')->nullable();
            $table->foreignId('id_delito')->constrained('delito')->nullable();
            $table->foreignId('id_victima')->constrained('victima')->nullable();
            $table->foreignId('id_flagrancia')->constrained('flagrancia')->nullable();
            $table->text('determinacion_mp')->nullable();
            $table->foreignId('id_asignacion_medidas')->constrained('asignacion_medidas')->nullable();
            $table->foreignId('id_acuerdo_sede_ministerial')->constrained('acuerdo_sede_ministerial')->nullable();
            $table->string('carpeta_procesal')->nullable();
            $table->string('audiencia_inicial')->nullable();
            $table->foreignId('id_juez_control')->constrained('juez_control')->nullable();
            $table->foreignId('id_defensor_audiencia')->constrained('defensor')->nullable();
            $table->string('cita_mecanismos')->nullable();
            $table->foreignId('id_acuerdo_reparatorio')->constrained('acuerdo_reparatorio')->nullable();
            $table->date('fecha_formulacion_imputacion')->nullable();
            $table->date('fecha_vinculacion_proceso')->nullable();
            $table->foreignId('id_delito_proceso')->constrained('delito_proceso')->nullable();
            $table->foreignId('id_investigacion_complementaria')->constrained('investigacion_complementaria')->nullable();
            $table->foreignId('id_prorroga_plazo')->constrained('prorroga_plazo_investigacion_complementaria')->nullable();
            $table->foreignId('id_medida_cautelar')->constrained('medida_cautelar')->nullable();
            $table->string('audiencia_intermedia')->nullable();
            $table->foreignId('id_suspencion_condicional_proceso')->constrained('suspencion_condicional_proceso')->nullable();
            $table->foreignId('id_procedimiento_abreviado')->constrained('procedimiento_abreviado')->nullable();
            $table->string('juicio')->nullable();
            $table->foreignId('id_tribunal_enjuiciamiento')->constrained('tribunal_enjuiciamiento')->nullable();
            $table->string('sentencia_juicio')->nullable();
            $table->foreignId('id_conclusion')->constrained('conclusion')->nullable();
            $table->string('visita_carcelaria')->nullable();
            $table->foreignId('id_impugnacion')->constrained('impugnacion')->nullable();
            $table->foreignId('id_orden_aprencion')->constrained('orden_aprencion')->nullable();
            $table->boolean('activo')->nullable();
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
};
