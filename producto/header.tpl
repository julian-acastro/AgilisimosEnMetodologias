<!DOCTYPE html>
    <html lang="es">
    <head>
        <base href="{BASE_URL}">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="css\style.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/9c4a71134b.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <title>Spokon | TV </title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-success">
            <a class="navbar-brand font-weight-bold" href="">
            <img src="img\simbolo.png" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">Spokon.tv</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="nav nav-pills">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" id="navbardrop" data-toggle="dropdown" href="#">Deportes</a>
                        <div class="dropdown-menu bg-light text-dark">
                            {foreach $categories item=category}
                                <a class="dropdown-item" href="tournament/{$category->id_deporte}">{$category->deporte}</a>
                            {/foreach}
                        </div>
                    </li>
                </ul>
                <ul class="nav nav-pills">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle text-white" id="navbardrop" data-toggle="dropdown" href="#">Torneos</a>
                        <div class="dropdown-menu bg-light text-dark">
                            {foreach $itemList item=torneo}
                                <a class="dropdown-item" href="item/{$torneo->id_torneo}">{$torneo->torneo}</a>
                            {/foreach}
                        </div>
                    </li>
                </ul>
            </div>
            {if !$isLogged}
                <form class="form-inline" action="verify" method="POST">
                    <input class="form-control mr-sm-1" type="text" name="user" placeholder="e-mail">
                    <input class="form-control mr-sm-1" type="password" name="password" placeholder="password">
                    <button class="btn btn-info" type="submit">Ingresar</button>
                    <a type="button" class="btn btn-warning" href="signIn">Registrarse</a>
                </form>
            {elseif $ROL}
                <div>
                    <a href="adminPage" type="button" class="btn btn-warning">{$USER}</a>
                    <a href="logout" type="button" class="btn btn-danger">Cerrar sesión</a>
                </div>
                {else}
                    <a href="index" type="button" class="btn btn-warning">{$USER}</a>
                    <a href="logout" type="button" class="btn btn-danger">Cerrar sesión</a>
                {/if}
        </nav>
        <div class="text-center bg-info text-white pt-3 pb-3 mb-3">
            <h1> Bienvenidos a SPOKON</h1>
            <h3> Tu sitio para disfrutar de tus deportes favoritos </h3>
        </div>
        <div class="container-fluid mb-10"
            id="info-user" 
            data-rol={$ROL}
            data-user={$USER}
            data-userid={$ID_USER}
            >