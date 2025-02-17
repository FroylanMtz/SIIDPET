<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Examen de la detención </h5>
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
                            <label for="resultado"> Resultado </label>
                            <textarea v-model="this.form.resultado" type="text" class="form-control" id="resultado"
                                aria-describedby="resultado" rows="3" />
                            <div style="color: red;" v-if="this.form.errors.has('resultado')"
                                v-html="this.form.errors.get('resultado')" />
                        </div>

                        
                        
                    </div>
                
                <div style="text-align: right;">
                    <div v-if="loading" class="spinner-border" role="status">
                        <span class="sr-only">Cargando...</span>
                    </div>
                    <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                        @click="guardarExamenDetencion"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
                    <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarExamenDetencion">
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
                resultado: '',
                activo: 1,
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerExamenDetencion();
    },
    methods: {
        obtenerExamenDetencion() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_examen_detencion == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/examendetencion/' + response.data.expediente.id_examen_detencion)
                        .then((response) => {
                            this.form.fill(response.data.examen_detencion
                            );
                        }) 
                }
                this.loading = false;
            })
        },
        editarExamenDetencion() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }
            this.axios.put('/examendetencion/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerExamenDetencion();
            })
        },
        guardarExamenDetencion() {
            
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.form.post('/examendetencion').then((response) => {

                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_examen_detencion": response.data.examen_detencion.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerExamenDetencion();
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

            if( this.form.resultado === null || this.form.resultado === "" ){
                this.form.errors.set('resultado', 'Este campo es requerido');
                error = true; 
            }


            return error;
        }
    }
}
</script>
