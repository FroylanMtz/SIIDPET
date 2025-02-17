<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Acuerdo reparatorio </h5>
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
                <input v-model="this.form.fecha_fin" type="date" class="form-control" id="fecha_fin"
                    aria-describedby="fecha_fin">
                <div style="color: red;" v-if="this.form.errors.has('fecha_fin')"
                    v-html="this.form.errors.get('fecha_fin')" />
            </div>
            <div class="form-group col-md-6">
                <label for="resultado">Resultado</label>
                <textarea v-model="this.form.resultado" class="form-control" rows="4" id="resultado"
                    aria-describedby="resultado"></textarea>
                <div style="color: red;" v-if="this.form.errors.has('resultado')"
                    v-html="this.form.errors.get('resultado')" />
            </div>
            <div class="form-group col-md-6">
                <label for="observaciones">Observaciones</label>
                <textarea v-model="this.form.observaciones" class="form-control" rows="4" id="observaciones"
                    aria-describedby="observaciones"></textarea>
                <div style="color: red;" v-if="this.form.errors.has('observaciones')"
                    v-html="this.form.errors.get('observaciones')" />
            </div>

        </div>

        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>
            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarAcuerdoReparatorio"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarAcuerdoReparatorio">
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
                fecha_fin: '',
                resultado: '',
                observaciones: '',
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerIdAcuerdoReparatorio();
    },
    methods: {
        obtenerIdAcuerdoReparatorio() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_acuerdo_reparatorio == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/acuerdoreparatorio/' + response.data.expediente.id_acuerdo_reparatorio)
                        .then((response) => {
                            this.form.fill(response.data.acuerdoreparatorio
                            );
                        })
                }
                this.loading = false;
            })
        },
        editarAcuerdoReparatorio() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }
            this.axios.put('/acuerdoreparatorio/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerIdAcuerdoReparatorio();
            })
        },
        guardarAcuerdoReparatorio() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }


            this.form.post('/acuerdoreparatorio').then((response) => {
                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_acuerdo_reparatorio": response.data.acuerdoreparatorio.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerIdAcuerdoReparatorio();
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
            if (this.form.fecha_fin === null || this.form.fecha_fin === "") {
                this.form.errors.set('fecha_fin', 'Este campo es requerido');
                error = true;
            }
            if (this.form.resultado === null || this.form.resultado === "") {
                this.form.errors.set('resultado', 'Este campo es requerido');
                error = true;
            }
            if (this.form.observaciones === null || this.form.observaciones === "") {
                this.form.errors.set('observaciones', 'Este campo es requerido');
                error = true;
            }

            let fechaInicio = new Date(this.form.fecha_inicio);
            let fechaFin = new Date(this.form.fecha_fin);

            if (fechaInicio.getTime() > fechaFin.getTime()) {
                this.form.errors.set('fecha_inicio', 'La fecha de inicio es mayor que la fecha fin');
                error = true;
            }
            return error;
        }


    }
}
</script>
