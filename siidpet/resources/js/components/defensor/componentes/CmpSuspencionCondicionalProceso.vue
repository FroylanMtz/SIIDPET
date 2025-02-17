<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Suspencion condicional proceso </h5>
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
                <label for="fecha_inicio">Fecha Inicio </label>
                <input v-model="this.form.fecha_inicio" type="date" class="form-control" id="fecha_inicio"
                    aria-describedby="fecha_inicio">
                <div style="color: red;" v-if="this.form.errors.has('fecha_inicio')"
                    v-html="this.form.errors.get('fecha_inicio')" />
            </div>

            <div class="form-group col-md-6">
                <label for="fecha_fin">Fecha Vencimiento </label>
                <input v-model="this.form.fecha_fin" type="date" class="form-control" id="fecha_fin"
                    aria-describedby="fecha_fin">
                <div style="color: red;" v-if="this.form.errors.has('fecha_fin')"
                    v-html="this.form.errors.get('fecha_fin')" />
            </div>

            <div class="form-group col-md-6">
                <label for="Medida Cautelar"> Resultado </label>

                <textarea v-model="this.form.resultado" type="text" class="form-control" id="resultado"
                    aria-describedby="resultado" rows="2" />

                <div style="color: red;" v-if="this.form.errors.has('resultado')"
                    v-html="this.form.errors.get('resultado')" />
            </div>


            <div class="form-group col-md-6">
                <label for="Medida Cautelar"> Observaciones </label>

                <textarea v-model="this.form.observaciones" type="text" class="form-control" id="observaciones"
                    aria-describedby="observaciones" rows="2" />

                <div style="color: red;" v-if="this.form.errors.has('observaciones')"
                    v-html="this.form.errors.get('observaciones')" />
            </div>


            <div class="form-group col-md-12">
                <label for="Medida Cautelar"> Reporte de cumplimiento </label>

                <textarea v-model="this.form.reporte_cumplimiento" type="text" class="form-control"
                    id="reporte_cumplimiento" aria-describedby="reporte_cumplimiento" rows="2" />

                <div style="color: red;" v-if="this.form.errors.has('reporte_cumplimiento')"
                    v-html="this.form.errors.get('reporte_cumplimiento')" />
            </div>





        </div>


        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>
            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarSuspencionCondicional"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarSuspencionCondicional">
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
                reporte_cumplimiento: '',
                observaciones: '',
                activo: 1,
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerSuspencionCondicional();
    },
    methods: {
        obtenerSuspencionCondicional() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_suspencion_condicional_proceso == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/suspencioncondicional/' + response.data.expediente.id_suspencion_condicional_proceso)
                        .then((response) => {
                            this.form.fill(response.data.suspencion_condicional
                            );
                        })
                }
                this.loading = false;
            })
        },
        editarSuspencionCondicional() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }
            this.axios.put('/suspencioncondicional/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerSuspencionCondicional();
            })
        },
        guardarSuspencionCondicional() {

            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.form.post('/suspencioncondicional').then((response) => {

                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_suspencion_condicional_proceso": response.data.suspencion_condicional.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerSuspencionCondicional();
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

            if (this.form.reporte_cumplimiento === null || this.form.reporte_cumplimiento === "") {
                this.form.errors.set('reporte_cumplimiento', 'Este campo es requerido');
                error = true;
            }

            if (this.form.observaciones === null || this.form.observaciones === "") {
                this.form.errors.set('observaciones', 'Este campo es requerido');
                error = true;
            }



            return error;

        }


    }
}
</script>
