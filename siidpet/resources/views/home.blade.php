<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <base href="/">

    <title> SIIDPET </title>
    @vite(['resources/sass/app.scss', 'resources/js/app.js'])

    <!-- Favico -->

    <link rel="icon" type="image/x-icon" href="{{ asset('img/logos/logo_2.png') }}" />
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet"
        href="{{ asset('plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css') }}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{ asset('plugins/icheck-bootstrap/icheck-bootstrap.min.css') }}">
    <!-- JQVMap -->
    <link rel="stylesheet" href="{{ asset('plugins/jqvmap/jqvmap.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('css/adminlte.min.css') }}">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="{{ asset('plugins/overlayScrollbars/css/OverlayScrollbars.min.css') }}">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="{{ asset('plugins/daterangepicker/daterangepicker.css') }}">
    <!-- summernote -->
    <link rel="stylesheet" href="{{ asset('plugins/summernote/summernote-bs4.min.css') }}">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
        integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />


    <link rel="stylesheet" href="{{ asset('plugins/fullcalendar/main.css') }}">
    <link rel="stylesheet" href="{{ asset('css/main.css') }}">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href=' http://fonts.googleapis.com/css?family=Encode+Sans' rel='stylesheet' type='text/css'>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
        rel="stylesheet">

    <style>
        body {
            font-family: 'Encode Sans', serif;
            /* font-family: 'Roboto', serif; */
        }
    </style>

    <script>
        window.rol = "{{ session::get('rol') }}"
        window.usuario = "{{ session::get('user') }}"
        window.id_usuario = "{{ session::get('id_user') }}"
        window.defensor = "{{ session::get('defensor') }}";
    </script>

</head>

<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper" id="app">
        <!-- Barra de Navegación -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i
                            class="fas fa-bars"></i></a>
                </li>
            </ul>
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" data-widget="fullscreen" role="button">
                        <i class="fas fa-expand-arrows-alt"></i>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.navbar -->

        <!-- Main Sidebar Container -->
        <!-- <aside class="main-sidebar sidebar-dark-primary elevation-4" style="background-color: #AB0033"> -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="/" class="brand-link">
                <img src="{{ asset('img/logos/logo_2.png') }}" alt="Logo TAM" class="brand-image ">
                <span class="brand-text font-weight-light"> SIIDPET </span>
            </a>
            <!-- Sidebar -->
            <div class="sidebar">
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel pt-3 pb-3 d-flex">
                    <div class="image mt-2">
                        <img src="{{ asset('img/user2-160x160.jpg') }}" class="img-circle elevation-2"
                            alt="User Image">
                    </div>
                    <div class="info ">
                        <a class="text-wrap" style="font-size: smaller;"> {{ Auth::user()->name }}
                            {{ Auth::user()->fathername }} {{ Auth::user()->mothername }} </a>

                        @switch(Auth::user()->IDRol)
                            @case(1)
                                <a style="font-size: smaller;" class="d-block text-white"> Administrador </a>
                            @break

                            @case(2)
                                <a style="font-size: smaller;" class="d-block text-white"> Director General </a>
                            @break

                            @case(3)
                                <a style="font-size: smaller;" class="d-block text-white"> Director Defensorías </a>
                            @break

                            @case(4)
                                <a style="font-size: smaller;" class="d-block text-white"> Director Asesorías </a>
                            @break

                            @case(5)
                                <a style="font-size: smaller;" class="d-block text-white"> Jefe de Asesorías </a>
                            @break

                            @case(6)
                                <a style="font-size: smaller;" class="d-block text-white"> Defensor </a>
                            @break

                            @case(7)
                                <a style="font-size: smaller;" class="d-block text-white"> Asesor </a>
                            @break

                            @default
                                <a style="font-size: smaller;" class="d-block text-white"> Rol no identificado </a>
                        @endswitch
                    </div>
                </div>
                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">
                        <li class="nav-item">
                            <router-link to="/" class="nav-link" active-class="active">
                                <i class="nav-icon fas fa-solid fa-chart-line"></i>
                                <p>
                                    Resumen
                                </p>
                            </router-link>
                        </li>
                        <li class="nav-item">
                            <router-link to="/expedientes" class="nav-link" active-class="active">
                                <i class="nav-icon fas fa-file"></i>
                                <p>
                                    Expedientes
                                </p>
                            </router-link>
                        </li>
                        <li class="nav-item">
                            <router-link to="/calendario" class="nav-link" active-class="active">
                                <i class="nav-icon fas fa-calendar-days"></i>
                                <p>
                                    Audiencias
                                </p>
                            </router-link>
                        </li>
                        <!-- Catalogo -->
                        @if (session('rol') === '1' || session('rol') === 'administrador')
                            <li class="nav-item ">
                                <a href="#" class="nav-link">
                                    <i class="nav-icon fas fa-database"></i>
                                    <p>
                                        Sistema Acusatorio
                                        <i class="right fas fa-angle-left"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <!-- Catalogo 1 -->
                                    <li class="nav-item">
                                        <router-link to="/Defensores" class="nav-link" active-class="active">

                                            <i class="nav-icon fas fa-users fa-solid"></i>
                                            <p>
                                                Usuarios
                                            </p>
                                        </router-link>
                                    </li>
                                    <!-- Catalogo 2 -->
                                    <li class="nav-item">
                                        <router-link to="/Delito" class="nav-link" active-class="active">

                                            <i class="nav-icon fas fa-handcuffs fa-solid "></i>
                                            <p>
                                                Delito
                                            </p>
                                        </router-link>
                                    </li>
                                    <!-- Catalogo 3 -->
                                    <li class="nav-item">
                                        <router-link to="/Ugi" class="nav-link" active-class="active">

                                            <i class="nav-icon fas fa-table fa-solid"></i>
                                            <p>
                                                UGI
                                            </p>
                                        </router-link>
                                    </li>
                                    <!-- Catalogo 4 -->
                                    <li class="nav-item">
                                        <router-link to="/MedidasProteccion" class="nav-link" active-class="active">

                                            <i class="nav-icon fas fa-table fa-solid"></i>

                                            <p>
                                                Medidas de Protección
                                            </p>
                                        </router-link>
                                    </li>
                                    <!-- Catalogo 5 -->
                                    <li class="nav-item">
                                        <router-link to="/Juez" class="nav-link" active-class="active">

                                            <i class="nav-icon fas fa-gavel fa-solid"></i>
                                            <p>
                                                Juez de Control
                                            </p>
                                        </router-link>
                                    </li>
                                    <!-- Catalogo 6 -->
                                    <li class="nav-item">
                                        <router-link to="/Medidas" class="nav-link" active-class="active">

                                            <i class="nav-icon fas fa-table fa-solid"></i>
                                            <p>
                                                Medida Cautelar
                                            </p>
                                        </router-link>
                                    </li>
                                    <!-- Catalogo 7 -->
                                    <li class="nav-item">
                                        <router-link to="/Tribunal" class="nav-link" active-class="active">

                                            <i class="nav-icon fas fa-table fa-solid"></i>
                                            <p>
                                                T. de Enjuiciamiento
                                            </p>
                                        </router-link>
                                    </li>
                                    <!-- Catalogo 8 -->
                                    <li class="nav-item">
                                        <router-link to="/coordinaciones" class="nav-link" active-class="active">

                                            <i class="nav-icon fas fa-table fa-solid"></i>
                                            <p>
                                                Coordinaciones
                                            </p>
                                        </router-link>
                                    </li>
                                </ul>
                            </li>
                        @endif

                        <!-- Cerrar Sesión -->
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('logout') }}"
                                onclick="event.preventDefault(); document.getElementById('logout-form').submit();">
                                <i class="nav-icon fas fa-solid fa-right-from-bracket"></i>
                                <p>Cerrar sesión</p>
                            </a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                                @csrf
                            </form>
                        </li>
                    </ul>
                </nav>
            </div>
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper pb-3">
            <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- Main row -->
                    <div class="row">
                        <div class="container">
                            <div class="row justify-content-center">
                                <app-component> </app-component>
                            </div>
                        </div>
                    </div>
                    <!-- /.row (main row) -->
                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <footer class="main-footer ">
            <div class="float-right d-none d-sm-inline-block mb-2 mr-3">
                Version 1.0.0
            </div>
        </footer>


    </div>
    <!-- ./wrapper -->

    <!-- jQuery -->
    <script src="{{ asset('plugins/jquery/jquery.min.js') }}"></script>
    <!-- jQuery UI 1.11.4 -->
    <script src="{{ asset('plugins/jquery-ui/jquery-ui.min.js') }}"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 -->
    <script src="{{ asset('plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <!-- ChartJS -->
    <script src="{{ asset('plugins/chart.js/Chart.min.js') }}"></script>
    <!-- Sparkline -->
    <script src="{{ asset('plugins/sparklines/sparkline.js') }}"></script>
    <!-- JQVMap -->
    <script src="{{ asset('plugins/jqvmap/jquery.vmap.min.js') }}"></script>
    <script src="{{ asset('plugins/jqvmap/maps/jquery.vmap.usa.js') }}"></script>
    <!-- jQuery Knob Chart -->
    <script src="{{ asset('plugins/jquery-knob/jquery.knob.min.js') }}"></script>
    <!-- daterangepicker -->
    <script src="{{ asset('plugins/moment/moment.min.js') }}"></script>
    <script src="{{ asset('plugins/daterangepicker/daterangepicker.js') }}"></script>
    <!-- Tempusdominus Bootstrap 4 -->
    <script src="{{ asset('plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js') }}"></script>
    <!-- Summernote -->
    <script src="{{ asset('plugins/summernote/summernote-bs4.min.js') }} "></script>
    <!-- overlayScrollbars -->
    <script src="{{ asset('plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js') }}"></script>
    <!-- AdminLTE App -->
    <script src="{{ asset('js/adminlte.js') }}"></script>
    <script src="{{ asset('plugins/fullcalendar/main.js') }}"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/locale/es.js'></script>

    <script src="{{ asset('js/pages/dashboard.js') }}"></script>


</body>

</html>
