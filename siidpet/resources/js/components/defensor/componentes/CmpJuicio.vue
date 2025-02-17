<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Juicio </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <small class="text-muted"> Porfavor llene el campo. Puede poner tanto texto como le sea posible. </small>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">


        <div class="row">

            <div class="form-group">
                <label for="cita_mecanismos"> Juicio </label>

                <textarea v-model="form.juicio" class="form-control" id="juicio" rows="3" aria-describedby="juicio"
                    placeholder=""></textarea>


                <div style="color: red;" v-if="form.errors.has('juicio')" v-html="form.errors.get('juicio')" />
            </div>



        </div>

        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>
            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarJuicio"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarJuicio">
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
                juicio: ''
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerJuicio();
    },
    methods: {

        obtenerJuicio() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.juicio == null) {
                    this.esNuevo = true;
                } else {
                    this.form.fill({
                        id: response.data.expediente.id,
                        juicio: response.data.expediente.juicio
                    });
                }
                this.loading = false;
            })
        },

        editarJuicio() {
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
                this.obtenerJuicio();
            })
        },

        guardarJuicio() {
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
                this.obtenerJuicio();
            })
        },


        validarFomrulario() {
            let error = false;
            if (this.form.juicio === null || this.form.juicio === "") {
                this.form.errors.set('juicio', 'Este campo es requerido');
                error = true;
            }
            return error;
        }



    }
}
</script>
