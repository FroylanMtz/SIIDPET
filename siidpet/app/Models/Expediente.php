<?php

namespace App\Models;

use App\Models\Ugi;
use App\Models\Defensor;
use App\Models\Entrevista;
use App\Models\imputado;
use App\Models\Delito;
use App\Models\Victima;
use App\Models\Flagrancia;
use App\Models\AsignacionMedidas;
use App\Models\AcuerdoSedeMinisterial;
use App\Models\Juez;
use App\Models\AcuerdoReparatorio;
use App\Models\DelitoProceso;
use App\Models\InvestigacionComplementaria;
use App\Models\ProrrogaPlazoInvestigacionComplementaria;
use App\Models\MedidaCautelar;
use App\Models\SuspencionCondicionalProceso;
use App\Models\ProcedimientoAbreviado; 
use App\Models\TribunalEnjuiciamiento;
use App\Models\Conclusion; 
use App\Models\Impugnacion; 
use App\Models\OrdenAprencion; 

use App\Models\ExamenDetencion;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Expediente extends Model
{
    use HasFactory;

    protected $table = 'expediente';

    protected $fillable = [
        "foja",
        "id_ugi",
        "id_defensor",
        "id_entrevista",
        "nuc",
        "id_imputado",
        "id_delito",
        "id_victima",
        "id_flagrancia",
        "determinacion_mp",
        "id_asignacion_medidas",
        "id_acuerdo_sede_ministerial",
        "carpeta_procesal",
        "audiencia_inicial",
        "id_juez_control",
        "id_defensor_audiencia",
        "cita_mecanismos",
        "id_acuerdo_reparatorio",
        "fecha_formulacion_imputacion",
        "fecha_vinculacion_proceso",
        "id_delito_proceso",
        "id_investigacion_complementaria",
        "id_prorroga_plazo",
        "id_medida_cautelar",
        "audiencia_intermedia",
        "id_suspencion_condicional_proceso",
        "id_procedimiento_abreviado",
        "juicio",
        "id_tribunal_enjuiciamiento",
        "sentencia_juicio",
        "id_conclusion",
        "visita_carcelaria",
        "id_impugnacion",
        "id_orden_aprencion",
        "ppl",
        "id_examen_detencion",
        'activo',
        // ... otras propiedades ...
    ];
    
    public function ugi()
    {
        return $this->belongsTo(Ugi::class, 'id_ugi'); 
    }

    public function defensor()
    {
        return $this->belongsTo(Defensor::class, 'id_defensor'); 
    }

    public function entrevista()
    {
        return $this->belongsTo(Entrevista::class, 'id_entrevista'); 
    }

    public function imputado()
    {
        return $this->belongsTo(imputado::class, 'id_imputado'); 
    }

    public function delito()
    {
        return $this->belongsTo(Delito::class, 'id_delito'); 
    }

    public function victima()
    {
        return $this->belongsTo(Victima::class, 'id_victima'); 
    }


    public function flagrancia()
    {
        return $this->belongsTo(Flagrancia::class, 'id_flagrancia'); 
    }


    public function asignacionmedidas()
    {
        return $this->belongsTo(Asignacionmedidas::class, 'id_asignacion_medidas'); 
    }


    public function acuerdosedeministerial()
    {
        return $this->belongsTo(Acuerdosedeministerial::class, 'id_acuerdo_sede_ministerial'); 
    }


    public function juez()
    {
        return $this->belongsTo(Juez::class, 'id_juez_control'); 
    }


    public function defensoraudiencia()
    {
        return $this->belongsTo(Defensor::class, 'id_defensor_audiencia'); 
    }


    public function acuerdoreparatorio()
    {
        return $this->belongsTo(AcuerdoReparatorio::class, 'id_acuerdo_reparatorio'); 
    }


    public function delitoproceso()
    {
        return $this->belongsTo(Delito::class, 'id_delito_proceso'); 
    }


    public function investigacioncomplementaria()
    {
        return $this->belongsTo(InvestigacionComplementaria::class, 'id_investigacion_complementaria'); 
    }


    public function prorrogaplazoinvestigacioncomplementaria()
    {
        return $this->belongsTo(ProrrogaPlazoInvestigacionComplementaria::class, 'id_prorroga_plazo'); 
    }


    public function medidacautelar()
    {
        return $this->belongsTo(MedidaCautelar::class, 'id_medida_cautelar'); 
    }


    public function suspencioncondicionalproceso()
    {
        return $this->belongsTo(SuspencionCondicionalProceso::class, 'id_suspencion_condicional_proceso'); 
    }

    public function procedimientoabreviado()
    {
        return $this->belongsTo(ProcedimientoAbreviado::class, 'id_procedimiento_abreviado'); 
    }

    public function tribunalenjuiciamiento()
    {
        return $this->belongsTo(TribunalEnjuiciamiento::class, 'id_tribunal_enjuiciamiento'); 
    }

    public function conclusion()
    {
        return $this->belongsTo(Conclusion::class, 'id_conclusion'); 
    }

    public function impugnacion()
    {
        return $this->belongsTo(Impugnacion::class, 'id_impugnacion'); 
    }

    public function ordenaprencion()
    {
        return $this->belongsTo(OrdenAprencion::class, 'id_orden_aprencion'); 
    }


    public function imputados()
    {
        return $this->belongsToMany(imputado::class, 'ImputadosExpediente', 'id_expediente', 'id_imputado'); 
    }




}