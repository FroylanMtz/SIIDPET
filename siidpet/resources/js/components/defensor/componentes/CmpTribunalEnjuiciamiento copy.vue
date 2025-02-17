<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Tribunal de Enjuiciamiento </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <small class="text-muted"> Porfavor llene los campos. Para ingresar una fecha da clic en el icono del calendario. </small>


        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="form-group">
                    <div class="row"> 

                       

                       
                        <div class="form-group col-md-12">
                            <label for="nombre"> Tribunal Enjuiciamiento </label>
                            <textarea v-model="this.form.nombre" type="text" class="form-control" id="sentencia"
                                aria-describedby="sentencia" rows="3" />
                            <div style="color: red;" v-if="this.form.errors.has('nombre')"
                                v-html="this.form.errors.get('nombre')" />
                        </div>

                        
                        <div v-if="loading" class="spinner-border" role="status">
                            <span class="sr-only">Cargando...</span>
                        </div>
                        <button v-else-if="!loading && esNuevo" type="button" class="btn btn-success float-right mb-1"
                            @click="guardarTribunalEnjuiciamiento"> Guardar </button>
                        <button v-else type="button" class="btn btn-warning float-right mb-1" @click="editarTribunalEnjuiciamiento">
                            Actualizar </button>
                    </div>
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
                nombre: '',
                id_municipio: 1,
                activo: 1,
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerTribunalEnjuiciamiento();
    },
    methods: {
        obtenerTribunalEnjuiciamiento() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_tribunal_enjuiciamiento == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/tribunalenjuiciamiento/' + response.data.expediente.id_tribunal_enjuiciamiento)
                        .then((response) => {
                            this.form.fill(response.data.tribunal_enjuiciamiento
                            );
                        }) 
                }
                this.loading = false;
            })
        },
        editarTribunalEnjuiciamiento() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }
            this.axios.put('/tribunalenjuiciamiento/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerTribunalEnjuiciamiento();
            })
        },
        guardarTribunalEnjuiciamiento() {
            
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.form.post('/tribunalenjuiciamiento').then((response) => {

                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_tribunal_enjuiciamiento": response.data.tribunal_enjuiciamiento.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerTribunalEnjuiciamiento();
                    this.esNuevo = false;
                })
            
            })

        },

        validarFomrulario(){
            let error = false;
            if( this.form.nombre === null || this.form.nombre === "" ){
                this.form.errors.set('nombre', 'Este campo es requerido');
                error = true; 
            }
            return error;
        }
    }
}
</script>
