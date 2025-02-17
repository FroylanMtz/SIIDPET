<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Defensor que cubre audiencia </h5>
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
                        <div class="form-group">
                            <div class="form-group">
                                <label for="audiencia_inicial"> Defensor en audiencia </label>
                                <v-select v-model="this.formDefensor.id_defensor_audiencia" :reduce="(option) => option.id"
                                    :options="defensoresOpciones">
                                </v-select>
                                <div style="color: red;" v-if="formDefensor.errors.has('id_defensor_audiencia')"
                                    v-html="formDefensor.errors.get('id_defensor_audiencia')" /> 
                            </div>
                        </div>                      
                        <div v-if="loading" class="spinner-border" role="status">
                            <span class="sr-only">Cargando...</span>
                        </div>
                        <button v-else-if="!loading && esNuevo" type="button" class="btn btn-success float-right mb-1"
                            @click="guardarDefensor"> Guardar </button>
                        <button v-else type="button" class="btn btn-warning float-right mb-1" @click="editarDefensor">
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
            formDefensor: new Form({
                id: '',
                id_defensor_audiencia: ''
            }),
            defensoresOpciones: ref([]),
            esNuevo: ref(false),
            loading: ref(true),
            
        }
    },
    mounted() {
        this.obtenerDefensor();
        this.obtenerDefensores();
    },
    methods: {
        
        async obtenerDefensores() {
            try {
                const response = await this.axios.get('/defensor');
                this.defensoresOpciones = response.data.map(defensor => ({
                    id: defensor.id,
                    label: defensor.user.name + " " + defensor.user.fathername + " "+ defensor.user.mothername
                }));
            } catch (error) {
                console.error('Error fetching ocupaciones:', error);
            }
        },

        obtenerDefensor() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if ( response.data.expediente.id_defensor_audiencia  == null || response.data.expediente.id_defensor_audiencia == "") {
                    this.esNuevo = true;
                } else {
                    this.formDefensor.fill({
                        id: response.data.expediente.id,
                        id_defensor_audiencia : response.data.expediente.id_defensor_audiencia
                    });
                }
                this.loading = false;
            })
        },
        editarDefensor() {
            this.formDefensor.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id + '/', this.formDefensor).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.obtenerDefensor();
            })
        },
        guardarDefensor() {
            this.formDefensor.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id +'/', this.formDefensor).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.esNuevo = false;
                this.obtenerDefensor();
            })
        },


        validarFomrulario(){

            let error = false;

            if( this.formDefensor.id_defensor_audiencia === null || this.formDefensor.id_defensor_audiencia === "" ){
                this.formDefensor.errors.set('id_defensor_audiencia', 'Este campo es requerido');
                error = true; 
            }

            return error;
        }


    }
}
</script>
