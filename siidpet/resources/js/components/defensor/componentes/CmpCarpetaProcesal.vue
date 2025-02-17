<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Carpeta procesal </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <small class="text-muted"> Porfavor llene el campo. Puede ingresar tanto texto como le sea posible. </small>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">


        <div class="row">

            <div class="form-group">
                <label for="carpeta_procesal">Carpeta</label>

                <textarea v-model="form.carpeta_procesal" class="form-control" id="carpeta_procesal" rows="2"
                    aria-describedby="carpeta_procesal" placeholder=""></textarea>


                <div style="color: red;" v-if="form.errors.has('carpeta_procesal')"
                    v-html="form.errors.get('carpeta_procesal')" />
            </div>



        </div>

        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>

            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarCarpetaProcesal"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarCarpetaProcesal">
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
                carpeta_procesal: ''
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerCarpetaProcesal();
    },
    methods: {

        actualizarInformacion(){
            this.$emit('llamar-funcion');
        },


        obtenerCarpetaProcesal() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.carpeta_procesal == null) {
                    this.esNuevo = true;
                } else {
                    this.form.fill({
                        id: response.data.expediente.id,
                        carpeta_procesal: response.data.expediente.carpeta_procesal
                    });
                }
                this.loading = false;
                
            })
        },

        editarCarpetaProcesal() {
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
                this.obtenerCarpetaProcesal();
                this.actualizarInformacion();
            })
        },

        guardarCarpetaProcesal() {
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
                this.obtenerCarpetaProcesal();
                this.actualizarInformacion();
            })
        },

        validarFomrulario() {
            let error = false;
            if (this.form.carpeta_procesal === null || this.form.carpeta_procesal === "") {
                this.form.errors.set('carpeta_procesal', 'Este campo es requerido');
                error = true;
            }
            return error;
        }



    }
}
</script>
