<template>
    <div class="row">
        <div class="content-header">
            <div class="bg-primary text-white p-3 rounded d-flex justify-content-between align-items-center">
                <h1 class="h5">Expediente {{ expediente.nuc }} </h1>
                <span>UGI: {{ expediente.id_ugi }} </span>
            </div>
        </div>
        <div class="container" >
            <div class="nav-tabs-wrapper" style="overflow-x: auto; white-space: nowrap;" ref="tabsContainer">
                <ul class="nav nav-pills mb-4">
                    <a @click="this.$router.push('/expedientes')" class="btn btn-link mr-2"> <i
                            class="fa-solid fa-angle-left"></i> Regresar</a>
                    <li class="nav-item">
                        <a @click="changeOption(1)" class="nav-link" :class="{ active: isActiveTab(1) }" href="#tab_1"
                            data-toggle="tab">
                            Grupo 1
                        </a>
                    </li>
                    <li class="nav-item"><a @click="changeOption(2)" class="nav-link"
                            :class="{ active: isActiveTab(2) }" href="#tab_2" data-toggle="tab"> Grupo 2 </a></li>
                    <li class="nav-item"><a @click="changeOption(3)" class="nav-link"
                            :class="{ active: isActiveTab(3) }" href="#tab_3" data-toggle="tab">
                            Grupo 3 </a>
                    </li>
                    <li class="nav-item"><a @click="changeOption(4)" class="nav-link"
                            :class="{ active: isActiveTab(4) }" href="#tab_4" data-toggle="tab">
                            Grupo 4 </a>
                    </li>

                    <li class="nav-item"><a @click="changeOption(5)" class="nav-link"
                            :class="{ active: isActiveTab(5) }" href="#tab_5" data-toggle="tab">
                            Grupo 5 </a>
                    </li>
                </ul>
            </div>
            <div class="row">
                <!-- Columna 3 -->
                <div class="col-md-3 col-12 d-flex flex-column">
                    <div class="card flex-fill mb-2">
                        <div class="card-body">
                            <h6 class="text-primary">Imputado</h6>

                            <ul v-if="this.imputados.length === 0" style="font-size: smaller; list-style: none;"
                                class="pl-0">
                                <li>No hay procesados registrados</li>
                            </ul>

                            <ul v-else style="font-size: smaller; list-style: none;" v-for="imputado in this.imputados"
                                :key="imputado.nombres" class="pl-0">
                                <li>
                                    {{ imputado.nombres }}
                                    {{ imputado.apellido_paterno }}
                                    {{ imputado.apellido_materno }}
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="card flex-fill mb-2">
                        <div class="card-body">
                            <h6 class="text-primary ">Víctimas</h6>
                            <ul v-if="this.victimas.length == 0" style="font-size: smaller; list-style: none;"
                                class="pl-0">
                                <li>No hay victimas registradas</li>
                            </ul>
                            <ul v-for="victima in this.victimas" :key="victima.nombres"
                                style="font-size: smaller; list-style: none;" class="pl-0">
                                <li>
                                    {{ victima.nombres }}
                                    {{ victima.apellido_paterno }}
                                    {{ victima.apellido_materno }}
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="card flex-fill mb-2">
                        <div class="card-body">
                            <h6 class="text-primary">Delito</h6>
                            <ul v-if="this.delitos.length === 0" style="font-size: smaller; list-style: none;"
                                class="pl-0">
                                <li>No hay delitos registrados</li>
                            </ul>
                            <ul v-for="delito in this.delitos" :key="delitos.id"
                                style="font-size: smaller; list-style: none;" class="pl-0">
                                <li>
                                    {{ delito.nombre }}
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="card flex-fill mb-2">
                        <div class="card-body">
                            <h6 class="text-primary">Carpeta Procesal </h6>
                            <ul v-if="this.expediente.carpeta_procesal === '' || this.expediente.carpeta_procesal === null"
                                style="font-size: smaller; list-style: none;" class="pl-0">
                                <li>No hay C.P. registrada</li>
                            </ul>

                            <ul style="font-size: smaller; list-style: none;" class="pl-0">
                                <li>
                                    {{ this.expediente.carpeta_procesal }}
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <!-- Columna 9 -->
                <div class="col-md-9 col-12 d-flex flex-column">
                    <div class="card h-100 mb-2">
                        <div class="card-body ">
                            <div class="tab-content">
                                <div class="tab-pane" :class="{ active: isActiveTab(1) }" id="tab_1">

                                    <Tabs :tabs="tabsGrupo1">
                                        <template #entrevista>
                                            <entrevista></entrevista>
                                        </template>
                                        <template #imputado>
                                            <CmpImputados @llamar-funcion="obtenerExpediente"></CmpImputados>
                                        </template>
                                        <template #delito>
                                            <CmpDelito @llamar-funcion="obtenerExpediente"></CmpDelito>
                                        </template>
                                        <template #victima>
                                            <CmpVictima @llamar-funcion="obtenerExpediente"></CmpVictima>
                                        </template>
                                        <template #flagrancia>
                                            <CmpFlagrancia></CmpFlagrancia>
                                        </template>
                                        <template #determinacion_mp>
                                            <CmpDeterminacion></CmpDeterminacion>
                                        </template>
                                    </Tabs>

                                </div>
                                <div class="tab-pane" :class="{ active: isActiveTab(2) }" id="tab_2">
                                    <Tabs :tabs="tabsGrupo2">
                                        <template #orden_aprehension>
                                            <CmpOrdenAprehension></CmpOrdenAprehension>
                                        </template>
                                        <template #medidas_proteccion>
                                            <CmpAsignacionMedidas></CmpAsignacionMedidas>
                                        </template>
                                        <template #acuerdo_sede_ministerial>
                                            <CmpAcuerdoSedeMinisterial></CmpAcuerdoSedeMinisterial>
                                        </template>
                                        <template #carpeta_procesal>
                                            <CmpCarpetaProcesal @llamar-funcion="obtenerExpediente">
                                            </CmpCarpetaProcesal>
                                        </template>
                                        <template #audiencia_inicial>
                                            <CmpAudienciaInicial></CmpAudienciaInicial>
                                        </template>
                                    </Tabs>
                                </div>
                                <div class="tab-pane" :class="{ active: isActiveTab(3) }" id="tab_3">
                                    <Tabs :tabs="tabsGrupo3">
                                        <template #cita_mecanismos>
                                            <CmpCitaMecanismos></CmpCitaMecanismos>
                                        </template>
                                        <template #acuerdo_reparatorio>
                                            <CmpAcuerdoReparatorio></CmpAcuerdoReparatorio>
                                        </template>
                                        <template #imputacion>
                                            <CmpImputadacion></CmpImputadacion>
                                        </template>
                                        <template #investigacion_complementaria>
                                            <CmpInvestigacionComplementaria></CmpInvestigacionComplementaria>
                                        </template>
                                        <template #plazo_investigacion_complementaria>
                                            <CmpProrrogaPlazoInvestigacionComplementaria>
                                            </CmpProrrogaPlazoInvestigacionComplementaria>
                                        </template>
                                        <template #medida_cautelar>
                                            <CmpMedidaCautelar></CmpMedidaCautelar>
                                        </template>
                                    </Tabs>
                                </div>
                                <div class="tab-pane" :class="{ active: isActiveTab(4) }" id="tab_4">
                                    <Tabs :tabs="tabsGrupo4">
                                        <template #audiencia_intermedia>
                                            <CmpAudienciaIntermedia></CmpAudienciaIntermedia>
                                        </template>
                                        <template #suspension_condicional_proceso>
                                            <CmpSuspencionCondicionalProceso></CmpSuspencionCondicionalProceso>
                                        </template>
                                        <template #procedimiento_abreviado>
                                            <CmpProcedimientoAbreviado></CmpProcedimientoAbreviado>
                                        </template>
                                        <template #juicio>
                                            <CmpJuicio></CmpJuicio>
                                        </template>
                                        <template #tribunal_enjuiciamiento>
                                            <CmpTribunalEnjuiciamiento></CmpTribunalEnjuiciamiento>
                                        </template>
                                        <template #sentencia_juicio>
                                            <CmpSentenciaJuicio></CmpSentenciaJuicio>
                                        </template>
                                    </Tabs>
                                </div>
                                <div class="tab-pane" :class="{ active: isActiveTab(5) }" id="tab_5">
                                    <Tabs :tabs="tabsGrupo5">
                                        <template #conclusion>
                                            <CmpConclusion></CmpConclusion>
                                        </template>
                                        <template #visita_carcelaria>
                                            <CmpVisitaCarcelaria></CmpVisitaCarcelaria>
                                        </template>
                                        <template #impugnacion>
                                            <CmpImpugnacion></CmpImpugnacion>
                                        </template>
                                        <template #examen_detencion>
                                            <CmpExamenDetencion></CmpExamenDetencion>
                                        </template>
                                        <template #ppl>
                                            <CmpPpl></CmpPpl>
                                        </template>
                                    </Tabs>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="loadingModal" tabindex="-1" aria-labelledby="loadingModalLabel" aria-hidden="true"
        data-bs-backdrop="static" data-bs-keyboard="false">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Cargando...</span>
                    </div>
                    <p class="mt-3">Cargando expediente, por favor espere ...</p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import { ref } from "vue";
import entrevista from './componentes/Entrevista.vue';
import CmpImputados from './componentes/CmpImputados.vue';
import CmpDelito from './componentes/CmpDelitos.vue';
import CmpVictima from './componentes/CmpVictima.vue';
import CmpFlagrancia from './componentes/CmpFlagrancia.vue';
import CmpDeterminacion from './componentes/CmpDeterminacionMP.vue';
import CmpAsignacionMedidas from './componentes/CmpAsignacionMedidas.vue';
import CmpAcuerdoSedeMinisterial from './componentes/CmpAcuerdoSedeMinisterial.vue';
import CmpCarpetaProcesal from './componentes/CmpCarpetaProcesal.vue';
import CmpAudienciaInicial from './componentes/CmpAudienciaInicial.vue';
import CmpJuezControl from './componentes/CmpJuezControl.vue';
import CmpDefensorAudicencia from './componentes/CmpDefensorAudiencia.vue';
import CmpCitaMecanismos from './componentes/CmpCitaMecanismos.vue';
import CmpAcuerdoReparatorio from './componentes/CmpAcuerdoReparatorio.vue';
import CmpImputadacion from './componentes/CmpImputacion.vue';
import CmpInvestigacionComplementaria from './componentes/CmpInvestigacionComplementaria.vue';
import CmpProrrogaPlazoInvestigacionComplementaria from './componentes/CmpProrrogaPlazoInvestigacionComplementaria.vue';
import CmpMedidaCautelar from './componentes/CmpMedidaCautelar.vue';
import CmpAudienciaIntermedia from './componentes/CmpAudienciaIntermedia.vue';
import CmpSuspencionCondicionalProceso from './componentes/CmpSuspencionCondicionalProceso.vue';
import CmpProcedimientoAbreviado from './componentes/CmpProcedimientoAbreviado.vue';
import CmpJuicio from './componentes/CmpJuicio.vue';
import CmpTribunalEnjuiciamiento from './componentes/CmpTribunalEnjuiciamiento.vue';
import CmpSentenciaJuicio from './componentes/CmpSentenciaJuicio.vue';
import CmpConclusion from './componentes/CmpConclusion.vue';
import CmpVisitaCarcelaria from './componentes/CmpVisitaCarcelaria.vue';
import CmpImpugnacion from './componentes/CmpImpugnacion.vue';
import CmpOrdenAprehension from './componentes/CmpOrdenAprehension.vue';
import CmpExamenDetencion from './componentes/CmpExamenDetencion.vue';
import CmpPpl from './componentes/CmpPpl.vue';

import Tabs from "../Tabs.vue";
import TabsSuperior from "../TabsSuperior.vue";

export default {
    name: 'ExpedienteTabs',

    components: {
        entrevista,
        CmpImputados,
        CmpDelito,
        CmpVictima,
        CmpFlagrancia,
        CmpDeterminacion,
        CmpAsignacionMedidas,
        CmpAcuerdoSedeMinisterial,
        CmpCarpetaProcesal,
        CmpAudienciaInicial,
        CmpJuezControl,
        CmpDefensorAudicencia,
        CmpCitaMecanismos,
        CmpAcuerdoReparatorio,
        CmpImputadacion,
        CmpInvestigacionComplementaria,
        CmpProrrogaPlazoInvestigacionComplementaria,
        CmpMedidaCautelar,
        CmpAudienciaIntermedia,
        CmpSuspencionCondicionalProceso,
        CmpProcedimientoAbreviado,
        CmpJuicio,
        CmpTribunalEnjuiciamiento,
        CmpSentenciaJuicio,
        CmpConclusion,
        CmpVisitaCarcelaria,
        CmpImpugnacion,
        CmpOrdenAprehension,
        CmpExamenDetencion,
        CmpPpl,
        Tabs,
        TabsSuperior
    },
    data() {
        return {
            componentesSuperior: [
                { label: "Entrevista", name: "entrevista" },
                { label: "Imputado", name: "imputado" },
                { label: "Delito", name: "delito" },
            ],
            tabsGrupo1: [
                { label: "Entrevista", name: "entrevista" },
                { label: "Imputado", name: "imputado" },
                { label: "Delito", name: "delito" },
                { label: "Víctima", name: "victima" },
                { label: "Flagrancia", name: "flagrancia" },
                { label: "Determinación MP", name: "determinacion_mp" }
            ],
            tabsGrupo2: [
                { label: "Orden Aprehensión", name: "orden_aprehension" },
                { label: "Medidas de Protección", name: "medidas_proteccion" },
                { label: "Acuerdo Sede Ministerial", name: "acuerdo_sede_ministerial" },
                { label: "Carpeta Procesal", name: "carpeta_procesal" },
                { label: "Audiencia Inicial", name: "audiencia_inicial" }
            ],
            tabsGrupo3: [
                { label: "Cita Mecanismos", name: "cita_mecanismos" },
                { label: "Acuerdo Reparatorio", name: "acuerdo_reparatorio" },
                { label: "Imputación", name: "imputacion" },
                { label: "Inv. Complementaria", name: "investigacion_complementaria" },
                { label: "Plazo Inv. Compl.", name: "plazo_investigacion_complementaria" },
                { label: "Medida Cautelar", name: "medida_cautelar" }
            ],
            tabsGrupo4: [
                { label: "Audiencia Intermedia", name: "audiencia_intermedia" },
                { label: "Suspensión Condicional Proceso", name: "suspension_condicional_proceso" },
                { label: "Procedimiento Abreviado", name: "procedimiento_abreviado" },
                { label: "Juicio", name: "juicio" },
                { label: "Tribunal Enjuiciamiento", name: "tribunal_enjuiciamiento" },
                { label: "Sentencia Juicio", name: "sentencia_juicio" }
            ],
            tabsGrupo5: [
                { label: "Conclusión", name: "conclusion" },
                { label: "Visita Carcelaria", name: "visita_carcelaria" },
                { label: "Impugnación", name: "impugnacion" },
                { label: "Examen Detención", name: "examen_detencion" },
                { label: "PPL", name: "ppl" }
            ],
            tabList: [





            ],
            activeTab: 1,
            expediente: {
                foja: '',
                id_ugi: '',
                nuc: '',
            },
            imputados: [],
            victimas: [],
            delitos: [],
            loadingModal: null,
        };
    },
    watch: {
        '$route'(to, from) {
            this.menu = to.query.m;
        }
    },
    mounted() {
        this.loadingModal = new bootstrap.Modal(document.getElementById('loadingModal'), {
            backdrop: 'static',
            keyboard: false
        });
        this.loadingModal.show();
        this.obtenerExpediente();
    },
    methods: {
        obtenerData() {
            console.log("actualizado");
        },
        scrollTabs(distance) {
            const container = this.$refs.tabsContainer;
            container.scrollBy({
                left: distance,
                behavior: 'smooth'
            });
        },
        async obtenerExpediente() {
            await this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                this.expediente = response.data.expediente;
            });
            this.imputados = [];
            await this.axios.get('/imputadosPorExpediente/' + this.$route.params.id + '/').then((response) => {
                this.imputados = response.data;
            })
            this.victimas = [];
            await this.axios.get('/victimasPorExpediente/' + this.$route.params.id + '/').then((response) => {
                this.victimas = response.data;
            })
            this.delitos = [];
            await this.axios.get('/delitosPorExpediente/' + this.$route.params.id + '/').then((response) => {
                this.delitos = response.data;
            })
            await this.loadingModal.hide();
            
        },
        changeOption(option) {
            this.activeTab = option;
        },
        isActiveTab(tabNumber) {
            return this.activeTab === tabNumber;
        }
    }
};
</script>

<style scoped>
.nav-tabs .nav-link {
    border-radius: 0.5rem 0.5rem 0 0;
    transition: background-color 0.3s ease;
}

.nav-tabs .nav-link.active {
    background-color: #007bff;
    color: white;
}
</style>

<style scoped>
.table-small {
    font-size: 12px;
    /* Ajusta el tamaño según tus necesidades */
}

.scroll-btn {
    background: none;
    border: none;
    font-size: 25px;
    cursor: pointer;
    padding: 10px;
    position: absolute;
    top: 0;
    /* Poner el botón en la parte superior */
    display: flex;
    justify-content: center;
    align-items: flex-start;
    height: 20%;
    z-index: 1;
}

.scroll-left {
    left: 0;
}

.scroll-right {
    right: 0;
}
</style>