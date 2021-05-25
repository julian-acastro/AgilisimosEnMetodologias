<?php
    require_once 'controllers/home.controller.php';
    require_once 'controllers/retiro.controller.php';
    require_once 'controllers/buenaonda.controller.php';
    require_once 'controllers/postular.controller.php';
    require_once 'controllers/login.controller.php';
    require_once 'controllers/cartoneros.controller.php';
    require_once 'controllers/materiales.controller.php';
    require_once 'controllers/ingresomateriales.controller.php';
    require_once 'controllers/ventamateriales.controller.php';
    require_once 'controllers/registro.controller.php';

    

    // definimos la base url de forma dinamica
    define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

    // define una acción por defecto
    if (empty($_GET['action'])) {
        $_GET['action'] = 'home';
    } 
     

    // toma la acción que viene del usuario y parsea los parámetros
    $accion = $_GET['action']; 
    $parametros = explode('/', $accion);
    

    // decide que camino tomar según TABLA DE RUTEO
    switch ($parametros[0]) {

        //ACCIONES DE ACCESO PÚBLICO

        case 'home':              //Muestra el Home de la página
          $controller= new HomeController();
          $controller->showHome();
        break;
       
        case 'solicitudDeRetiro': 
            $controller= new RetiroController();
            $controller->showFormRetiro();           
           
        break;

        case 'ciudadanoBuenaOnda':       
            $controller= new BuenaOndaController();
            $controller->showFormOfertaTransporte();
        break;

        case 'postular':       
            $controller= new PostularController();
            $controller->showFormPostular();
        break;

        case 'login': 
            $controller= new LoginController();
            $controller->showFormLogin();
        break;

        case 'registro': 
            $controller= new RegistroController();
            $controller->showFormRegistro();
        break;
// FUNCIONES DE ADMINISTRADOR

case 'cartoneros': 
    $controller= new CartonerosController();
    $controller->showCartoneros();
break;

case 'materiales': 
    $controller= new MaterialesController();
    $controller->showMateriales();
break;

case 'ingresoMateriales': 
    $controller= new IngresoMaterialesController();
    $controller->showIngesoMateriales();
break;


case 'ventaMateriales': 
    $controller= new VentaMaterialesController();
    $controller->showVentaMateriales();
break;
  

 
        
       
    }