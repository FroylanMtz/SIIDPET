<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0">Imputados</h5>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <small class="text-muted"> Registra un nuevo imputado o selecciona uno previamente registrado </small>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="btn-group d-flex mb-3">
                    <button class="btn btn-success flex-grow-1" data-toggle="modal" data-target="#modalAgregarImputado"
                    @click="abrirModalRegistro"> <i class="fa-solid fa-floppy-disk"> </i> Registrar Nuevo</button>
                    <button class="btn btn-primary flex-grow-1" data-toggle="modal" data-target="#modalSeleccionarImputado"
                    @click="obtenerImputadosModal"> <i class="fa-regular fa-square-check"></i> Agregar existente</button>
                </div>
                
                <div class="row">
                    <div class="collapse" id="collapseExample">
                        <div class="card card-body">
                        </div>
                    </div>
                </div>
                <EasyDataTable :headers="datos" :items="items"  border-cell>
                    <template #item-operation="item">
                        <div class="operation-wrapper">
                            <button class="btn btn-warning btn-sm mr-1" @click="actualizarUsuario(item)">
                                <i class="fa-solid fa-pen-to-square"></i>
                            </button>
                            <button class="btn btn-danger btn-sm " @click="eliminarUsuario(item)">
                                <i class="fa-solid fa-trash"></i>
                            </button>
                        </div>
                    </template>
                </EasyDataTable>
            </div>
        </div>
        <div class="modal fade " id="modalAgregarImputado" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                <div class="modal-content">
                    <form @submit.prevent="actualizarUsuarioCheck === false ? registrarImputado : actualizarUsuario"
                        @keydown="form.onKeydown($event)">
                        <div class="modal-header">
                            <h5 v-if="!actualizarUsuarioCheck" class="modal-title" id="modalAgregarImputado"> Registrar
                                imputado
                            </h5>
                            <h5 v-else class="modal-title" id="modalAgregarImputado"> Actualizar imputado </h5>
                            <br/>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <small class="text-muted ml-3"> Registra todos los campos. Los * son obligatorios </small>
                        <div class="modal-body">
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="Nombre del usuario">Nombre(s) *</label>
                                    <input v-model="form.nombres" type="text" class="form-control" id="nombre"
                                        aria-describedby="nombre">
                                    <div style="color: red;" v-if="form.errors.has('nombres')"
                                        v-html="form.errors.get('nombres')" />
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="Apellido Paterno">Apellido Paterno *</label>
                                    <input v-model="form.apellido_paterno" type="text" class="form-control"
                                        id="apellido_paterno" aria-describedby="Apellido Paterno" placeholder="">
                                    <div style="color: red;" v-if="form.errors.has('apellido_paterno')"
                                        v-html="form.errors.get('apellido_paterno')" />
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="Apellido Materno">Apellido Materno </label>
                                    <input v-model="form.apellido_materno" type="text" class="form-control"
                                        id="apellido_materno" aria-describedby="Apellido Materno" placeholder="">
                                    <div style="color: red;" v-if="form.errors.has('apellido_materno')"
                                        v-html="form.errors.get('apellido_materno')" />
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="sexo">Sexo *</label>
                                    <select v-model="form.sexo" class="form-control" id="sexo" aria-describedby="sexo">
                                        <option value="" disabled>Seleccione una opción</option>
                                        <option value="masculino">Masculino</option>
                                        <option value="femenino">Femenino</option>
                                    </select>
                                    <div style="color: red;" v-if="form.errors.has('sexo')" v-html="form.errors.get('sexo')"></div>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="Telefono">Teléfono *</label>

                                    <MaskInput class="form-control" v-model="this.form.telefono" mask="(###) ###-##-##" placeholder="(###) ###-##-##" />


                                    
                                    <div style="color: red;" v-if="form.errors.has('telefono')"
                                        v-html="form.errors.get('telefono')" />
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="Telefono">Domicilio *</label>
                                    <input v-model="form.domicilio" type="text" maxlength="255" class="form-control" id="domicilio"
                                        aria-describedby="domicilio" placeholder="">

                                    <span class="alinear-derecha" style="font-size: 10px"> 
                                        {{ 255 - this.form.domicilio.length }} Restante
                                    </span>
                                    

                                    <div style="color: red;" v-if="form.errors.has('domicilio')"
                                        v-html="form.errors.get('domicilio')" />
                                </div>
    
                                <div class="form-group col-md-6">
                                    <label for="estado_civil">Estado Civil *</label>
                                    <select v-model="form.estado_civil" class="form-control" id="estado_civil" aria-describedby="estado_civil">
                                        <option value="" disabled>Seleccione una opción</option>
                                        <option value="soltero/a">Soltero/a</option>
                                        <option value="casado/a">Casado/a</option>
                                        <option value="divorciado/a">Divorciado/a</option>
                                        <option value="separado/a en proceso judicial">Separado/a en proceso judicial</option>
                                        <option value="viudo/a">Viudo/a</option>
                                        <option value="concubinato">Concubinato</option>
                                    </select>
                                    <div style="color: red;" v-if="form.errors.has('estado_civil')" v-html="form.errors.get('estado_civil')"></div>
                                </div>
                            
                            </div>
                            

                            <div class="form-row">

                                <div class="form-group col-md-4">
                                    <label for="Pais">Pais *</label>
                                    <v-select v-model="form.id_pais" :reduce="(option) => option.id"
                                        :options="paisesOpciones" 
                                        @update:model-value="seleccionarEstado(form.id_pais)"
                                        >
                                    </v-select>
                                    <div style="color: red;" v-if="form.errors.has('id_pais')"
                                        v-html="form.errors.get('id_pais')" />
                                </div>
    
                                <div class="form-group col-md-4">
                                    <label for="Estado">Estado *</label>
                                    <v-select v-model="form.id_estado" :reduce="(option) => option.id"
                                        :options="estadosOpciones"
                                        
                                        @update:model-value="seleccionarMunicipio(form.id_estado)">
                                    </v-select>
                                    <div style="color: red;" v-if="form.errors.has('id_estado')"
                                        v-html="form.errors.get('id_estado')" />
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="Municipio">Municipio *</label>
                                    <v-select v-model="this.form.id_municipio" :reduce="(option) => option.id"
                                        :options="municipiosOpciones"
                                        >
                                    </v-select>
                                    <div style="color: red;" v-if="form.errors.has('id_municipio')"
                                        v-html="form.errors.get('id_municipio')" />
                                </div>

                            </div>


                            
                            <div class="form-row">

                                <div class="form-group  col-md-4">
                                    <label for="Fecha de Nacimiento">F. de nacimiento *</label>
                                    <input v-model="form.fecha_de_nacimiento" type="date" class="form-control"
                                        id="fecha_de_nacimiento" aria-describedby="fecha_de_nacimiento" placeholder="">
                                    <div style="color: red;" v-if="form.errors.has('fecha_de_nacimiento')"
                                        v-html="form.errors.get('fecha_de_nacimiento')" />
                                </div>
    
                                <div class="form-group  col-md-4">
                                    <label for="Escolaridad">Escolaridad *</label>
                                    <v-select v-model="this.form.id_escolaridad" :reduce="(option) => option.id"
                                        :options="escolaridadOpciones">
                                    </v-select>
    
                                    <div style="color: red;" v-if="form.errors.has('id_escolaridad')"
                                        v-html="form.errors.get('id_escolaridad')" />
                                </div>
                                <div class="form-group  col-md-4">
                                    <label for="ocupacion">Ocupación *</label>
    
                                    <v-select v-model="this.form.id_ocupacion" :reduce="(option) => option.id"
                                        :options="ocupacionesOpciones">
                                    </v-select>
                                    <div style="color: red;" v-if="form.errors.has('id_ocupacion')"
                                        v-html="form.errors.get('id_ocupacion')" />
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                <i class="fas fa-times"></i> Cancelar
                            </button>

                            <button v-if="!actualizarUsuarioCheck" type="submit" :disabled="form.busy"
                                class="btn btn-primary" @click="registrarImputado">
                                <i class="fas fa-save"></i> Guardar
                            </button>
                            <button v-else type="submit" :disabled="form.busy" class="btn btn-warning"
                                @click="editarUsuario">
                                <i class="fas fa-save"></i> Actualizar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>




        <div class="modal fade" id="modalSeleccionarImputado" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">

                    

                    <form @submit.prevent="actualizarUsuarioCheck === false ? registrarImputado : actualizarUsuario" 
                        @keydown="form.onKeydown($event)">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalSeleccionarImputado"> 
                                Seleccionar imputado
                            </h5>

                            
                           

                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <small class="text-muted ml-3"> Busca al imputado por nombre </small>
                        <div class="modal-body">
                            
                            <div class="form-row">
                                <div class="form-group col-md-12 ">
                                    <label for="Nombre del usuario">Nombre(s): </label>
                                    

                                    <v-select v-model="imputadoSeleccionadoEnModal" :reduce="(option) => option.id"
                                        :options="imputadosOpciones" 
                                        @update:model-value="seleccionarImputado()"
                                        
                                        >
                                    </v-select>
                                    
                                    <table class="table table-bordered mt-2">
                                        <thead class="table-primary">
                                            <tr>
                                                <th>Campo</th>
                                                <th>Valor</th>
                                            </tr>
                                        </thead>
                                        <tbody v-if="this.datosImputadoSeleccionado !== null ">
                                            <tr>
                                                <td>
                                                    NOMBRE
                                                </td>
                                                <td>
                                                    {{ this.datosImputadoSeleccionado.nombres }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    A. PATERNO
                                                </td>
                                                <td>
                                                    {{ this.datosImputadoSeleccionado.apellido_paterno }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    A. MATERNO
                                                </td>
                                                <td>
                                                    {{ this.datosImputadoSeleccionado.apellido_materno }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    MUNICIPIO
                                                </td>
                                                <td>
                                                    {{ this.datosImputadoSeleccionado.municipio.nombre }} , {{ this.datosImputadoSeleccionado.estado.nombre }} , {{ this.datosImputadoSeleccionado.pais.nombre }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    FECHA DE NACIMIENTO
                                                </td>
                                                <td>
                                                    {{ this.datosImputadoSeleccionado.fecha_de_nacimiento }}
                                                </td>
                                            </tr>
                                            
                                        </tbody>
                                    </table>

                                </div>
                                
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                <i class="fas fa-times"></i> Cancelar
                            </button>

                            <button type="submit" :disabled="form.busy"
                                class="btn btn-primary" @click="agregarImputadoAExpediente">
                                <i class="fas fa-save"></i> Agregar
                            </button>
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </div>
</template>

<script lang="ts">
import { ref } from "vue";
import type { Header, Item } from "vue3-easy-data-table";
import Form from 'vform'
import Swal from 'sweetalert2'
import vSelect from 'vue-select';

export default {
    components: {
        vSelect,
    },
    data() {
        return {
            phoneNumber: '',
            roles: ref(["Administrador", "Director General", "Director Defensoría", "Director Asesorias", "Jefe Asesorias", "Defensor", "Asesor"]),
            actualizarUsuarioCheck: ref(false),
            searchField: ref("name"),
            searchValue: ref(""),
            themeColor: "#AB0033",
            datos: [
                { text: "Nombre", value: "nombres" },
                { text: "Ap. Pat", value: "apellido_paterno" },
                { text: "Ap. Mat", value: "apellido_materno" },
                { text: "Telefono", value: "telefono" },
                { text: "Domicilio", value: "domicilio" },
                { text: "Sexo", value: "sexo" },
                { text: "Pais", value: "pais.nombre" },
                { text: "Estado", value: "estado.nombre" },
                { text: "Municipio", value: "municipio.nombre" },
                { text: "Estado Civil", value: "estado_civil" },
                { text: "Fecha de nacimiento", value: "fecha_de_nacimiento" },
                { text: "Escolaridad", value: "escolaridad.nombre" },
                { text: "Ocupación", value: "ocupacion.nombre" },
                { text: "Opciones", value: "operation" }
            ],
            items: ref([]),
            form: new Form({
                id: '',
                nombres: '',
                apellido_paterno: '',
                apellido_materno: '',
                telefono: '',
                domicilio: '',
                sexo: '',
                id_pais: '',
                id_estado: '',
                id_municipio: '',
                estado_civil: '',
                fecha_de_nacimiento: '',
                id_escolaridad: '',
                id_ocupacion: '',
                activo: 1,
                opciones: '',
            }),
            paisesOpciones: ref([]),
            estadosOpciones: ref([]),
            municipiosOpciones: ref([]),
            escolaridadOpciones: ref([]),
            ocupacionesOpciones: ref([]),
            imputadosOpciones: ref([]),
            imputadoSeleccionadoEnModal: ref(''),
            datosImputadoSeleccionado: ref(null),
        }
    },
    mounted() {
        this.obtenerImputados();
        this.obtenerPaises();
        this.obtenerEscolaridades();
        this.obtenerOcupaciones();
    },
    methods: {

        actualizarInformacion(){
            this.$emit('llamar-funcion');
        },

        limpiarSelectImputado(){
            this.datosImputadoSeleccionado = null;
        },
        agregarImputadoAExpediente(){

            if( this.datosImputadoSeleccionado == null ){
                Swal.fire('Debe seleccionar un imputado', '', 'info')
            }else{
                try {
                    const response = this.axios.post('/imputadosExpediente', {
                        id_expediente: this.$route.params.id,
                        id_imputado: this.imputadoSeleccionadoEnModal
                    });   
                } catch (error) {
                    console.error('Error al enviar los datos:', error);
                }
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Imputado guardado con éxito',
                    showConfirmButton: false,
                    timer: 1500
                });
                $('#modalSeleccionarImputado').modal('hide');
                this.obtenerImputados();
                this.actualizarInformacion();

            }
        },

        async seleccionarMunicipio(value){
            try {
                const response = await this.axios.get('/municipios/'+value);                
                this.municipiosOpciones = response.data.municipio.map(municipio => ({
                    id: municipio.id,
                    label: municipio.nombre
                }));
                
            } catch (error) {
                console.error('Error fetching countries:', error);
            }
        },

        async seleccionarEstado(value){            
            try {
                const response = await this.axios.get('/estado/'+value);
                this.estadosOpciones = response.data.estado.map(estado => ({
                    id: estado.id,
                    label: estado.nombre
                }));
            } catch (error) {
                console.error('Error fetching countries:', error);
            }
            this.form.id_estado = null;
            this.form.id_municipio = null;
        },

        async seleccionarImputado(){
            if( this.imputadoSeleccionadoEnModal != null ){
                try {
                    const response = await this.axios.get('/imputado/'+ this.imputadoSeleccionadoEnModal);
                    this.datosImputadoSeleccionado = response.data.imputado;
                } catch (error) {
                    console.error('Error fetching countries:', error);
                }

            }else{
                this.datosImputadoSeleccionado = null;
            }
            
        },


        async obtenerOcupaciones() {
            try {
                const response = await this.axios.get('/ocupacion');
                this.ocupacionesOpciones = response.data.map(ocupacion => ({
                    id: ocupacion.id,
                    label: ocupacion.nombre
                }));
            } catch (error) {
                console.error('Error al obtener ocupaciones', error);
            }
        },


        async obtenerPaises() {
            try {
                const response = await this.axios.get('/pais');
                this.paisesOpciones = response.data.map(pais => ({
                    id: pais.id,
                    label: pais.nombre
                }));
            } catch (error) {
                console.error('Error fetching countries:', error);
            }
        },


        async obtenerEscolaridades() {
            try {
                const response = await this.axios.get('/escolaridad');
                this.escolaridadOpciones = response.data.map(esc => ({
                    id: esc.id,
                    label: esc.nombre
                }));
            } catch (error) {
                console.error('Error fetching countries:', error);
            }
        },

        async obtenerMunicipio() {
            try {
                const response = await this.axios.get('/municipios');
                this.municipiosOpciones = response.data.map(municipio => ({
                    id: municipio.id,
                    label: municipio.nombre
                }));
            } catch (error) {
                console.error('Error fetching countries:', error);
            }
        },


        async obtenerEstados() {
            try {
                const response = await this.axios.get('/estado');
                this.estadosOpciones = response.data.map(estado => ({
                    id: estado.id,
                    label: estado.nombre
                }));
            } catch (error) {
                console.error('Error fetching countries:', error);
            }
        },

        async obtenerImputados() {
            try {
                this.axios.get('/imputadosPorExpediente/'+ this.$route.params.id +'/' ).then((response) => {
                this.items = response.data;
                
            })
            } catch (error) {
                console.error('Error obteniendo los imputadors:', error);
            }
        },

        abrirModalRegistro() {
            this.actualizarUsuarioCheck = false;
            this.form.reset();
            this.form.clear();
        },

        obtenerImputadosModal() {
            this.datosImputadoSeleccionado = null;
            this.imputadoSeleccionadoEnModal = '';
            this.axios.get('/imputado').then((response) => {
                this.imputadosOpciones = response.data.map(imputado => ({
                    id: imputado.id,
                    label: imputado.nombres + ' ' + imputado.apellido_paterno + ' ' + imputado.apellido_materno ,
                }));
            })
        },

        async registrarImputado() {
            try {
                const respuesta = await this.form.post('/imputado');
                try {
                    const response = await this.axios.post('/imputadosExpediente', {
                        id_expediente: this.$route.params.id,
                        id_imputado: respuesta.data.imputado.id + ""
                    });   
                } catch (error) {
                    console.error('Error al enviar los datos:', error);
                }
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Datos guardado con éxito',
                    showConfirmButton: false,
                    timer: 1500,
                    customClass: {
                        popup: 'custom-swal-success',
                    }
                });
                $('#modalAgregarImputado').modal('hide');
                this.obtenerImputados();
                this.actualizarInformacion();
            } catch (error) {
                console.error('Error al guardar el imputado:', error);
            }
        },

        async editarUsuario() {
            await this.form.put('/imputado/' + this.form.id, this.form).then((response) => {
                this.obtenerImputados();
                this.actualizarInformacion();
                $('#modalAgregarImputado').modal('hide');
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: response.data.mensaje,
                    showConfirmButton: false,
                    timer: 1500,
                    customClass: {
                        popup: 'custom-swal-success',
                    }
                })
            }).catch(error => {
                console.log(error);
            });
        },

        async actualizarUsuario(usuario) {
            await this.seleccionarEstado(usuario.id_pais);
            await this.seleccionarMunicipio( usuario.id_estado);
            this.form.reset();
            this.form.clear();
            this.form.fill(usuario);
            this.actualizarUsuarioCheck = true;
            $('#modalAgregarImputado').modal('show');
        },

        eliminarUsuario($imputado) {


            const id_expediente =  this.$route.params.id ;
            const id_imputado = $imputado.id;

            Swal.fire({
                title: '¿Está seguro de eliminar este imputado del expediente?',
                showDenyButton: true,
                icon: 'question',
                confirmButtonText: 'Aceptar',
                denyButtonText: `Cancelar`,
                confirmButtonColor: 'LightSeaGreen',
                cancelButtonColor: 'Crimson',
            }).then((result) => {
                if (result.isConfirmed) {

                    const route = '/imputadosPorExpediente/eliminar/'+ id_expediente + '/' + id_imputado + '/';
                    this.axios.get(route).then((response) => {
                       
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Imputado eliminado con éxito',
                            showConfirmButton: false,
                            timer: 1500
                        });
                        $('#modalAgregarPeticionario').modal('hide');
                        this.obtenerImputados();
                        this.actualizarInformacion();
                    }).catch(error => {
                        console.log(error);
                    });
                } else if (result.isDenied) {
                    Swal.fire('Cambios no realizados', '', 'info')
                }
            })
        }
    }
}
</script>
<style>
    
    
      .btn-group {
        gap: 0.5rem;
    }

    </style>

    