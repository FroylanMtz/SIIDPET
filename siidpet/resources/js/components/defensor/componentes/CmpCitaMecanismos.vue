<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0">MASC</h5>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <small class="text-muted"> Porfavor llene el campo. Puede poner tanto texto como le sea posible. </small>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">



        <div class="row">

            <div class="form-group">
                <label for="cita_mecanismos"> Fechas de cita mecanismos </label>

                <textarea v-model="form.cita_mecanismos" class="form-control" id="cita_mecanismos" rows="3"
                    aria-describedby="cita_mecanismos" placeholder=""></textarea>


                <div style="color: red;" v-if="form.errors.has('cita_mecanismos')"
                    v-html="form.errors.get('cita_mecanismos')" />
            </div>



        </div>

        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>

            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarCitaMecanismos"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarCitaMecanismos">
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
                cita_mecanismos: ''
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerCitaMecanismos();
    },
    methods: {

        obtenerCitaMecanismos() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.cita_mecanismos == null) {
                    this.esNuevo = true;
                } else {
                    this.form.fill({
                        id: response.data.expediente.id,
                        cita_mecanismos: response.data.expediente.cita_mecanismos
                    });
                }
                this.loading = false;
            })
        },

        editarCitaMecanismos() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.axios.put('/expediente/' + this.form.id + '/', this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.esNuevo = false;
                this.obtenerCitaMecanismos();
            })
        },

        guardarCitaMecanismos() {
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
                this.obtenerCitaMecanismos();
            })
        },


        validarFomrulario() {
            let error = false;
            if (this.form.cita_mecanismos === null || this.form.cita_mecanismos === "") {
                this.form.errors.set('cita_mecanismos', 'Este campo es requerido');
                error = true;
            }
            return error;
        }



    }
}
</script>
