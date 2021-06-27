<!DOCTYPE html>
<html lang="es">

<head>
    <base href="{$base_url}">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
    </script>
    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="icon" href="images/descarga.jpg">
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    
    
    <title>Cooperativa de Recicladores Urbanos de Tandil</title>
</head>

<body>

    <div class="row">
        <div class="container col-lg-12">
            <!--navbar-->
            <nav class="navbar navbar-expand-lg bg-success-gradiant">
                <div class="container-fluid">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a href="home" class="nav-link"><b>| Home |</b></a>
                            </li>
                            <li class="nav-item">
                                <a href="solicitudDeRetiro" class="nav-link"><b>| Solicitud de retiro |</b></a>
                            </li>
                        </ul>
                        {if  !$User}
                        <div class="navbar-nav ml-auto mx-5">
                        <li class="nav-item active">
                        <a class="btn rounded-pill btn-primary py-2 px-4 " href="login"role="button" >Login</a></li>
                        </div>
                        {else}
                            <div class="navbar-nav ml-auto mx-5">
                            <li class="nav-item active">
                                <a class="btn rounded-pill btn-primary py-2 px-4 " href="cerrar_sesion"role="button">Logout</a></li>
                            </div>
                            {/if}
                        {if  $User}
                        <div class="navbar-nav ml-auto mx-5">
                            <li class="nav-item dropdown">
                            <a class="btn rounded-pill btn-primary py-2 px-4 dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Admin
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="materiales">Materiales</a></li>
                                <li><a class="dropdown-item" href="ingresoMateriales">Ingreso de materiales</a></li>
                                <li><a class="dropdown-item" href="pedidoDeRetiro">Pedidos de retiro</a></li>
                                <li><a class="dropdown-item" href="altaCartonero">Formulario de alta de cartonero</a></li>
                                <li><a class="dropdown-item" href="listaCartoneros">Listado de Cartoneros</a></li>
                            </ul>
                            </li>
                        </div>
                        {/if}
                    </div>
                </div>
            </nav>
            
                
