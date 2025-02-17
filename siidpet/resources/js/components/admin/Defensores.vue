<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Usuarios</h1>
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="card-tools">
                            <button class="btn btn-success" data-toggle="modal" data-target="#modalAgregarDefensor"
                                @click="abrirModalRegistro">
                                <i class="fa-solid fa-circle-plus"></i> Registrar usuarios
                            </button>
                        </div>
                    </div>
                    <div class="card-body ">
                        <div class="row">
                            <p>
                                <a class="text-right" data-toggle="collapse" href="#collapseExample" role="button"
                                    aria-expanded="false" aria-controls="collapseExample">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                    Buscar
                                </a>
                            </p>
                            <div class="collapse" id="collapseExample">
                                <div class="card card-body">
                                    <div class="row">
                                        <div class="col-6 ">
                                            <span class="">Buscar por: </span>
                                            <select class="custom-select " v-model="searchField">
                                                <option value="nombres">Nombres</option>
                                                <option value="apellido_paterno">Apellido Paterno</option>
                                                <option value="apellido_materno">Apellido Materno</option>
                                            </select>
                                        </div>
                                        <div class="col-6">
                                            <span class=""> Dato: </span>
                                            <input class="form-control  border-width-2 mr-2" v-model="searchValue"
                                                :placeholder=searchField type="search" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <EasyDataTable buttons-pagination :headers="datos" :items="items" :theme-color="themeColor"
                            :search-field="searchField" :search-value="searchValue">
                            <template #item-operation="item">
                                <div class="operation-wrapper">
                                    <button class="btn btn-warning btn-sm mt-2 mb-2 mr-1" @click="actualizarDefensor(item)">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>

                                    <button class="btn btn-danger btn-sm mt-2 mb-2 mr-1 " v-if= "item.activo===1" @click="desactivarUsuario(item)">
                                        <i class="fa-solid fa-power-off"></i>
                                    </button>

                                    <button class="btn btn-success btn-sm mt-2 mb-2 mr-1 " v-if= "item.activo===0" @click="desactivarUsuario(item)">
                                        <i class="fa-solid fa-power-off"></i>
                                    </button>


                                </div>
                            </template>
                        </EasyDataTable>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalAgregarDefensor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form
                    @submit.prevent="actualizarDefensorCheck === false ? registrarDefensor : actualizarDefensor" @keydown="form.onKeydown($event)">
                        <div class="modal-header">
                            <h5 v-if="!actualizarDefensorCheck" class="modal-title" id="modalAgregarDefensor"> Nuevo </h5>
                            <h5 v-else class="modal-title" id="modalAgregarDefensor"> Actualizar usuario </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="name">Nombres</label>
                                    <input v-model="form.name" type="text" class="form-control" id="name"
                                        aria-describedby="emailHelp" placeholder="Nombres">
                                    <div style="color: red;" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="fathername">Apellido Paterno</label>
                                    <input v-model="form.fathername" type="text" class="form-control" id="fathername"
                                        placeholder="Apellido Paterno">

                                    <div style="color: red;" v-if="form.errors.has('fathername')"
                                        v-html="form.errors.get('fathername')" />
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="mothername">Apellido Materno</label> 
                                    <input v-model="form.mothername" type="text" class="form-control" id="mothername"
                                        placeholder="Apellido Materno">
                                    <div style="color: red;" v-if="form.errors.has('mothername')"
                                        v-html="form.errors.get('mothername')" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="phone">Telefono</label>
                                    <input type="number" pattern="\d{12}" maxlength="12" v-model="form.phone"  class="form-control" id="phone"
                                        placeholder="8341234567">
                                    <div style="color: red;" v-if="form.errors.has('phone')"
                                        v-html="form.errors.get('phone')" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">Correo</label> 
                                    <input v-model="form.email" type="text" class="form-control" id="email"
                                        placeholder="ejemplo@ejemplo.com">
                                    <div style="color: red;" v-if="form.errors.has('email')"
                                        v-html="form.errors.get('email')" />
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="Sexo">Sexo</label>
                                    <select v-model="form.gender" id="gender" type="text" class="form-control " name="gender">
                                        <option value="Masculino">
                                        Masculino
                                        </option>
                                        <option value="Femenino">
                                            Femenino
                                        </option>
                                    </select>
                                    <div style="color: red;" v-if="form.errors.has('gender')"
                                        v-html="form.errors.get('gender')" />
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="Municipio de trabajo">Municipio</label>
                                    <select v-model="defensor.id_municipio" id="rol" type="text" class="form-control " name="id_municipio">
                                        <option v-for="municipio in municipios" :value="municipio.id">
                                            {{ municipio.nombre }}
                                        </option>
                                    </select>
                                    <div style="color: red;" v-if="defensor.errors.has('id_municipio')"
                                        v-html="defensor.errors.get('id_municipio')" />
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="Municipio de trabajo">Coordinación</label>
                                    <select v-model="defensor.id_coordinacion" id="rol" type="text" class="form-control " name="id_municipio">
                                        <option v-for="coordinacion in coordinaciones" :value="coordinacion.id">
                                            {{ coordinacion.nombre }}
                                        </option>
                                    </select>
                                    <div style="color: red;" v-if="defensor.errors.has('id_coordinacion')"
                                        v-html="defensor.errors.get('id_coordinacion')" />
                                </div>

                                

                                <div class="form-group col-md-12">
                                    <label for="Contraseña del usuario">Rol</label>
                                    <select v-model="form.IDRol" id="rol" type="text" class="form-control " name="IDRol">
                                        <option value=""> Seleccione una opcion </option>
                                        <option value="1"> Administrador </option>
                                        <option value="2"> Director General </option>
                                        <option value="3"> Director Defensoria </option>
                                        <option value="4"> Director Asesoria </option>
                                        <option value="5"> Jefe de Asesorias </option>
                                        <option value="6"> Defensor </option>
                                        <option value="7"> Asesor </option>
                                    </select>
                                    <div style="color: red;" v-if="form.errors.has('IDRol')"
                                        v-html="form.errors.get('IDRol')" />
                                </div>
    
    
                                


                                <div class="form-group col-md-12">
                                    <label for="fathername">Contraseña</label>

                                    <span  v-if="actualizarDefensorCheck" style="color: red;"> *  </span>


                                    <input v-model="form.password" type="password" class="form-control" id="password"
                                        placeholder="contraseña">

                                    <div style="color: red;" v-if="form.errors.has('password')"
                                        v-html="form.errors.get('password')" />
                                </div>

                                <span  v-if="actualizarDefensorCheck" style="color: red;"> * Solo llene si desea cambiar la contraseña </span>



                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                <i class="fas fa-times"></i> Cancelar
                            </button>
                            <button  v-if="!actualizarDefensorCheck" type="submit" :disabled="form.busy" class="btn btn-primary" @click="registrarDefensor">
                                <i class="fas fa-save"></i> Registrar
                            </button>
                            <button v-else type="submit" :disabled="form.busy" class="btn btn-warning" @click="editarDefensor">
                                <i class="fas fa-save"></i> Actualizar
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
export default {
    data() {
        return {
            roles: ref(["Administrador", "Director General", "Director Defensoría", "Director Asesorias", "Jefe Asesorias", "Defensor", "Asesor"]),
            actualizarDefensorCheck: ref(false),
            searchField: ref("name"),
            searchValue: ref(""),
            themeColor: "#AB0033",
            datos: [
                { text: "Nombres", value: "user.name" },
                { text: "Apellido Materno", value: "user.fathername" },
                { text: "Apellido Paterno", value: "user.mothername" },
                { text: "Municipio", value: "municipio.nombre"},
                { text: "Sexo", value: "user.gender"},
                { text: "Telefono", value: "user.phone"},
                { text: "Correo", value: "user.email"},
                { text: "Rol", value: "rol"},
                { text: "Opciones", value: "operation" },
            ],
            items: [],
            municipios: [],
            coordinaciones: [],
            form: new Form({
                id: '',
                name: '',
                fathername: '',
                mothername: '',
                phone: '',
                email: '',
                email_verified_at: '',
                password: '',
                IDRol: 6,
                gender: '',
                activo:1,
            }),

            defensor: new Form({
                id: '',
                id_usuario: '',
                id_municipio: '',
                id_coordinacion: '',
                sexo: '',
                activo: 1,
            })
        }
    },
    mounted() {
        this.obtenerDefensores();
        this.obtenerMunicipios();
        this.obtenerCoordinaciones();
    },
    methods: {
        resetearFormulario(){
            this.form.reset();
            this.form.clear();
            this.defensor.reset();
            this.defensor.clear();
        },
        abrirModalRegistro() {
            this.actualizarDefensorCheck = false;
            this.resetearFormulario();
        },
        obtenerCoordinaciones() {
            this.axios.get('/coordinacion').then((response) => {
                this.coordinaciones = response.data;
            })
        },
        obtenerMunicipios() {
            this.axios.get('/municipios').then((response) => {
                this.municipios = response.data.filter(objeto => objeto.id_estado === 28);
            })
        },

        obtenerDefensores() {
            this.items = [];
            this.axios.get('/defensor').then( (response) => {
                // this.items = response.data;
                for (let i = 0; i < response.data.length; i++) {
                    let element = response.data[i];
                    element.rol = this.roles[ element.user.IDRol - 1 ];
                    this.items.push( element );

                    console.log(element);
                }
            })
        },

        async registrarDefensor() {
            this.defensor.errors.clear();
            if( this.defensor.id_coordinacion === null || this.defensor.id_coordinacion === "" ){
                this.defensor.errors.set('id_coordinacion', 'Este campo es requerido');
                return
            }

            if( this.defensor.id_municipio === null || this.defensor.id_municipio === "" ){
                this.defensor.errors.set('id_municipio', 'Este campo es requerido');
                return
            }
            
            await this.form.post('/users').then( async (response) =>  {
                
                this.defensor.id_usuario = response.data.defensor;
                try {
                    await this.defensor.post('/defensor').then((response) => {
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: response.data.mensaje,
                            showConfirmButton: false,
                            timer: 1500
                        })
                    });
                } catch (error) {
                    console.error('Error al enviar los datos:', error);
                }
                this.obtenerDefensores();                
                $('#modalAgregarDefensor').modal('hide');

            }).catch(error => {
                console.log(error);
            });
        

        },
        async editarDefensor() {

            try{
                await this.defensor.put('/defensor/' + this.defensor.id).then((response) => { 
                }).catch(error => {
                    console.log(error);
                });

                await this.form.put('/users/' + this.form.id).then((response) => { 
                }).catch(error => {
                    console.log(error);
                });
                
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Defensor actualizado con éxito',
                    showConfirmButton: false,
                    timer: 1500
                })
                
                this.obtenerDefensores();
                $('#modalAgregarDefensor').modal('hide');
            }catch (error) {
                console.error('Error al guardar el imputado:', error);
            }
        },
        async actualizarDefensor(defensor) {           
            this.form.fill(defensor.user);
            this.defensor.fill(defensor);
            $('#modalAgregarDefensor').modal('show');
            this.actualizarDefensorCheck = true;
        },
        desactivarUsuario($usuario) {
            
            
            Swal.fire({
                title: '¿Está seguro de eliminar este usuario?',
                showDenyButton: true,
                confirmButtonText: 'Aceptar',
                denyButtonText: `Cancelar`,
            }).then((result) => {

                if (result.isConfirmed) {
                    
                    this.axios.delete('/defensor/' + $usuario.id).then((response) => {
                        this.obtenerDefensores();
                        $('#modalAgregarPeticionario').modal('hide');
                        Swal.fire({ 
                            position: 'top-end',
                            icon: 'success',
                            title: response.data.mensaje,
                            showConfirmButton: false,
                            timer: 1500
                        })
                    }).catch(error => {
                        console.log(error);
                    });

                } else if (result.isDenied) {
                    //Swal.fire('Changes are not saved', '', 'info')
                }
            })
            

        }
    }
}
</script>
