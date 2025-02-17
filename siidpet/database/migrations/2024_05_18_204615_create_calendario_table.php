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
        Schema::create('calendario', function (Blueprint $table) {
            $table->id();
            $table->string('evento');
            $table->string('descripcion');
            $table->string('fecha_inicio');
            $table->string('fecha_fin');
            $table->timestamps();
        });

        Schema::create('calendario_imputado', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_calendario')->constrained('calendario');
            $table->foreignId('id_imputado')->constrained('imputado');
            $table->foreignId('id_defensor')->constrained('defensor');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('calendario');
    }
};
