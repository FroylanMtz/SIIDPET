<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">

        <div class="d-flex justify-content-between align-items-center ">
            <h1 class="h4">Expedientes</h1>
        </div>
    </div>

    <div class="p-2">
        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false"
            aria-controls="collapseExample2">
            <i class="fa-solid fa-filter"></i> Filtrar
        </a>
        <a @click="this.$router.push('/expedientes')" class="btn btn-secondary ml-2" data-toggle="collapse"
            href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            <i class="fa-solid fa-magnifying-glass"></i> Buscar
        </a>
    </div>

    <!-- /.content-header -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">

                <div class="collapse" id="collapseExample2">
                    <div class="card card-body">
                        <h5> Filtrado expedientes </h5>
                        <div class="row">
                            <div class="col-3">
                                <label for="Nombre del usuario">Coordinación</label>
                                <v-select v-model="this.busqueda.coordinacion" :reduce="(option) => option.id"
                                    :options="coordinaciones" @update:model-value="seleccionarCoordinacion()"
                                    @clear="limpiarBusquedaCoordinacion">
                                </v-select>
                            </div>
                            <div class="col-3">
                                <div class="form-group ">
                                    <label for="Apellido Paterno">Municipio</label>
                                    <v-select v-model="this.busqueda.municipio" :reduce="(option) => option.id"
                                        :options="municipios" @update:model-value="seleccionarMunicipio()">
                                    </v-select>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group ">
                                    <label for="Apellido Materno">Defensor</label>
                                    <v-select v-model="this.busqueda.defensor" :reduce="(option) => option.id"
                                        :options="defensores" @update:model-value="seleccionarDefensor()">
                                    </v-select>
                                </div>
                            </div>
                            <div class="col-3 mt-1">
                                <button class="btn btn-primary w-100 mt-4" @click="realizarBusqueda">
                                    <i class="fa-solid fa-search"></i> Buscar
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="container ">
        <div class="row justify-content-center">
            <div class="col-md-12">


                <div class="collapse" id="collapseExample">
                    <div class="card card-body">
                        <h5> Busqueda de expedientes </h5>
                        <div class="row mb-3">
                            <div class="col-6 ">
                                <label for="municipio" class="form-label">Buscar</label>
                                <select class="custom-select " v-model="searchField">
                                    <option selected disabled>Seleccione una opcion</option>
                                    <option value="ugi.nombre">Ugi</option>
                                    <option value="nuc">Carpeta de Inv.</option>
                                </select>
                            </div>
                            <div class="col-6">
                                <label for="municipio" class="form-label"> Valor </label>
                                <input class="form-control  border-width-2 " v-model="searchValue"
                                    placeholder="Escriba lo que quiera buscar" type="search" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-md-12">

                <div class="card card-body">
                    <div class="table-section">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h5 class="mb-0">Resultados: {{ this.items.length }} </h5>
                            <button class="btn btn-success">
                                <i class="fa-solid fa-plus"></i> Crear
                            </button>
                        </div>
                        <EasyDataTable buttons-pagination :headers="datos" :items="items" :search-field="searchField"
                            :search-value="searchValue" :rows-per-page="10" border-cell>
                            <template #item-operation="item">
                                <div class="operation-wrapper">
                                    <a class="btn btn-warning mb-1" @click="actualizarExpediente(item)">
                                        <i class="fa-regular fa-pen-to-square"></i> Editar
                                    </a>
                                    <a class="btn btn-primary " @click="irADetalles(item)">
                                        <i class="fa-regular fa-eye"></i> Ver
                                    </a>
                                </div>
                            </template>

                            <template #item-imputado="item">
                                {{ this.obtenerNombresImputados(item) }}
                            </template>

                            <template #item-defensor="item">
                                {{ this.obtenerNombreDefensor(item) }}
                            </template>
                        </EasyDataTable>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="modal fade" id="modalAgregarExpediente" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <form @submit.prevent="actualizarExpedienteCheck === false ? registrarExpediente : editarExpediente">
                    <div class="modal-header">
                        <h5 v-if="actualizarExpedienteCheck" class="modal-title" id="modalAgregarExpediente"> Actualizar
                            expediente </h5>
                        <h5 v-else class="modal-title" id="modalAgregarExpediente"> Nuevo expediente </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">



                        <div class="form-group">
                            <label for="audiencia_inicial"> UGI </label>
                            <v-select v-model="this.form.id_ugi" :reduce="(option) => option.id" :options="this.ugis"
                                placeholder="Seleccione una opcion">
                            </v-select>
                            <div style="color: red;" v-if="form.errors.has('id_ugi')"
                                v-html="form.errors.get('id_ugi')" />
                        </div>
                        <div class="form-group">
                            <label for="nuc">Carpeta de investigación</label>
                            <input v-model="form.nuc" type="text" class="form-control" id="nuc"
                                aria-describedby="emailHelp" placeholder="Carpeta de investigación">
                            <div style="color: red;" v-if="form.errors.has('nuc')" v-html="form.errors.get('nuc')" />
                        </div>
                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">
                            <i class="fas fa-times"></i> Cancelar
                        </button>

                        <button v-if="actualizarExpedienteCheck" :disabled="form.busy" class="btn btn-warning"
                            @click="editarExpediente">
                            <i class="fas fa-save"></i> Actualizar
                        </button>

                        <button v-else :disabled="form.busy" class="btn btn-success" @click="registrarExpediente">
                            <i class="fas fa-save"></i> Guardar
                        </button>


                    </div>
                </form>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { ref } from "vue";
import Form from 'vform'
import Swal from 'sweetalert2'

import 'vue3-easy-data-table/dist/style.css';

export default {
    data() {
        return {
            id_defensor: ref(''),
            ugis: ref([]),
            searchField: ref("nuc"),
            searchValue: ref(""),
            datos: [
                { text: "CI", value: "nuc", sortable: true },
                { text: "Ugi", value: "ugi.nombre", sortable: true, },
                { text: "Imputado", value: "imputado" },
                { text: "Coordinación", value: "defensor.coordinacion.nombre" },
                { text: "Municipio", value: "defensor.municipio.nombre" },
                { text: "Defensor", value: "defensor", sortable: true },
                { text: "Acciones", value: "operation" },
            ],
            items: [],
            form: new Form({
                fecha_vinculacion_proceso: null,
                flagrancia: null,
                foja: null,
                id: null,
                id_acuerdo_reparatorio: null,
                id_acuerdo_sede_ministerial: null,
                id_asignacion_medidas: null,
                id_conclusion: null,
                id_defensor: null,
                id_defensor_audiencia: null,
                id_delito: null,
                id_delito_proceso: null,
                id_entrevista: null,
                id_flagrancia: null,
                id_impugnacion: null,
                id_imputado: null,
                id_investigacion_complementaria: null,
                id_juez_control: null,
                id_medida_cautelar: null,
                id_orden_aprencion: null,
                id_procedimiento_abreviado: null,
                id_prorroga_plazo: null,
                id_suspencion_condicional_proceso: null,
                id_tribunal_enjuiciamiento: null,
                id_ugi: null,
                id_victima: null,
                impugnacion: null,
                imputado: null,
                investigacioncomplementaria: null,
                juez: null,
                juicio: null,
                medidacautelar: null,
                nuc: null,
                ordenaprencion: null,
                procedimientoabreviado: null,
                prorrogaplazoinvestigacioncomplementaria: null,
                sentencia_juicio: null,
                suspencioncondicionalproceso: null,
                tribunalenjuiciamiento: null,
                ugi: null,
                updated_at: null,
                victima: null,
                visita_carcelaria: null,
            }),
            ugiOptions: [],
            actualizarExpedienteCheck: ref(false),
            coordinaciones: ref([{
                id: -1,
                label: "Todos"
            }]),
            municipios: ref([{
                id: -1,
                label: "Todos"
            }]),
            defensores: ref([{
                id: -1,
                label: "Todos"
            }]),
            busqueda: {
                coordinacion: -1,
                defensor: -1,
                municipio: -1,
            },
        }
    },
    async created() {
        this.obtenerExpedientes();
        this.obtenerUgis();
        this.obtenerDatosDeBusqueda();

        try {
            const response = await this.axios.get('/obtenerdefensorporidusuario/' + window.id_usuario);

            this.id_defensor = response.data.defensor[0].id;

        } catch (error) {
            console.error('Error fetching ocupaciones:', error);
        }


    },
    methods: {

        seleccionarDefensor() {
            if (this.busqueda.defensor === null) {
                this.busqueda.defensor = -1;
            }
        },

        limpiarBusquedaCoordinacion() {
            console.log("Quitar busqueda coordinación");
            // console.log();
        },

        async realizarBusqueda() {

            const coordinacion = this.busqueda.coordinacion === -1 ? null : [this.busqueda.coordinacion];
            const municipio = this.busqueda.municipio === -1 ? null : [this.busqueda.municipio];
            const defensor = this.busqueda.defensor === -1 ? null : [this.busqueda.defensor];

            try {
                const filtros = {
                    id_coordinacion: coordinacion,
                    id_municipio: municipio,
                    id_defensor: defensor,
                }

                const response = await this.axios.post('/busquedaconfiltros', filtros);
                const resultadoDeBusqueda = response.data;

                this.items = resultadoDeBusqueda;

                console.log("Resultado de la busqueda");
                console.log(resultadoDeBusqueda);

            } catch (error) {
                console.error('Error fetching ocupaciones:', error);
            }


        },

        async seleccionarMunicipio() {


            if (this.busqueda.municipio === null) {
                this.busqueda.municipio = -1;
            }


            this.busqueda.defensor = -1;
            this.defensores = [{
                id: -1,
                label: "Todos"
            }];

            try {
                const response = await this.axios.get('/obtenerDefensoresMunicipio/' + this.busqueda.municipio);
                const informacionAdicional = response.data.map(defensor => ({
                    id: defensor.id,
                    label: defensor.user.name + " " + defensor.user.fathername + "  " + defensor.user.mothername
                }));
                this.defensores.splice(2, 0, ...informacionAdicional);
            } catch (error) {
                console.error('Error fetching ocupaciones:', error);
            }
        },
        async seleccionarCoordinacion() {

            if (this.busqueda.coordinacion === null) {
                this.busqueda.coordinacion = -1;
            }

            this.busqueda.municipio = -1;
            this.busqueda.defensor = -1;

            this.municipios = [{
                id: -1,
                label: "Todos"
            }];

            try {

                const response = await this.axios.get('/coordinacionMunicipio/' + this.busqueda.coordinacion);

                const informacionAdicional = response.data.map(municipio => ({
                    id: municipio.municipio.id,
                    label: municipio.municipio.nombre
                }));

                this.municipios.splice(2, 0, ...informacionAdicional);

            } catch (error) {
                console.error('Error fetching ocupaciones:', error);
            }

        },
        async obtenerDatosDeBusqueda() {


            try {
                const response = await this.axios.get('/coordinacion');

                const informacionAdicional = response.data.map(coordinacion => ({
                    id: coordinacion.id,
                    label: coordinacion.nombre
                }));

                this.coordinaciones.splice(2, 0, ...informacionAdicional);

            } catch (error) {
                console.error('Error fetching ocupaciones:', error);
            }

        },
        obtenerNombreDefensor(item) {


            if (item.defensor !== null) {
                return `${item.defensor.user.name} ${item.defensor.user.fathername} ${item.defensor.user.mothername}`;
            } else {
                return "-";
            }


        },
        obtenerNombresImputados(item) {

            if (item.imputados !== null) {
                return item.imputados.map(imputado => `${imputado.nombres} ${imputado.apellido_paterno} ${imputado.apellido_materno}`).join(', ');
            } else {

                console.log("-");
                return "-";
            }



        },
        async editarExpediente() {

            await this.form.put('/expediente/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Expediente actualizado con éxito',
                    showConfirmButton: false,
                    timer: 1500
                })
                $('#modalAgregarExpediente').modal('hide');
                this.obtenerExpedientes();
            }).catch(error => {
                console.log(error);
            });

        },
        actualizarExpediente(expediente) {
            $('#modalAgregarExpediente').modal('show');
            this.form.fill(expediente);
            this.actualizarExpedienteCheck = true;
        },

        async obtenerUgis() {
            try {
                const response = await this.axios.get('/ugi');
                this.ugis = response.data.map(ugi => ({
                    id: ugi.id,
                    label: ugi.nombre
                }));
            } catch (error) {
                console.error('Error fetching ocupaciones:', error);
            }
        },


        abrirModalRegistro() {
            this.actualizarExpedienteCheck = false;
            this.form.reset();
            this.form.clear();
        },
        registrarExpediente() {
            this.form.id_defensor = this.id_defensor;

            this.form.post('/expediente').then((response) => {
                this.obtenerExpedientes();
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Expediente guardado con éxito',
                    showConfirmButton: false,
                    timer: 1500
                })
            }).catch(error => {
                console.log(error);
            });

            $('#modalAgregarExpediente').modal('hide');

        },
        obtenerExpedientes() {
            this.axios.get('/expediente').then((response) => {
                this.items = response.data;
            })
        },
        irANuevo() {
            this.$router.push('/expedientes/new');
        },
        async irADetalles(item) {
            this.$router.push('/expedientes/' + item.id);
        },
    }
}

</script>
<style>
:root {
    --easy-table-border: 2px solid #ddd;
    --easy-table-row-border: 1px solid #ddd;
    --easy-table-header-font-size: 17px;
    --easy-table-header-item-padding: 10px 25px;
    --easy-table-body-item-padding: 8px 20px;
    --easy-table-header-background-color: var(--bs-primary);
    --easy-table-header-font-color: white;
    --easy-table-body-row-font-size: 15px;
}
</style>

<style scoped>
.vs--single.vs--searchable {
    border-radius: 0 !important;
}
</style>