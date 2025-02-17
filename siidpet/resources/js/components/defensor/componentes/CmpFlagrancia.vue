<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Flagrancia </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <small class="text-muted"> Por favor registra los campos solicitados. Los * son campos obligatorios. Para seleccionar una fecha u hora, da clic en el icono correspondiente </small>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        
        
        <div class="row">

            <div class="col-6">
                <div class="form-group">
                    Fecha * 
                    <input v-model="form.fecha" type="date" class="form-control"
                        id="fecha" aria-describedby="fecha" placeholder="">
                    <div style="color: red;" v-if="form.errors.has('fecha')"
                        v-html="form.errors.get('fecha')" />
                </div>

            </div>

            <div class="col-6">
                <div class="form-group">
                    Hora *
                    <input v-model="form.hora" type="time" class="form-control"
                        id="hora" aria-describedby="hora" placeholder="">
                    <div style="color: red;" v-if="form.errors.has('hora')"
                        v-html="form.errors.get('hora')" />
                </div>  

            </div>


            

                                    

            


        </div>
        

        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>
            <button v-else-if="!loading && esNuevo"  class="btn btn-primary float-right"
                @click="guardarFlagrancia"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else class="btn btn-primary float-right" @click="editarFlagrancia">
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
                fecha: '',
                hora: '',
                activo: 1,
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerFlagrancia();
    },
    methods: {

        obtenerFlagrancia() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_flagrancia == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/flagrancia/' + response.data.expediente.id_flagrancia)
                        .then((response) => {
                            this.form.fill(response.data.flagrancia);
                        })
                }
                this.loading = false;
            })
        },

        editarFlagrancia() {
            this.form.errors.clear('fecha');
            this.form.errors.clear('hora');

            console.log("Fecha " + this.form.fecha );
            console.log("Hora " + this.form.hora );
            if( this.form.fecha === null || this.form.hora === null || this.form.fecha === "" || this.form.hora === "" ){
                if(this.form.fecha===null || this.form.fecha === ""){
                    this.form.errors.set('fecha', 'Este campo es requerido');
                }
                if(this.form.hora===null || this.form.hora === "" ){
                    this.form.errors.set('hora', 'Este campo es requerido');
                }
            }else{

                this.axios.put('/flagrancia/' + this.form.id, this.form).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.loading = true;
                    this.obtenerFlagrancia();
                })

            }

        },

        guardarFlagrancia() {

            this.form.errors.clear('fecha');
            this.form.errors.clear('hora');

            if( this.form.fecha === null || this.form.hora === null ){
                if(this.form.fecha===""){
                    this.form.errors.set('fecha', 'Este campo es requerido');
                }
                if(this.form.hora===""){
                    this.form.errors.set('hora', 'Este campo es requerido');
                }
            }else{

                this.form.post('/flagrancia').then((response) => {
                    this.axios.put('/expediente/' + this.$route.params.id, {
                        "id_flagrancia": response.data.flagrancia.id
                    }).then((response) => {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: response.data.mensaje,
                            showConfirmButton: false,
                            timer: 1500
                        })
                        this.loading = true;
                        this.obtenerFlagrancia();
                    })
                })


            }

            
        },


    }
}
</script>
