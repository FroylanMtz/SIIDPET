<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Usuarios</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                        <li class="breadcrumb-item active"> Usuarios </li>
                    </ol>
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
                        <h3 class="card-title mt-2">Registro de usuarios </h3>
                        <div class="card-tools">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#modalAgregarUsuario"
                                @click="abrirModalRegistro">
                                <i class="fas fa-user-plus"></i> Agregar
                            </button>
                        </div>
                    </div>
                    <div class="card-body ">
                        <div class="row">
                            <p>
                                <a class="text-right" data-toggle="collapse" href="#collapseExample" role="button"
                                    aria-expanded="false" aria-controls="collapseExample">
                                    <i class="fa-solid fa-magnifying-glass"></i>
                                    Busqueda
                                </a>
                            </p>
                            <div class="collapse" id="collapseExample">
                                <div class="card card-body">

                                    <div class="row">

                                        <div class="col-6 ">
                                            <span class="">Campo de busqueda: </span>
                                            <select class="custom-select " v-model="searchField">
                                                <option value="name">Nombre</option>
                                                <option value="email">Correo</option>
                                            </select>
                                        </div>
                                        <div class="col-6">
                                            <span class=""> Valor: </span>
                                            <input class="form-control  border-width-2 mr-2" v-model="searchValue"
                                                placeholder="Nombre" type="search" />
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                        <EasyDataTable buttons-pagination :headers="datos" :items="items" :theme-color="themeColor"
                            :search-field="searchField" :search-value="searchValue">

                            <template #item-operation="item">
                                <div class="operation-wrapper">
                                    <button class="btn btn-warning btn-sm mt-2 mb-2 mr-1" @click="actualizarUsuario(item)">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>

                                    <button class="btn btn-danger btn-sm mt-2 mb-2 mr-1" @click="eliminarUsuario(item)">
                                        <i class="fa-solid fa-trash"></i>
                                    </button>
                                </div>
                            </template>

                        </EasyDataTable>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalAgregarUsuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form 
                    @submit.prevent="actualizarUsuarioCheck === false ? registrarUsuario : actualizarUsuario" @keydown="form.onKeydown($event)">
                        <div class="modal-header">
                            <h5 v-if="!actualizarUsuarioCheck" class="modal-title" id="modalAgregarUsuario"> Agregar usuario </h5>
                            <h5 v-else class="modal-title" id="modalAgregarUsuario"> Actualizar usuario </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="Nombre del usuario">Nombre</label>
                                <input v-model="form.name" type="text" class="form-control" id="nombre"
                                    aria-describedby="emailHelp" placeholder="Juan Pérez">

                                <div style="color: red;" v-if="form.errors.has('name')" v-html="form.errors.get('name')" />

                            </div>
                            <div class="form-group">
                                <label for="Correo del usuario">Correo</label>
                                <input v-model="form.email" type="text" class="form-control" id="correo"
                                    placeholder="algo@correo.com">

                                <div style="color: red;" v-if="form.errors.has('email')"
                                    v-html="form.errors.get('email')" />

                            </div>

                            <div class="form-group">
                                <label for="Contraseña del usuario">Contraseña</label> <span  v-if="actualizarUsuarioCheck" style="color: red;"> *  </span>
                                <input v-model="form.password" type="password" class="form-control" id="contrasena"
                                    placeholder="Ingrese contraseña">
                                <div style="color: red;" v-if="form.errors.has('password')"
                                    v-html="form.errors.get('password')" />
                            </div>
                            

                            <div class="form-group">
                                <label for="Contraseña del usuario">Rol:</label>
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

                            <span  v-if="actualizarUsuarioCheck" style="color: red;"> * Solo llene si desea cambiar la contraseña </span>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                <i class="fas fa-times"></i> Cancelar
                            </button>

                            <button  v-if="!actualizarUsuarioCheck" type="submit" :disabled="form.busy" class="btn btn-primary" @click="registrarUsuario">
                                <i class="fas fa-save"></i> Registrar
                            </button> 
                            <button v-else type="submit" :disabled="form.busy" class="btn btn-warning" @click="editarUsuario">
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
            actualizarUsuarioCheck: ref(false),
            searchField: ref("name"),
            searchValue: ref(""),
            themeColor: "#AB0033",
            datos: [
                { text: "Nombre", value: "name" },
                { text: "Correo", value: "email" },
                { text: "Rol", value: "rol" },
                { text: "Opciones", value: "operation" }
            ],
            items: [],
            form: new Form({
                id: '',
                name: '',
                email: '',
                password: '',
                remember_token: '',
                email_verified_at: '',
                created_at: '',
                updated_at: '',
                IDRol: '',
            })
        }
    },
    mounted() {
        this.obtenerUsuarios();
    },
    methods: {
        abrirModalRegistro() {
            this.actualizarUsuarioCheck = false;
            this.form.reset();
            this.form.clear();
        },

        obtenerUsuarios() {
            this.items = [];
            this.axios.get('/users').then( (response) => {
                let usuarios = [];
                for (let i = 0; i < response.data.length; i++) {
                    let element = response.data[i];
                    element.rol = this.roles[ element.IDRol - 1 ]
                    console.log("usuario "+i + " : ");
                    console.log(element);
                    this.items.push( element );
                }
            })
        },

        async registrarUsuario() {

            await this.form.post('/users').then((response) => {
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Usuario guardado con éxito',
                    showConfirmButton: false,
                    timer: 1500
                }) 
                this.obtenerUsuarios();

                $('#modalAgregarUsuario').modal('hide');

            }).catch(error => {
                console.log(error);

            });

            
        },
        async editarUsuario() {
            console.log("Actualizar peticionario");
            await this.form.put('/users/' + this.form.id, this.form).then((response) => {
                console.log(response);
                this.obtenerUsuarios();
                $('#modalAgregarUsuario').modal('hide');

                Swal.fire({ 
                    position: 'top-end',
                    icon: 'success',
                    title: 'Usuario actualizado con éxito',
                    showConfirmButton: false,
                    timer: 1500
                }) 
            }).catch(error => {
                console.log(error);
            });
        },
        async actualizarUsuario(usuario) {
            $('#modalAgregarUsuario').modal('show');
            this.form.fill(usuario);
            this.actualizarUsuarioCheck = true;
            this.form.password = "";
        },
        eliminarUsuario($usuario) {

            Swal.fire({
                title: '¿Está seguro de eliminar este usuario?',
                showDenyButton: true,
                confirmButtonText: 'Aceptar',
                denyButtonText: `Cancelar`,
            }).then((result) => {
                if (result.isConfirmed) {
                    this.axios.get('/users/eliminar/' + $usuario.id).then((response) => {
                        console.log("Respuesta de la eliminacion");
                        console.log(response);
                        this.obtenerUsuarios();
                        $('#modalAgregarPeticionario').modal('hide');

                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Usuario eliminado con éxito',
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
