<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ConclusionController;
use App\Http\Controllers\CuentaDiariaController;
use App\Http\Controllers\DefensorController;
use App\Http\Controllers\GoogleDriveController;
use App\Http\Controllers\paisController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\MunicipioController;
use App\Http\Controllers\imputadoController;
use App\Http\Controllers\PermisosController;
use App\Http\Controllers\PeticionarioController;
use App\Http\Controllers\etapaProcesalController;
use App\Http\Controllers\sexoController;
use App\Http\Controllers\UgiController;
use App\Http\Controllers\EntrevistaController;
use App\Http\Controllers\VictimaController;
use App\Http\Controllers\FlagranciaController;
use App\Http\Controllers\AsignacionMedidasController;
use App\Http\Controllers\AcuerdoSedeMinisterialController;
use App\Http\Controllers\JuezControlController;
use App\Http\Controllers\AcuerdoReparatorioController;
use App\Http\Controllers\investigacionComplementariaController;
use App\Http\Controllers\prorrogaPlazoInvestigacionComplemenatriaController;
use App\Http\Controllers\medidaCautelarController;
use App\Http\Controllers\SuspencionCondicionalProcesoController;
use App\Http\Controllers\procedimientoAbreviadoController;
use App\Http\Controllers\tribunalEnjuiciamientoController;
use App\Http\Controllers\ImpugnacionController;
use App\Http\Controllers\estadoController;
use App\Http\Controllers\EscolaridadController;
use App\Http\Controllers\OcupacionController;
use App\Http\Controllers\EstatusSedeMinisterialController;
use App\Http\Controllers\medidaCautelarAController;
use App\Http\Controllers\MedidaProteccionController;
use App\Http\Controllers\DetencionController;
use App\Http\Controllers\ordenAprencionController;
use App\Http\Controllers\ExpedienteController;
use App\Http\Controllers\CoordinacionController;
use App\Http\Controllers\DelitoProcesoController;
use App\Http\Controllers\DelitoController;

use App\Http\Controllers\AuthController;

use App\Http\Controllers\ImputadosExpedienteController;
use App\Http\Controllers\TribunalEnjuiciamientoExpedienteController;

use App\Http\Controllers\ExpedientedelitoController;

use App\Http\Controllers\medidasProteccionController;

use App\Http\Controllers\victimaExpedienteController;

use App\Http\Controllers\ExamenDetencionController;

use App\Http\Controllers\coordinacionMunicipioController;



Route::post('/logout', [App\Http\Controllers\Auth\LoginController::class, 'logout'])->name('logout');

Auth::routes();

Route::group(['middleware' => ['auth']], function () {

    Route::get('/', function () {
        return view('home');
    });

    Route::get('/home', function () {
        return redirect('/');
    });


    Route::get('/favicon.ico', function () {
        return redirect('/');
    });

    // ruta personalizada
    

    Route::get('/permisos/{id}', [PermisosController::class, 'obtenerPermisosPorRol']);
    Route::get('/users/eliminar/{id}', [UserController::class, 'eliminarUsuario']);
    Route::get('/permisos/{id}', [PermisosController::class, 'obtenerPermisosPorRol']);
    Route::get('imputado/NUC/{nuc}', [ImputadoController::class, 'getImputadosPorNuc']);
    Route::get('/etapa/imputado/{imputado}', [etapaProcesalController::class, 'getEstados']);
    Route::post('/etapa/finalizar/', [etapaProcesalController::class, 'finalizarEtapa']);
    Route::post('/etapa/masc/', [etapaProcesalController::class, 'masc']);
    Route::get('/peticionario/eliminar/{id}', [PeticionarioController::class, 'eliminarPeticionario']);
    Route::get('/obenerimputados', [CuentaDiariaController::class, 'obenerImputados']);
    Route::get('/obtenerdelitos', [CuentaDiariaController::class, 'obtenerDelitos']);
    
    
    //Route::get('/obteneraudienciass', [CuentaDiariaController::class, 'obtenerAudiencias']);
    Route::get('/123', [CuentaDiariaController::class, 'obtenerAudiencias']);

    
    Route::resource('cuentadiaria', CuentaDiariaController::class);
    Route::resource('peticionario', PeticionarioController::class);
    Route::resource('users', UserController::class);

    Route::get('/municipios/{id}', [MunicipioController::class, 'show']);
    Route::resource('municipios', MunicipioController::class);
    
    Route::resource('imputado', imputadoController::class);
    Route::resource('etapaProcesal', etapaProcesalController::class);
    Route::resource('sexo', sexoController::class);

    Route::get('activarugi', [UgiController::class, 'activar']);
    Route::resource('ugi', UgiController::class);
    
    Route::resource('defensor', DefensorController::class);

    Route::get('/obtenerDefensoresMunicipio/{id}', [DefensorController::class, 'obtenerDefensoresMunicipio']);

    Route::resource('entrevista', EntrevistaController::class);
    Route::resource('victima', VictimaController::class);
    Route::resource('flagrancia', FlagranciaController::class);
    Route::resource('asignacionmedidas', AsignacionMedidasController::class);
    Route::resource('acuerdosedeministerial', AcuerdoSedeMinisterialController::class);
    Route::resource('juezcontrol', JuezControlController::class);
    Route::resource('acuerdoreparatorio', AcuerdoReparatorioController::class);
    Route::resource('investigacioncomplementaria', investigacionComplementariaController::class);
    Route::resource('prorrogaplazoinvestigacion', prorrogaPlazoInvestigacionComplemenatriaController::class);
    Route::resource('medidacautelar', medidaCautelarController::class);
    Route::resource('suspencioncondicional', SuspencionCondicionalProcesoController::class);
    Route::resource('procedimientoabreviado', procedimientoAbreviadoController::class);
    Route::resource('tribunalenjuiciamiento', tribunalEnjuiciamientoController::class);
    Route::resource('conclusion', ConclusionController::class);
    Route::resource('impugnacion', ImpugnacionController::class);



    Route::get('/estado/{id}', [estadoController::class, 'show']);

    // obtenerTribunalPorExpediente 

    Route::delete('/eliminartribunalenjuiciamiento/{id}', [tribunalEnjuiciamientoController::class, 'eliminar']);

    Route::get('/obtenertribunalporexpediente/{id}', [tribunalEnjuiciamientoController::class, 'obtenerTribunalPorExpediente']);


    Route::resource('estado', estadoController::class);
    
    
    Route::resource('pais', paisController::class);
    Route::resource('escolaridad', EscolaridadController::class);
    Route::resource('ocupacion', OcupacionController::class);
    Route::resource('estatussedeministerial', EstatusSedeMinisterialController::class);
    Route::resource('medidacautelara', medidaCautelarAController::class);
    Route::resource('medidaproteccion', MedidaProteccionController::class);
    Route::resource('detencion', DetencionController::class);
    Route::resource('ordenaprencion', ordenAprencionController::class);
    Route::resource('expediente', expedienteController::class);
    Route::resource('coordinacion', CoordinacionController::class);
    Route::resource('delitoproceso', DelitoProcesoController::class);
    Route::resource('delito', DelitoController::class);

    Route::resource('examendetencion', ExamenDetencionController::class);

    Route::resource('medidasprotecciones', medidasProteccionController::class);

    Route::resource('coordinacionMunicipio', coordinacionMunicipioController::class);
    
    // obtenerDefensorPorIdUsuario

    Route::get('/obtenerdefensorporidusuario/{id}/', [DefensorController::class, 'obtenerDefensorPorIdUsuario']);



    Route::post('/busquedaconfiltros', [ExpedienteController::class, 'busquedaConFiltros']);



    Route::resource('imputadosExpediente', ImputadosExpedienteController::class);
    Route::resource('victimasExpediente', victimaExpedienteController::class);

    Route::get('/delitosPorExpediente/{id}/', [ ExpedientedelitoController::class , 'delitosExpediente']);


    Route::get('/imputadosPorExpediente/{id}/', [ImputadosExpedienteController::class, 'showPorExpediente']);
    Route::get('/imputadosPorExpediente/eliminar/{idExpediente}/{idImputado}', [ImputadosExpedienteController::class, 'destroy']);
    
    Route::get('tribunalPorExpediente/{id}', [TribunalEnjuiciamientoExpedienteController::class, 'showPorExpediente']);
   

    Route::get('/victimasPorExpediente/{id}/', [victimaExpedienteController::class, 'showPorExpediente']);

    Route::get('/victimasPorExpediente/eliminar/{idExpediente}/{idVictima}', [victimaExpedienteController::class, 'destroy']);




    Route::get('/delitosPorExpediente/{id}', [ExpedientedelitoController::class, 'showPorExpediente']);

    Route::delete('/eliminarDelito/{idExpediente}/{idDelito}', [ExpedientedelitoController::class, 'eliminar']);


    // ExpedientedelitoController
    Route::resource('expedientedelito', ExpedientedelitoController::class);
    
    Route::get('/{any}', function () {
        return view('home');
    })->where("any", ".*");
});



