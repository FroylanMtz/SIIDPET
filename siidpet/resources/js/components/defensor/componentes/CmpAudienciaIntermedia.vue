<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Audiencia Intermedia </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <small class="text-muted"> Porfavor llene el campo. Puede poner tanto texto como le sea posible. </small>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">


        <div class="row">

            <div class="form-group">
                <label for="audiencia_intermedia"> Audiencia intermedia </label>

                <textarea v-model="form.audiencia_intermedia" class="form-control" id="audiencia_intermedia" rows="3"
                    aria-describedby="audiencia_intermedia" placeholder=""></textarea>


                <div style="color: red;" v-if="form.errors.has('audiencia_intermedia')"
                    v-html="form.errors.get('audiencia_intermedia')" />
            </div>



        </div>

        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>

            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarAudienciaIntermedia"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarAudienciaIntermedia">
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
                audiencia_intermedia: ''
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerAudienciaIntermedia();
    },
    methods: {

        obtenerAudienciaIntermedia() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.audiencia_intermedia == null) {
                    this.esNuevo = true;
                } else {
                    this.form.fill({
                        id: response.data.expediente.id,
                        audiencia_intermedia: response.data.expediente.audiencia_intermedia
                    });
                }
                this.loading = false;
            })
        },

        editarAudienciaIntermedia() {
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
                this.obtenerAudienciaIntermedia();
            })
        },

        guardarAudienciaIntermedia() {
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
                this.obtenerAudienciaIntermedia();
            })
        },


        validarFomrulario() {
            let error = false;
            if (this.form.audiencia_intermedia === null || this.form.audiencia_intermedia === "") {
                this.form.errors.set('audiencia_intermedia', 'Este campo es requerido');
                error = true;
            }
            return error;
        }



    }
}
</script>
