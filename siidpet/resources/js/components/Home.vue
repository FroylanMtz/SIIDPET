<template>
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="d-flex justify-content-between align-items-center ">
          <h1 class="h4">Inicio</h1>
      </div>
  </div>
    <!-- /.content-header -->
    <div class="container">
        
        
        <div class="row">
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h1> {{ this.totalExpediente }} </h1>

                <p> Expedientes </p>
              </div>
              <div class="icon">
                <i class="ion-ios-book"></i>
              </div>
              
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h1> {{ this.totalUsuarios }} </h1>

                <p>Usuarios</p>
              </div>
              <div class="icon">
                <i class="ion-ios-people"></i>
              </div>
              
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h1> {{ this.totalImputados }} </h1>

                <p>Imputados</p>
              </div>
              <div class="icon">
                <i class="ion-ios-person"></i>
              </div>
              
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h1> {{ this.totalDefensores }} </h1>

                <p>Defensores</p>
              </div>
              <div class="icon">
                <i class="ion-android-people"></i>
              </div>
              
            </div>
          </div>
          <!-- ./col -->
        </div>

        <div class="row">
            <div class="card">
                <div class="card-body">
                    <div class="tab-content p-0">
                    
                      <ChartComponent></ChartComponent>

                    </div>
                </div><!-- /.card-body -->

            </div>
        </div>

        
    </div>
</template>

<script>
import ChartComponent from './CmpTestChart.vue';

export default {
    components: {
      ChartComponent
    },
    name: 'HelloWorld',
    data() {
        return {
            yourName: '',
            visible: false,
            totalExpediente: 0,
            totalImputados: 0,
            totalDefensores: 0,
            totalUsuarios: 0,
            nombres: '',
        };
    },
    methods: {
        decodeHTML(texto) {
          const textArea = document.createElement('textarea');
          textArea.innerHTML = texto;
          return textArea.value;
        },
        onClick() {
            this.visible = true;
        },
        modalClosed() {
            this.visible = false;
        },
    },
    async created() {
      
      const user = window.usuario;
      const textoDecodificado = this.decodeHTML(user);
      this.nombres = JSON.parse(textoDecodificado).name ;
      console.log( JSON.parse(textoDecodificado) );
      // alert( window.usuario );
      // alert( JSON.parse(textoDecodificado).name  );
      try {
          const expedientes = await this.axios.get('/expediente');
          this.totalExpediente = expedientes.data.length;
          const usuarios = await this.axios.get('/users');
          this.totalUsuarios = usuarios.data.length;
          const imputados = await this.axios.get('/imputado');
          this.totalImputados = imputados.data.length;
          const defensores = await this.axios.get('/defensor');
          this.totalDefensores = defensores.data.length;
      } catch (error) {
          console.error('Error obteniendo los delitos:', error);
      }
    }
};
</script>

<style>
.sample {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    max-width: 600px;
    margin: 5% auto;
}

.cv-text-input {
    margin: 30px 0;
}
</style>