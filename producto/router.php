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
require_once 'controllers/login.controller.php';



// definimos la base url de forma dinamica
define('BASE_URL', '//' . $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']) . '/');

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
        $controller = new HomeController();
        $controller->showHome();
        break;

    case 'solicitudDeRetiro':
        $controller = new RetiroController();
        $controller->showFormRetiro();
        break;

    case 'enviarSolicitud':
        $controller = new RetiroController();
        $controller->enviarSolicitud();
        break;

    case 'ciudadanoBuenaOnda':
        $controller = new BuenaOndaController();
        $controller->showFormOfertaTransporte();
        break;

    case 'postular':
        $controller = new PostularController();
        $controller->showFormPostular();
        break;

    case 'login':
        $controller = new LoginController();
        $controller->showFormLogin();
        break;

    case 'registro':
        $controller = new RegistroController();
        $controller->showFormRegistro();
        break;
        // FUNCIONES DE ADMINISTRADOR

    case 'cartoneros':
        $controller = new CartonerosController();
        $controller->showCartoneros();
        break;

    case 'materiales':
        $controller = new MaterialesController();
        $controller->showMateriales();
        break;

    case 'ingresoMateriales':
        $controller = new IngresoMaterialesController();
        $controller->showIngesoMateriales();
        break;


    case 'ventaMateriales':
        $controller = new VentaMaterialesController();
        $controller->showVentaMateriales();
        break;

    case 'altaMaterial':
        $controller = new MaterialesController();
        $controller->showFormMaterial();
        break;

    case 'addMaterial':
        $controller = new MaterialesController();
        $controller->addItem();
        break;

    case 'agregarAcopio':
        $controller = new IngresoMaterialesController();
        $controller->addAcopio();
        break;

    case 'pedidoDeRetiro':
        $controller = new RetiroController();
        $controller->showListRetiro();
        break;

    case 'eliminarMaterial':
        // instanciando un objeto de la clase UserController
        $controller = new MaterialesController();
        $controller->deleteMaterial($parametros[1]);
        break;

    case 'editarMaterial':
        // instanciando un objeto de la clase UserController
        $controller = new MaterialesController();
        $controller->showFormEditMaterial($parametros[1]);
        break;

    case 'editMaterial':
        $controller = new MaterialesController();
        $controller->editMaterial();
        break;

    case 'altaCartonero': //esto hay q linkearlo desde el listado de cartoneros!!!!
        $controller = new CartonerosController();
        $controller->showFormCartonero();
        break;

        //  FUNCION DE LOGIN
    case 'login':
        $controller = new LoginController();
        $controller->showFormLogin();
        break;

    case 'verifyUser':  //Verifica usuario existente, desde ACTION del formulario
        $controller = new LoginController();
        $controller->verifyUser();
        break;

    case 'cerrar_sesion': //Cierra la sesión logueada.
        $controller = new LoginController();
        $controller->endSesion();
        break;
    
    case 'modifyUrbanRecuperator':
        $controller = new CartonerosController();
        $controller->editFormUR($parametros[1]);
        break;
    
    case 'confirmEdit':
        $controller = new CartonerosController();
        $controller->confirmEdit();
        break;
}
