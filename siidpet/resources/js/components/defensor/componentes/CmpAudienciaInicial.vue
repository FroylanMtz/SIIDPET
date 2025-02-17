<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0"> Audiencia Inicial </h5>
                </div><!-- /.col -->
            </div><!-- /.row -->

            <small class="text-muted"> Porfavor llene los campos. Puede dejar un mensaje tan largo como le sea posible.
            </small>

        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">




        <div class="row">

            <div class="form-group col-md-4">
                <label for="audiencia_inicial">Fecha de audiencia inicial</label>

                <input v-model="form.audiencia_inicial" class="form-control" id="audiencia_inicial" type="date"
                    aria-describedby="audiencia_inicial" placeholder="" />


                <div style="color: red;" v-if="form.errors.has('audiencia_inicial')"
                    v-html="form.errors.get('audiencia_inicial')" />


                <div v-if="loading" class="spinner-border" role="status">
                    <span class="sr-only">Cargando...</span>
                </div>

            </div>





            <div class="form-group col-md-4">
                <label for="audiencia_inicial"> Defensor en audiencia </label>
                <v-select v-model="this.formDefensor.id_defensor_audiencia" :reduce="(option) => option.id"
                    :options="defensoresOpciones">
                </v-select>
                <div style="color: red;" v-if="formDefensor.errors.has('id_defensor_audiencia')"
                    v-html="formDefensor.errors.get('id_defensor_audiencia')" />
            </div>





            <div class="form-group col-md-4">
                <label for="juezcontrol"> Juez de control </label>
                <v-select v-model="this.formJuezControl.id_juez_control" :reduce="(option) => option.id"
                    :options="juecesOpciones">
                </v-select>
                <div style="color: red;" v-if="formJuezControl.errors.has('id_juez_control')"
                    v-html="formJuezControl.errors.get('id_juez_control')" />
            </div>

        </div>


        <div style="text-align: right;">
            <div v-if="loading" class="spinner-border" role="status">
                <span class="sr-only">Cargando...</span>
            </div>

            <button v-else-if="!loading && esNuevo" type="button" class="btn btn-primary float-right "
                @click="guardarAudienciaInicial">
                <i class="fa-solid fa-floppy-disk"></i> Guardar </button>
            <button v-else type="button" class="btn btn-primary float-right " @click="editarAudienciaInicial">
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
                audiencia_inicial: ''
            }),
            esNuevo: ref(false),
            loading: ref(true),
            formJuezControl: new Form({
                id: '',
                id_juez_control: ''
            }),
            juecesOpciones: ref([]),
            formDefensor: new Form({
                id: '',
                id_defensor_audiencia: ''
            }),
            defensoresOpciones: ref([]),
        }
    },
    mounted() {
        this.obtenerAudienciaInicial();
        this.obtenerJuez();
        this.obtenerJueces();
        this.obtenerDefensor();
        this.obtenerDefensores();
    },
    methods: {

        obtenerAudienciaInicial() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.audiencia_inicial == null) {
                    this.esNuevo = true;
                } else {
                    this.form.fill({
                        id: response.data.expediente.id,
                        audiencia_inicial: response.data.expediente.audiencia_inicial
                    });
                }
                this.loading = false;
            })
        },

        editarAudienciaInicial() {

            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id + '/', this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.obtenerAudienciaInicial();
            })

            this.editarJuez();
            this.editarDefensor();
        },

        guardarAudienciaInicial() {

            this.form.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id + '/', this.form).then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500
                })
                this.loading = true;
                this.obtenerAudienciaInicial();
            })

            this.guardarDefensor();
            this.guardarJuez();
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


        obtenerJuez() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_juez_control == null) {
                    this.esNuevo = true;
                } else {
                    this.formJuezControl.fill({
                        id: response.data.expediente.id,
                        id_juez_control: response.data.expediente.id_juez_control
                    });
                }
                this.loading = false;
            })
        },
        editarJuez() {
            this.formJuezControl.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id + '/', this.formJuezControl).then((response) => {
                
                this.loading = true;
                this.obtenerJuez();
            })
        },
        guardarJuez() {
            this.formJuezControl.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id + '/', this.formJuezControl).then((response) => {
                
                this.loading = true;
                this.obtenerJuez();
            })
        },

        async obtenerDefensores() {
            try {
                const response = await this.axios.get('/defensor');
                this.defensoresOpciones = response.data.map(defensor => ({
                    id: defensor.id,
                    label: defensor.user.name + " " + defensor.user.fathername + " " + defensor.user.mothername
                }));
            } catch (error) {
                console.error('Error fetching ocupaciones:', error);
            }
        },

        obtenerDefensor() {
            this.axios.get('/expediente/' + this.$route.params.id).then((response) => {
                if (response.data.expediente.id_defensor_audiencia == null || response.data.expediente.id_defensor_audiencia == "") {
                    this.esNuevo = true;
                } else {
                    this.formDefensor.fill({
                        id: response.data.expediente.id,
                        id_defensor_audiencia: response.data.expediente.id_defensor_audiencia
                    });
                }
                this.loading = false;
            })
        },
        editarDefensor() {
            this.formDefensor.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id + '/', this.formDefensor).then((response) => {
                
                this.loading = true;
                this.obtenerDefensor();
            })
        },
        guardarDefensor() {
            this.formDefensor.errors.clear();
            let error = this.validarFomrulario();
            if (error) {
                return
            }

            this.axios.put('/expediente/' + this.$route.params.id + '/', this.formDefensor).then((response) => {
                
                this.loading = true;
                this.esNuevo = false;
                this.obtenerDefensor();
            })
        },

        validarFomrulario() {
            let error = false;

            if (this.formDefensor.id_defensor_audiencia === null || this.formDefensor.id_defensor_audiencia === "") {
                this.formDefensor.errors.set('id_defensor_audiencia', 'Este campo es requerido');
                error = true;
            }



            if (this.formJuezControl.id_juez_control === null || this.formJuezControl.id_juez_control === "") {
                this.formJuezControl.errors.set('id_juez_control', 'Este campo es requerido');
                error = true;
            }

            if (this.form.audiencia_inicial === null || this.form.audiencia_inicial === "") {
                this.form.errors.set('audiencia_inicial', 'Este campo es requerido');
                error = true;
            }
            return error;
        }



    }
}
</script>
