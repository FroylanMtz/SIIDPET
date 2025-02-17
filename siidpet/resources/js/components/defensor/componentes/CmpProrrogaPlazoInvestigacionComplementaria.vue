<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Prorroga plazo de investigacion complementaria </h5>
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
                <label for="Fecha inicio">Fecha inicio</label>
                <input v-model="this.form.fecha_inicio" type="date" class="form-control" id="fecha_inicio"
                    aria-describedby="fecha_inicio">
                <div style="color: red;" v-if="this.form.errors.has('fecha_inicio')"
                    v-html="this.form.errors.get('fecha_inicio')" />
            </div>
            <div class="form-group col-md-6">
                <label for="Fecha fin">Fecha fin</label>
                <input v-model="this.form.fecha_vencimiento" type="date" class="form-control" id="fecha_vencimiento"
                    aria-describedby="fecha_vencimiento">
                <div style="color: red;" v-if="this.form.errors.has('fecha_vencimiento')"
                    v-html="this.form.errors.get('fecha_vencimiento')" />
            </div>


        </div>

        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>
            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarProrrogaInvestigacionComplementaria"> <i class="fa-solid fa-floppy-disk"></i> Guardar
            </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1"
                @click="editarProrrogaInvestigacionComplementaria">
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
                fecha_inicio: '',
                fecha_vencimiento: '',
                activo: '',
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerIdProrrogaInvestigacionComplementaria();
    },
    methods: {
        obtenerIdProrrogaInvestigacionComplementaria() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_prorroga_plazo == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/prorrogaplazoinvestigacion/' + response.data.expediente.id_prorroga_plazo)
                        .then((response) => {
                            this.form.fill(response.data.prorroga_plazo_investigacion_complementaria
                            );
                        })
                }
                this.loading = false;
            })
        },
        editarProrrogaInvestigacionComplementaria() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }
            this.axios.put('/prorrogaplazoinvestigacion/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerIdProrrogaInvestigacionComplementaria();
            })
        },
        guardarProrrogaInvestigacionComplementaria() {

            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.form.post('/prorrogaplazoinvestigacion').then((response) => {
                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_prorroga_plazo": response.data.prorroga_plazo_investigacion_complementaria.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerIdProrrogaInvestigacionComplementaria();
                    this.esNuevo = false;
                })
            })

        },

        validarFomrulario() {

            let error = false;

            if (this.form.fecha_inicio === null || this.form.fecha_inicio === "") {
                this.form.errors.set('fecha_inicio', 'Este campo es requerido');
                error = true;
            }
            if (this.form.fecha_vencimiento === null || this.form.fecha_vencimiento === "") {
                this.form.errors.set('fecha_vencimiento', 'Este campo es requerido');
                error = true;
            }


            let fechaInicio = new Date(this.form.fecha_inicio);
            let fechaFin = new Date(this.form.fecha_vencimiento);

            if (fechaInicio.getTime() > fechaFin.getTime()) {
                this.form.errors.set('fecha_inicio', 'La fecha de inicio es mayor que la fecha fin');
                error = true;
            }
            return error;
        }


    }
}
</script>
