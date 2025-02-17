<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Medida cautelar</h5>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <small class="text-muted"> Porfavor llene los campos. Para ingresar una fecha da clic en el icono del
                calendario. </small>


        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">


        <div class="row">

            <div class="form-group col-md-6">
                <label for="Medida Cautelar">Medida Cautelar</label>

                <textarea v-model="this.form.nombre" type="text" class="form-control" id="nombre"
                    aria-describedby="fecha_inicio" rows="3" />

                <div style="color: red;" v-if="this.form.errors.has('nombre')"
                    v-html="this.form.errors.get('nombre')" />
            </div>

            <div class="form-group col-md-6">
                <label for="Fecha fin">Fecha </label>
                <input v-model="this.form.fecha" type="date" class="form-control" id="fecha" aria-describedby="fecha">
                <div style="color: red;" v-if="this.form.errors.has('fecha')" v-html="this.form.errors.get('fecha')" />
            </div>


        </div>

        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>
            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarMedidaCautelar"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarMedidaCautelar">
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
                nombre: '',
                fecha: '',
                activo: 1,
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerMedidaCautelar();
    },
    methods: {
        obtenerMedidaCautelar() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_medida_cautelar == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/medidacautelar/' + response.data.expediente.id_medida_cautelar)
                        .then((response) => {
                            this.form.fill(response.data.medida_cautelar
                            );
                        })
                }
                this.loading = false;
            })
        },
        editarMedidaCautelar() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }
            this.axios.put('/medidacautelar/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerMedidaCautelar();
            })
        },
        guardarMedidaCautelar() {

            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.form.post('/medidacautelar').then((response) => {

                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_medida_cautelar": response.data.medida_cautelar.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerMedidaCautelar();
                    this.esNuevo = false;
                })

            })

        },

        validarFomrulario() {

            let error = false;

            if (this.form.nombre === null || this.form.nombre === "") {
                this.form.errors.set('nombre', 'Este campo es requerido');
                error = true;
            }

            if (this.form.fecha === null || this.form.fecha === "") {
                this.form.errors.set('fecha', 'Este campo es requerido');
                error = true;
            }

            return error;

        }


    }
}
</script>
