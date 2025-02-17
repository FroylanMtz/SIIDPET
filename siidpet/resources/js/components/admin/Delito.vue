<template>
<!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Delitos</h1>
                </div><!-- /.col -->
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#"> Datos Sistema Acusatorio</a></li>
                        <li class="breadcrumb-item active"> Delitos </li>
                    </ol>
                </div>  
            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                         <h3 class="card-title mt-2"> Registro de delitos </h3>  
                        <div class="card-tools">
                            <button class="btn btn-success" data-toggle="modal" data-target="#modalAgregar"
                                @click="abrirModalRegistro">
                                <i class="fa-solid fa-circle-plus"></i> Nuevo
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
                                                <option value="nombre">Nombre</option>
                                                
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
                                    <button class="btn btn-warning btn-sm mt-2 mb-2 mr-1" v-if= "item.activo===1" @click="actualizarRegistro(item)">
                                        <i class="fa-solid fa-pen-to-square"></i>
                                    </button>

                                    <button class="btn btn-danger btn-sm mt-2 mb-2 mr-1 " v-if= "item.activo===1" @click="desactivar(item)">
                                        <i class="fa-solid fa-power-off"></i>
                                    </button>

                                    <button class="btn btn-success btn-sm mt-2 mb-2 mr-1 " v-if= "item.activo===0" @click="activar(item)">
                                        <i class="fa-solid fa-power-off"></i>
                                    </button>
                                    
                                </div>
                            </template>
                        </EasyDataTable>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modalAgregar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form
                    @submit.prevent="actualizarCheck === false ? registrarJuez : actualizarRegistro" @keydown="form.onKeydown($event)">
                        <div class="modal-header">
                            <h5 v-if="!actualizarCheck" class="modal-title" id="modalAgregar"> Nuevo </h5>
                            <h5 v-else class="modal-title" id="modalAgregar"> Actualizar Juez </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="Nombre">Nombre</label>
                                <input v-model="form.nombre" type="text" class="form-control" id="nombre"
                                    aria-describedby="emailHelp" placeholder="Nombre">
                                <div style="color: red;" v-if="form.errors.has('nombre')" v-html="form.errors.get('nombre')" />
                            </div>
                            <input id="activo" name="activo" type="hidden" value="1" />

                            </div>     

                 
                            
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">
                                <i class="fas fa-times"></i> Cancelar
                            </button>

                            <button  v-if="!actualizarCheck" type="submit" :disabled="form.busy" class="btn btn-primary" @click="registrar">
                                <i class="fas fa-save"></i> Registrar
                            </button>
                            <button v-else type="submit" :disabled="form.busy" class="btn btn-warning" @click="editarRegistro">
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
            actualizarCheck: ref(false),
            searchField: ref("nombre"),
           // searchValue: ref(""),
            themeColor: "#AB0033",
            datos: [
                { text: "Nombre", value: "nombre" },
                { text: "Opciones", value: "operation" }
            ],
            items: [],
            municipios: [],
            form: new Form({
                id: '',
                nombre: '',
                //id_municipio:"",
                activo:1,
            })
        }
    },
    mounted() {
        this.obtenerDatos();

    },
    methods: {
        abrirModalRegistro() {
            this.actualizarCheck = false;
            this.form.reset();
            this.form.clear();
        },

        obtenerDatos() {
            this.items = [];
            this.axios.get('/delito').then( (response) => {
                for (let i = 0; i < response.data.length; i++) {
                    let element = response.data[i];
                    this.items.push( element );
                }
            })
        },
 
 
        async registrar() {

            await this.form.post('/delito').then((response) => {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Delito guardado con éxito',
                    showConfirmButton: false,
                    timer: 1500
                }) 
                console.log("entra")
                 console.log(response.data)
                 console.log("entra")
               // this.obtenerDatos();

                $('#modalAgregar').modal('hide');

            }).catch(error => {
                console.log(error);

            });

            
        },
        async actualizarRegistro(juez) {
            $('#modalAgregar').modal('show');
            console.log(juez);
            this.form.fill(juez);
            this.actualizarCheck = true;
        },
        async editarRegistro() {
            console.log("se va a mandar");
            console.log(this.id);
            await this.form.put('/delito/' + this.form.id, this.form).then((response) => {
                console.log(response);
                this.obtenerDatos();
                $('#modalAgregar').modal('hide');

                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Juez actualizado con éxito',
                    showConfirmButton: false,
                    timer: 1500
                })
            }).catch(error => {
                console.log(error);
            });
        },

        desactivar($juez) {
       
            Swal.fire({
                title: '¿Está seguro de desactivar este Registro??',
                showDenyButton: true,
                confirmButtonText: 'Aceptar',
                denyButtonText: `Cancelar`,
            }).then((result) => {
                if (result.isConfirmed) {
                    this.axios.delete('/delito/' + $juez.id).then((response) => {
                        console.log("Respuesta de la eliminacion");
                        console.log(response);
                        this.obtenerDatos();
                        $('#modalAgregar').modal('hide');

                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: 'Registro eliminado con éxito',
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

        },
        activar($elemento) {
       
            Swal.fire({
                title: '¿Está seguro de activar este Registro?',
                showDenyButton: true,
                confirmButtonText: 'Aceptar',
                denyButtonText: `Cancelar`,
            }).then((result) => {
                if (result.isConfirmed) {
                    this.axios.get('/delito/'+ $elemento.id+"/edit").then((response) => {
                        console.log("Respuesta de la activacion");
                        console.log(response);
                        this.obtenerDatos();
                        $('#modalAgregar').modal('hide');

                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: 'Registro activado con éxito',
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
