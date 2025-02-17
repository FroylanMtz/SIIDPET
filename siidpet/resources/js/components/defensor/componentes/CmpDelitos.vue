<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 class="m-0">Delitos</h5>
                </div><!-- /.col -->
            </div><!-- /.row -->
            <small class="text-muted"> Por favor selecciona un delito de la lista. Si el delito no existe por favor notifica al administrador del sistema</small>
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    <div class="container">
        
        <div class="form-group">
            <div class="row">
                <div class="col-6">
                    
                    <v-select v-model="form.id_delito" :reduce="(option) => option.id"
                        :options="delitosOpciones"
                            @update:model-value="seleccionarDelito()"
                        >
                    </v-select>
                    <div style="color: red;" v-if="form.errors.has('id_delito')"
                        v-html="form.errors.get('id_delito')" />
                </div>
                <div class="col-6">
                    <button class="btn btn-primary w-100 " @click="registrarDelito">
                        <i class="fa-regular fa-square-check"></i>
                        Agregar
                    </button>
                </div>
            </div>
        </div>
        <EasyDataTable border-cell  :headers="datos" :items="items" >
            <template #item-operation="item">
                <div class="operation-wrapper">
                    <button class="btn btn-danger btn-sm mt-2 mb-2 mr-1" @click="eliminarDelito(item)">
                        <i class="fa-solid fa-trash"></i>
                    </button>
                </div>
            </template>
        </EasyDataTable>
            
    </div>
</template>

<script lang="ts">
import { ref } from "vue";
import Form from 'vform'
import Swal from 'sweetalert2'

export default {
    data() {
        return {
            datos: [
                { text: "Delito", value: "nombre" },
                { text: "Opciones", value: "operation" }
            ],
            items: ref([]),
            form: new Form({
                id: '',
                id_expediente: '',
                id_delito: '',
            }),
            delitosOpciones: ref([]),
        }
    },
    mounted() {
        this.items = [];
        this.obtenerDelitos();
        this.obtenerDelitosExpediente();
    },
    methods: {
        actualizarInformacion(){
            this.$emit('llamar-funcion');
        },

        async obtenerDelitos() {
            try {
                const response = await this.axios.get('/delito');
                this.delitosOpciones = response.data.map(delito => ({
                    id: delito.id,
                    label: delito.nombre
                }));
            } catch (error) {
                console.error('Error obteniendo las opciones delitos:', error);
            }
        },
        async obtenerDelitosExpediente() {
            try {
                const response = await this.axios.get('/delitosPorExpediente/' + this.$route.params.id );
                this.items = response.data;
                
            } catch (error) {
                console.error('Error obteniendo los delitos:', error);
            }
        },
        async registrarDelito() {
            if( !(this.form.id_delito === '' || this.form.id_delito === 0 || this.form.id_delito === null ) ){
                try {
                    this.form.id_expediente = this.$route.params.id;
                    await this.form.post('/expedientedelito');
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Delito guardado con éxito',
                        showConfirmButton: false,
                        timer: 1500,
                        customClass: {
                            popup: 'custom-swal-success',
                        }
                    });
                    this.obtenerDelitosExpediente();
                    this.actualizarInformacion();
                } catch (error) {
                    Swal.fire({
                        title: 'Error al guardar',
                        text: 'El delito ya existe en este expediente. Elija otro por favor',
                        confirmButtonText: 'Aceptar',
                        customClass: {
                            popup: 'custom-swal-size',
                        }
                    }); 
                }
            }else{
                this.form.errors.set('id_delito', 'Este campo es requerido');
            }
        },
        seleccionarDelito(){
            this.form.errors.clear();
        },
        eliminarDelito(delito) {
            Swal.fire({
                title: 'Confirmar',
                text: '¿Está seguro de eliminar este delito del expediente?',
                showDenyButton: true,
                confirmButtonText: 'Aceptar',
                denyButtonText: `Cancelar`,
                confirmButtonColor: 'LightSeaGreen',
                cancelButtonColor: 'Crimson',
                customClass: {
                    popup: 'custom-swal-size',
                    actions: 'my-actions',
                    confirmButton: 'order-2',  // Cambiar el orden si lo deseas
                    cancelButton: 'order-1',   // Cambiar el orden si lo deseas
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    this.axios.delete('/eliminarDelito/' + delito.id_expediente + '/' + delito.id_delito).then((response) => {
                        this.obtenerDelitosExpediente();
                        Swal.fire({
                            position: 'top-end',
                            icon: 'success',
                            title: 'Delito eliminado con éxito',
                            showConfirmButton: false,
                            timer: 1500,
                            customClass: {
                                popup: 'custom-swal-success',
                            }
                        })
                    }).catch(error => {
                        console.log(error);
                    });
                } else if (result.isDenied) {
                    Swal.fire({
                        title: 'Cambios no realizados', 
                        text: '',
                        icon: 'info',
                        customClass: {
                            popup: 'custom-swal-size',
                        }
                    })
                }
            })
        }
    }
}
</script>
<style>

    .customize-table {
        border-radius: 10px;
        overflow: hidden;
    }

    .swal2-popup {
        font-size: 17px !important;
        font-family: 'Encode Sans', serif;
    }
    .custom-swal-size {
        width: 400px;  /* Change the width */
        height: 300px; /* Change the height */
    }
    .custom-swal-success {
        width: 300px;  /* Change the width */
        height: 260px; /* Change the height */
    }
    .my-actions {
        display: flex;
        justify-content: flex-end; /* Alinear botones a la derecha */
    }
    .custom-confirm-button {
        padding: 15px 40px; /* Cambia el tamaño del botón "Aceptar" */
        font-size: 10px;
    }

    .custom-cancel-button {
        padding: 10px 30px; /* Cambia el tamaño del botón "Cancelar" */
        font-size: 16px;
    }

    .customize-table {
        border-radius: 10px; /* Cambia a la medida deseada */
        overflow: hidden; /* Esto asegura que los bordes de la tabla no sobresalgan */
      }
</style>