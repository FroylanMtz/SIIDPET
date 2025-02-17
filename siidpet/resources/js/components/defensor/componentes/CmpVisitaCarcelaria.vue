<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Visita Carcelaria </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <small class="text-muted"> Porfavor llene el campo. Puede poner tanto texto como le sea posible. </small>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        
                
                    <div class="row">

                        <div class="form-group">
                            <label for="visita_carcelaria"> Visita carcelaria </label>
                            
                            <textarea v-model="form.visita_carcelaria" class="form-control" 
                                id="visita_carcelaria" rows="3" aria-describedby="visita_carcelaria" placeholder=""></textarea>
                            
                            
                            <div style="color: red;" v-if="form.errors.has('visita_carcelaria')"
                                v-html="form.errors.get('visita_carcelaria')" />
                        </div>                      

                        

                    </div>
                
                <div style="text-align: right;">
                    <div v-if="loading" class="spinner-border" role="status">
                        <span class="sr-only">Cargando...</span>
                    </div>

                    <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                        @click="guardarVisitaCarcelaria"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
                    <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarVisitaCarcelaria">
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
                visita_carcelaria: ''
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerVisitaCarcelaria();
    },
    methods: {

        obtenerVisitaCarcelaria() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if ( response.data.expediente.visita_carcelaria  == null) {
                    this.esNuevo = true;
                } else {
                    this.form.fill({
                        id: response.data.expediente.id,
                        visita_carcelaria : response.data.expediente.visita_carcelaria
                    });
                }
                this.loading = false;
            })
        },

        editarVisitaCarcelaria() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
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
                this.obtenerVisitaCarcelaria();
            })
        },

        guardarVisitaCarcelaria() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.axios.put('/expediente/' +  this.$route.params.id  +'/', this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.esNuevo = false;
                this.obtenerVisitaCarcelaria();
            })
        },


        validarFomrulario(){
            let error = false;
            if( this.form.visita_carcelaria === null || this.form.visita_carcelaria === "" ){
                this.form.errors.set('visita_carcelaria', 'Este campo es requerido');
                error = true; 
            }
            return error;
        }



    }
}
</script>
