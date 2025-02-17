<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Imputación </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <small class="text-muted"> Porfavor llene los campos. Para ingresar una fecha da clic en el icono del
                calendario. </small>

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">


        <div class="row">



            <div class="form-group col-md-6">
                <label for="id_imputado">
                    Fecha de formulacion de imputación
                </label>
                <input v-model="this.form.fecha_formulacion_imputacion" type="date" class="form-control"
                    id="fecha_formulacion_imputacion" name="fecha_formulacion_imputacion">


                <div style="color: red;" v-if="this.form.errors.has('fecha_formulacion_imputacion')"
                    v-html="this.form.errors.get('fecha_formulacion_imputacion')" />
            </div>



            <div class="form-group col-md-6">
                <label for="id_imputado"> Fecha de vinculacion a proceso</label>
                <input v-model="this.form.fecha_vinculacion_proceso" type="date" class="form-control"
                    id="fecha_vinculacion_proceso" name="fecha_vinculacion_proceso">

                <div style="color: red;" v-if="this.form.errors.has('fecha_vinculacion_proceso')"
                    v-html="this.form.errors.get('fecha_vinculacion_proceso')" />


            </div>



            <div class="form-group col-md-6">
                <label for="id_imputado"> Audiencia intermedia </label>
                <textarea v-model="this.form.audiencia_intermedia" class="form-control" rows="4"
                    id="audiencia_intermedia" name="audiencia_intermedia"
                    aria-describedby="audiencia_intermedia"></textarea>

                <div style="color: red;" v-if="this.form.errors.has('audiencia_intermedia')"
                    v-html="this.form.errors.get('audiencia_intermedia')" />
            </div>




            <div class="form-group col-md-6">
                <label for="id_imputado"> Delito </label>

                <v-select v-model="form.id_delito_proceso" :reduce="(option) => option.id" :options="delitosOpciones">
                </v-select>
                <div style="color: red;" v-if="form.errors.has('id_delito_proceso')"
                    v-html="form.errors.get('id_delito_proceso')" />
            </div>







        </div>

        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>

            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarFormulacionImputacion"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarFormulacionImputacion">
                <i class="fa-solid fa-pen-to-square"></i> Actualizar </button>
        </div>

    </div>
</template>

<script lang="ts">
import { ref } from "vue";
import Form from 'vform'
import Swal from 'sweetalert2'

export default {
    data() {
        return {
            form: new Form({
                id: '',
                fecha_formulacion_imputacion: '',
                fecha_vinculacion_proceso: '',
                audiencia_intermedia: '',
                id_delito_proceso: '',
                activo: 1,
            }),
            delitosOpciones: ref([]),
            paisesOpciones: ref([]),
            estadosOpciones: ref([]),
            municipiosOpciones: ref([]),
            ocupacionesOpciones: ref([]),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerFormulacionImputacion();
        this.obtenerDelitos();
    },
    methods: {


        async obtenerDelitos() {
            try {
                const response = await this.axios.get('/delito');
                this.delitosOpciones = response.data.map(delito => ({
                    id: delito.id,
                    label: delito.nombre
                }));
            } catch (error) {
                console.error('Error obteniendo las opciones delitos:', error);
            }
        },

        obtenerFormulacionImputacion() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                let fechaFormulacionImputacion = response.data.expediente.fecha_formulacion_imputacion;
                let fechaVinculacionProceso = response.data.expediente.fecha_vinculacion_proceso;
                let audienciaIntermedia = response.data.expediente.audiencia_intermedia;
                let delito_proceso = response.data.expediente.id_delito_proceso;

                if (fechaFormulacionImputacion == null && fechaVinculacionProceso == null && audienciaIntermedia == null) {
                    this.esNuevo = true;
                } else {
                    this.form.fill({
                        id: response.data.expediente.id,
                        fecha_formulacion_imputacion: fechaFormulacionImputacion,
                        fecha_vinculacion_proceso: fechaVinculacionProceso,
                        audiencia_intermedia: audienciaIntermedia,
                        id_delito_proceso: delito_proceso,
                    });
                }

                this.loading = false;
            })
        },

        editarFormulacionImputacion() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }
            this.axios.put('/expediente/' + this.$route.params.id + '/', this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.obtenerFormulacionImputacion();
            })

        },

        guardarFormulacionImputacion() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }
            this.axios.put('/expediente/' + this.$route.params.id + '/', this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.esNuevo = false;
                this.obtenerFormulacionImputacion();
            })
        },

        validarFomrulario() {
            let error = false;
            if (this.form.fecha_formulacion_imputacion === null || this.form.fecha_formulacion_imputacion === "") {
                this.form.errors.set('fecha_formulacion_imputacion', 'Este campo es requerido');
                error = true;
            }
            if (this.form.fecha_vinculacion_proceso === null || this.form.fecha_vinculacion_proceso === "") {
                this.form.errors.set('fecha_vinculacion_proceso', 'Este campo es requerido');
                error = true;
            }
            if (this.form.audiencia_intermedia === null || this.form.audiencia_intermedia === "") {
                this.form.errors.set('audiencia_intermedia', 'Este campo es requerido');
                error = true;
            }

            if (this.form.id_delito_proceso === null || this.form.id_delito_proceso === "") {
                this.form.errors.set('id_delito_proceso', 'Este campo es requerido');
                error = true;
            }

            return error;
        }


    }
}
</script>
