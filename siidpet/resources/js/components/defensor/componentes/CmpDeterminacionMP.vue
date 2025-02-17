<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Determinación MP </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <small class="text-muted"> Utilice por favor el siguiente campo para explicar su respuesta </small>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="form-group">

                    <label for="determinacion_mp">Determinación</label>
                    <textarea v-model="form.determinacion_mp" class="form-control" id="determinacion_mp" rows="3"
                        aria-describedby="determinacion_mp" placeholder=""></textarea>
                    <div style="color: red;" v-if="form.errors.has('determinacion_mp')"
                        v-html="form.errors.get('determinacion_mp')" />

                </div>
                <div style="text-align: right;">
                    <div v-if="loading" class="spinner-border" role="status">
                        <span class="sr-only">Cargando...</span>
                    </div>
                    <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                        @click="guardarDeterminacion"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
                    <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarDeterminacion">
                        <i class="fa-solid fa-pen-to-square"></i> Actualizar </button>
                </div>
            </div>
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
                determinacion_mp: ''
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerDeterminacion();
    },
    methods: {

        obtenerDeterminacion() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.determinacion_mp == null) {
                    this.esNuevo = true;
                } else {
                    this.form.fill({
                        id: response.data.id,
                        determinacion_mp: response.data.expediente.determinacion_mp
                    });
                }
                this.loading = false;
            })
        },

        editarDeterminacion() {
            this.form.errors.clear('determinacion_mp');
            if (this.form.determinacion_mp === "" || this.form.determinacion_mp === null) {
                this.form.errors.set('determinacion_mp', 'Este campo es requerido');
            } else {
                this.axios.put('/expediente/' + this.$route.params.id + '/', this.form).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.loading = true;
                    this.obtenerDeterminacion();
                })
            }
        },

        guardarDeterminacion() {
            this.form.errors.clear('determinacion_mp');
            if (this.form.determinacion_mp === "" || this.form.determinacion_mp === null) {
                this.form.errors.set('determinacion_mp', 'Este campo es requerido');
            } else {

                this.axios.put('/expediente/' + this.$route.params.id + '/', this.form).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.loading = true;
                    this.obtenerDeterminacion();
                })
            }
        },


    }
}
</script>
