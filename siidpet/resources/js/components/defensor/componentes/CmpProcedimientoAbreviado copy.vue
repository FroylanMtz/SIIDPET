<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Procedimiento abreviado </h5>
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
                            <label for="fecha">Fecha </label>
                            <input v-model="this.form.fecha" type="date" class="form-control" id="fecha"
                                aria-describedby="fecha">
                            <div style="color: red;" v-if="this.form.errors.has('fecha')"
                                v-html="this.form.errors.get('fecha')" />
                        </div>

                       
                        <div class="form-group col-md-12">
                            <label for="sentencia"> Sentencia </label>
                            <textarea v-model="this.form.sentencia" type="text" class="form-control" id="sentencia"
                                aria-describedby="sentencia" rows="3" />
                            <div style="color: red;" v-if="this.form.errors.has('sentencia')"
                                v-html="this.form.errors.get('sentencia')" />
                        </div>

                        
                        <div v-if="loading" class="spinner-border" role="status">
                            <span class="sr-only">Cargando...</span>
                        </div>
                        <button v-else-if="!loading && esNuevo" type="button" class="btn btn-success float-right mb-1"
                            @click="guardarProcedimientoAbreviado"> Guardar </button>
                        <button v-else type="button" class="btn btn-warning float-right mb-1" @click="editarProcedimientoAbreviado">
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
                fecha: '',
                sentencia: '',
                activo: 1,
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerProcedimientoAbreviado();
    },
    methods: {
        obtenerProcedimientoAbreviado() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_procedimiento_abreviado == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/procedimientoabreviado/' + response.data.expediente.id_procedimiento_abreviado)
                        .then((response) => {
                            this.form.fill(response.data.procedimiento_abreviado
                            );
                        }) 
                }
                this.loading = false;
            })
        },
        editarProcedimientoAbreviado() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }
            this.axios.put('/procedimientoabreviado/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerProcedimientoAbreviado();
            })
        },
        guardarProcedimientoAbreviado() {
            
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.form.post('/procedimientoabreviado').then((response) => {

                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_procedimiento_abreviado": response.data.procedimiento_abreviado.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerProcedimientoAbreviado();
                    this.esNuevo = false;
                })
            
            })

        },

        validarFomrulario(){
            let error = false;
            if( this.form.fecha === null || this.form.fecha === "" ){
                this.form.errors.set('fecha', 'Este campo es requerido');
                error = true; 
            }
            if( this.form.sentencia === null || this.form.sentencia === "" ){
                this.form.errors.set('sentencia', 'Este campo es requerido');
                error = true; 
            }
            return error;
        }
    }
}
</script>
