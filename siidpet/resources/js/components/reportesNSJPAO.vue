<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Reportes NSJPAO</h1>
                </div><!-- /.col -->
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/reportesNSJPAO#">Reportes NSJPAO</a></li>
           
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
                    <div class="card-header border-0">
                        <h3 class="card-title">Reportes NSJPAO </h3>
                        <div class="card-tools">
                            <a href="#" class="btn btn-tool btn-sm">
                                <i class="fas fa-download"></i>
                            </a>
                            <a href="#" class="btn btn-tool btn-sm">
                                <i class="fas fa-bars"></i>
                            </a>
                          
                    </div>
                </div>
                <div class="card-body table-responsive p-0">
                    
                     
                </div>
            </div>
        </div>
    </div>

 

    <div class="modal fade" id="modalAgregarUsuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <form @submit.prevent="registrarNuc" @keydown="form2.onKeydown($event)">
                        <div class="modal-header">
                            <h5 class="modal-title" id="modalAgregarUsuario"> Agregar NUC </h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            
                                    
                                <div class="form-group">
                                    <label for="Nombre del usuario">Número</label>
                                    <input v-model="form2.NUC"  type="text" class="form-control" id="NUC"
                                        aria-describedby="emailHelp" placeholder="123456">

                                    <div style="color: red;" v-if="form2.errors.has('NUC')" v-html="form2.errors.get('NUC')" />
                                    
                                </div>
                                <div class="form-group">
                                    <label for="Correo del usuario">Delito</label>
                                    <select  v-model="form2.delito" type="text" class="form-control" id="correo">
                                        <option value="1">Value 1</option>
                                        <option value="2" selected>Value 2</option>
                                        <option value="3">Value 3</option>
                                    </select>
                                    <div style="color: red;" v-if="form2.errors.has('delito')" v-html="form2.errors.get('delito')" />
                                </div>

                                <div class="form-group">
                                    <label for="Correo del usuario">Fecha</label>
                                    <input v-model="form2.fechaRegistro" type="date" class="form-control" id="fechaRegistro">

                                    <div style="color: red;" v-if="form2.errors.has('fechaRegistro')" v-html="form2.errors.get('fechaRegistro')" />
                                </div>                           
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal"> 
                                <i class="fas fa-times"></i> Cancelar
                            </button>
                            <button type="submit" :disabled="form2.busy" class="btn btn-primary">
                                <i class="fas fa-save"></i> Registrar
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
import type { Header, Item,ClickRowArgument  } from "vue3-easy-data-table";
import Form from 'vform'


export default {

    data(){
        return {
            searchField:ref("name"),
            searchValue: ref(""),
            themeColor: "#AB0033",
            headers: [
                { text: "NUC", value: "NUC" },
                { text: "Delitos", value: "delito" },
                { text: "Fecha", value: "fechaRegistro" },
                { text: "Estado", value: "estado"  },
                { text: "Acciones", value: "operation"}
            ],
            items: [],
            form2: new Form({
                id: '',
                NUC: '',
                delito: '',
                fechaRegistro: '',
            })
        }
    },
    mounted() {
        this.getList();
    },
    methods: {
        abrirModalRegistro() {
            console.log("Se ha abierto el modal");
            this.form2.reset();
            this.form2.clear();
        },
       getList() { 
            this.axios.get('/NUCs').then((response) => {
                this.items = response.data;
                console.log(response);
            })
        }, 
        eliminar(item) {
             console.log(item.id)
             this.axios.delete('/NUCs/'+item.id).then((response) => {
                 
                console.log(response);
                this.getList();
            })
        }, 
 
        ver(item) {
            window.location.href = "nuc/ver/"+item.NUC;
           
       }, 

        async registrarNuc () {

            await this.form2.post('NUCs').then((response) => {
                console.log(response);
            }).catch(error => {
                console.log(error);
            })
            this.getList();
        }
    }
}
</script>
