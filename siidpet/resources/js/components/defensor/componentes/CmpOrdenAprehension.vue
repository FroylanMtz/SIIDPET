<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Orden Aprehensión  </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <small class="text-muted"> Porfavor llene los campos. Para ingresar una fecha da clic en el icono del calendario. </small>


        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        
        
        <div class="row"> 

            <div class="form-group col-md-6">
                <label for="fecha">Fecha </label>
                <input v-model="this.form.fecha" type="date" class="form-control" id="fecha"
                    aria-describedby="fecha">
                <div style="color: red;" v-if="this.form.errors.has('fecha')"
                    v-html="this.form.errors.get('fecha')" />
            </div>

            
            <div class="form-group col-md-6">
                <label for="hora"> Hora </label>
                <input v-model="this.form.hora" type="time" class="form-control" id="hora"
                    aria-describedby="hora">
                <div style="color: red;" v-if="this.form.errors.has('hora')"
                    v-html="this.form.errors.get('hora')" />
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
                @click="guardarOrdenAprehension"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarOrdenAprehension">
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
                fecha : '',
                hora: '',
                observaciones: '',
                activo: 1,
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerOrdenAprehension();
    },
    methods: {
        obtenerOrdenAprehension() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_orden_aprencion == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/ordenaprencion/' + response.data.expediente.id_orden_aprencion)
                        .then((response) => {
                            this.form.fill(response.data.orden_aprencion
                            );
                        }) 
                }
                this.loading = false;
            })
        },
        editarOrdenAprehension() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }
            this.axios.put('/ordenaprencion/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerOrdenAprehension();
            })
        },
        guardarOrdenAprehension() {
            
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.form.post('/ordenaprencion').then((response) => {

                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_orden_aprencion": response.data.orden_aprencion.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerOrdenAprehension();
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
            if( this.form.hora === null || this.form.hora === "" ){
                this.form.errors.set('hora', 'Este campo es requerido');
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
