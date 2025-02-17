<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Conclusion </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <small class="text-muted"> Porfavor llene los campos. Para ingresar una fecha da clic en el icono del
                calendario. </small>


        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        <div class="row">
            <div class="form-group col-md-12">
                <label for="fecha_conclusion">Fecha </label>
                <input v-model="this.form.fecha_conclusion" type="date" class="form-control" id="fecha_conclusion"
                    aria-describedby="fecha_conclusion">
                <div style="color: red;" v-if="this.form.errors.has('fecha_conclusion')"
                    v-html="this.form.errors.get('fecha_conclusion')" />
            </div>
            <div class="form-group col-md-12">
                <label for="conclusion"> Conclusion </label>
                <textarea v-model="this.form.nombre" type="text" class="form-control" id="nombre"
                    aria-describedby="nombre" rows="3" />
                <div style="color: red;" v-if="this.form.errors.has('nombre')"
                    v-html="this.form.errors.get('nombre')" />
            </div>
        </div>
        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>
            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right mb-1"
                @click="guardarConclusion"> <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right mb-1" @click="editarConclusion">
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
                fecha_conclusion: '',
                nombre: '',
                activo: 1,
            }),
            esNuevo: ref(false),
            loading: ref(true),
        }
    },
    mounted() {
        this.obtenerConclusion();
    },
    methods: {
        obtenerConclusion() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_conclusion == null) {
                    this.esNuevo = true;
                } else {
                    this.axios.get('/conclusion/' + response.data.expediente.id_conclusion)
                        .then((response) => {
                            this.form.fill(response.data.conclusion
                            );
                        })
                }
                this.loading = false;
            })
        },
        editarConclusion() {
            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }
            this.axios.put('/conclusion/' + this.form.id, this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.obtenerConclusion();
            })
        },
        guardarConclusion() {

            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.form.post('/conclusion').then((response) => {

                this.axios.put('/expediente/' + this.$route.params.id, {
                    "id_conclusion": response.data.conclusion.id
                }).then((response) => {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: response.data.mensaje,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.obtenerConclusion();
                    this.esNuevo = false;
                })

            })

        },

        validarFomrulario() {
            let error = false;
            if (this.form.fecha_conclusion === null || this.form.fecha_conclusion === "") {
                this.form.errors.set('fecha_conclusion', 'Este campo es requerido');
                error = true;
            }
            if (this.form.nombre === null || this.form.nombre === "") {
                this.form.errors.set('nombre', 'Este campo es requerido');
                error = true;
            }
            return error;
        }
    }
}
</script>
