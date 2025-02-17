<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Tribunal de Enjuiciamiento </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <small class="text-muted"> Si desea agregar mas jueces al tribunal de enjuciamiento favor de seleccionar. </small>


        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="form-group">
                    <div class="row"> 

                       

                       
                        <div class="form-group col-md-12">

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-9">
                                        Agregar Jueces
                                     
 
                                               
                                                <v-select v-model="this.form.id_juez" :reduce="(option) => option.id"
                                                    :options="juecesOpciones">
                                                </v-select>
                                                <div style="color: red;" v-if="form.errors.has('id_juez')"
                                                    v-html="form.errors.get('id_juez')" /> 
                                         
        
                                    </div>
                                    <div class="col-3">
                                        <button class="btn btn-primary w-100 mt-3"
                                            style="height:43px;"
                                            @click="guardarTribunalEnjuiciamiento">
                                            Agregar
                                        </button>
                                    </div>
                                </div>
                            </div>

                            <label for="nombre"> Tribunal Enjuiciamiento </label>

                            
                           
                                <EasyDataTable :headers="datos" :items="items" border-cell>
                                    <template #item-operation="item">
                                        <div class="operation-wrapper">
                                            
                                            <button class="btn btn-danger btn-sm" @click="eliminarTribunalEnjuiciamiento(item)">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
                                        </div>
                                    </template>
                                </EasyDataTable>
                        </div>

                        
                        
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
                id_juez_control: '',
                id_expediente: '',
                activo: 1
            }),
            esNuevo: ref(false),
            loading: ref(true),
            datos: [
                { text: "Nombre", value: "juez.nombre" },
                { text: "Municipio", value: "juez.municipio.nombre" },
                { text: "Opciones", value: "operation" }
            ],

            items: ref([]),
            juecesOpciones: ref([]),
        }
    },
    mounted() {
        this.obtenerJueces();
        this.obtenerTribunalEnjuiciamiento();
    },
    methods: {
        obtenerTribunalEnjuiciamiento() {
            this.axios.get('/obtenertribunalporexpediente/' + this.$route.params.id).then((response) => {
                this.items = response.data.tribunal_enjuiciamiento;
            })
        },
        
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

        eliminarTribunalEnjuiciamiento(item) {
            const tribunalEnjuiciamiento =  item;            
            Swal.fire({
                title: '¿Está seguro de eliminar este juez del expediente?',
                showDenyButton: true,
                icon: 'question',
                confirmButtonText: 'Aceptar',
                denyButtonText: `Cancelar`,
                confirmButtonColor: 'LightSeaGreen',
                cancelButtonColor: 'Crimson',
            }).then((result) => {
                if (result.isConfirmed) {

                    const route = '/eliminartribunalenjuiciamiento/'+ tribunalEnjuiciamiento.id +'/';
                    this.axios.delete(route).then((response) => {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Se ha quitado el juez del expediente',
                            showConfirmButton: false,
                            timer: 1500
                        });
                        this.obtenerTribunalEnjuiciamiento();
                    }).catch(error => {
                        console.log(error);
                    });
                } else if (result.isDenied) {
                    Swal.fire('Cambios no realizados', '', 'info')
                }
            })


        },

        guardarTribunalEnjuiciamiento() {
            
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if(error){
                return
            }

            this.form.id_expediente = this.$route.params.id;
            this.form.post('/tribunalenjuiciamiento').then((response) => {
            
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

        validarFomrulario(){
            let error = false;
            if( this.form.id_juez === null || this.form.id_juez === "" ){
                this.form.errors.set('id_juez', 'Este campo es requerido');
                error = true; 
            }
            return error;
        }
    }
}
</script>
