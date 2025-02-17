<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Juez de control </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <small class="text-muted"> Porfavor llene el campo. Este campo es obligatorio </small>

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="form-group">
                    <div class="row">

                        <div class="form-group">
                            
                            
                            <div class="form-group">
                                <label for="juezcontrol"> Juez de control </label>
                                <v-select v-model="this.formJuezControl.id_juez_control" :reduce="(option) => option.id"
                                    :options="juecesOpciones">
                                </v-select>
                                <div style="color: red;" v-if="formJuezControl.errors.has('id_juez_control')"
                                    v-html="formJuezControl.errors.get('id_juez_control')" /> 
                            </div>

                            
                        </div>                      

                        <div v-if="loading" class="spinner-border" role="status">
                            <span class="sr-only">Cargando...</span>
                        </div>

                        <button v-else-if="!loading && esNuevo" type="button" class="btn btn-success float-right mb-1"
                            @click="guardarJuez"> Guardar </button>
                        <button v-else type="button" class="btn btn-warning float-right mb-1" @click="editarJuez">
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
            formJuezControl: new Form({
                id: '',
                id_juez_control: ''
            }),
            juecesOpciones: ref([]),
            esNuevo: ref(false),
            loading: ref(true),
            
        }
    },
    mounted() {
        this.obtenerJuez();
        this.obtenerJueces();
    },
    methods: {
        
        async obtenerJueces() {
            try {
                const response = await this.axios.get('/juezcontrol');
                this.juecesOpciones = response.data.map(juez => ({
                    id: juez.id,
                    label: juez.nombre
                }));
            } catch (error) {
                console.error('Error fetching ocupaciones:', error);
            }
        },


        obtenerJuez() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if ( response.data.expediente.id_juez_control  == null) {
                    this.esNuevo = true;
                } else {
                    this.formJuezControl.fill({
                        id: response.data.expediente.id,
                        id_juez_control : response.data.expediente.id_juez_control
                    });
                }
                this.loading = false;
            })
        },
        editarJuez() {
            this.formJuezControl.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id + '/', this.formJuezControl).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.obtenerJuez();
            })
        },
        guardarJuez() {
            this.formJuezControl.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id +'/', this.formJuezControl).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.obtenerJuez();
            })
        },

        validarFomrulario(){

            let error = false;
            

            if( this.formJuezControl.id_juez_control === null || this.formJuezControl.id_juez_control === "" ){
                this.formJuezControl.errors.set('id_juez_control', 'Este campo es requerido');
                error = true; 
            }

            return error;
        }


    }
}
</script>
