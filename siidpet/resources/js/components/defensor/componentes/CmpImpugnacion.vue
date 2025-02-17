<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Impungacion </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <small class="text-muted"> Porfavor llene los campos. Para ingresar una fecha da clic en el icono del calendario. </small>


        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        
                
                    <div class="row"> 

                        <div class="form-group col-md-12">
                            <label for="fecha_impugnacion">Fecha </label>
                            <input v-model="this.form.fecha_impugnacion" type="date" class="form-control" id="fecha_impugnacion"
                                aria-describedby="fecha_impugnacion">
                            <div style="color: red;" v-if="this.form.errors.has('fecha_impugnacion')"
                                v-html="this.form.errors.get('fecha_impugnacion')" />
                        </div>

                       
                        <div class="form-group col-md-12">
                            <label for="conclusion"> Impugnación </label>
                            <textarea v-model="this.form.nombre" type="text" class="form-control" id="nombre"
                                aria-describedby="nombre" rows="3" />
                            <div style="color: red;" v-if="this.form.errors.has('nombre')"
                                v-html="this.form.errors.get('nombre')" />
                        </div>


                        <div class="form-group col-md-12">
                            <label for="observaciones"> Observaciones </label>
                            <textarea v-model="this.form.observaciones" type="text" class="form-control" id="observaciones"
                                aria-describedby="observaciones" rows="3" />
                            <div style="color: red;" v-if="this.form.errors.has('observaciones')"
                                v-html="this.form.errors.get('observaciones')" />
                        </div>

                        
                        
                    </div>
                
                <div style="text-align: right;">
                    <div v-if="loading" class="spinner-border" role="status">
                        <span class="sr-only">Cargando...</span>
                    </div>
                    <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                        @click="guardarImpugnacion"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
                    <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarImpugnacion">
                        <i class="fa-solid fa-pen-to-square"></i>  Actualizar </button>
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
                fecha_impugnacion: '',
                observaciones: '',
                activo: 1,
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerImpugnacion();
    },
    methods: {
        obtenerImpugnacion() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_impugnacion == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/impugnacion/' + response.data.expediente.id_impugnacion)
                        .then((response) => {
                            this.form.fill(response.data.impugnacion
                            );
                        }) 
                }
                this.loading = false;
            })
        },
        editarImpugnacion() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }
            this.axios.put('/impugnacion/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerImpugnacion();
            })
        },
        guardarImpugnacion() {
            
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.form.post('/impugnacion').then((response) => {

                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_impugnacion": response.data.impugnacion.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerImpugnacion();
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
            if( this.form.fecha_impugnacion === null || this.form.fecha_impugnacion === "" ){
                this.form.errors.set('fecha_impugnacion', 'Este campo es requerido');
                error = true; 
            }

            if( this.form.observaciones === null || this.form.observaciones === "" ){
                this.form.errors.set('observaciones', 'Este campo es requerido');
                error = true; 
            }


            return error;
        }
    }
}
</script>
