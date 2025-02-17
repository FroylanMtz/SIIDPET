<!DOCTYPE html>
<html lang="en">
<!--HEAD -->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!-- <title>{{ config('app.name', 'Laravel') }}</title> -->
    <title> Sistema Inegral del Instituto de Defensoría Pública del Estado de Tamaulipas </title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.bunny.net/css?family=Nunito" rel="stylesheet">

    <!-- Animate -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">

    <!-- Scripts -->
    @vite(['resources/sass/app.scss', 'resources/js/app.js'])

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ asset('plugins/fontawesome-free/css/all.min.css')}}">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="{{ asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ asset('css/adminlte.min.css') }}">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <link href=' http://fonts.googleapis.com/css?family=Encode+Sans' rel='stylesheet' type='text/css'>

    <style>
body {
    font-family: 'Encode Sans', serif;
    background-image: url('img/background.png');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    /* Ajustar el fondo al tamaño de la ventana del navegador */
    height: 100vh;
    margin: 0; /* Eliminar margen para que el fondo cubra completamente */
    padding: 0; /* Eliminar padding para que el fondo cubra completamente */
  }

  .btn-primary {
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease-in-out;
    background-color: transparent;
    border: none;
    color: white;
    font-size: 16px;
    cursor: pointer;
  }


      .btn-guindo {
    background-color: #841D39; /* Color guindo */
    color: white; /* Color del texto */
    /* Otras propiedades de estilo si es necesario */
}

    </style>

</head>
   <!--BODY -->
<body class="hold-transition login-page" >
    <!-- ANIMATE -->
<div class="login-form animate__animated animate__fadeInDown">
<div class="login-box" style="width: 30rem;">
<div class="login-logo mt-5 ">
    
    <div class="row">
        <div class="col-6">
            <img src="{{ asset('img/logoTam.png') }}" class="rounded mx-auto d-block" width="100" height="100"  alt="Logo tam" >
        </div>
        <div class="col-6 mt-4">
            <img src="{{ asset('img/logoIDPET.PNG') }}" class="rounded mx-auto d-block" width="200" height="50"  alt="Logo tam" >
        </div>
    </div>


    
    

</div>
  <!-- /.login-logo -->
  <div class="card" style="background-color: white; border: none; border-radius: 10px;">

   <!-- /. forma -->
  <div class="animation-container">
  <div class="lightning-container">
  <div class="lightning"></div>
  <div class="lightning red"></div>
  </div>
  </div>
  
  <h5 class="mx-2 mt-4" style="text-align: center;">
    Sistema Inegral del Instituto de Defensoría Pública del Estado de Tamaulipas
  </h5>
  <div class="card-body login-card-body" style="background-color: transparent; border: none; border-radius: 10px;" >


      <p class="login-box-msg"> <b> Iniciar sesión </b> </p>

      <form method="POST" action="{{ route('login') }}">
        @csrf
        <div class="row mb-3">
            <label for="email" class="col-md-4 col-form-label text-md-end"> Correo: </label>
            <div class="col-md-8">
                <input placeholder="algo@tamaulipas.gob.mx" id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                @error('email')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
        </div>
        <div class="row mb-3">
            <label for="password" class="col-md-4 col-form-label text-md-end"> Contraseña: </label>

            <div class="col-md-8">
                <input id="password" placeholder="Contraseña" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                @error('password')
                    <span class="invalid-feedback" role="alert">
                        <strong>{{ $message }}</strong>
                    </span>
                @enderror
            </div>
        </div>
        <div class="row mb-0">
            <div class="col-md-8 offset-md-4">
                <button type="submit" class="btn btn-guindo">
                    Iniciar sesión
                </button>
            </div>
        </div>
    </form>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->
<!-- jQuery -->
<script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
<!-- Bootstrap 4 -->
<script
