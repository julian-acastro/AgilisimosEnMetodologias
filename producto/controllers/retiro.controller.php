<?php

require_once 'views/retiro.view.php';
require_once 'models/pedidosRetiro.model.php';
require_once 'models/ciudadanos.model.php';
require_once 'models/materiales.model.php';
require_once 'views/error.view.php';
class RetiroController
{
    private $modelPedidos;
    private $modelCiudadanos;
    private $materialesModel;
    private $view;
    private $errorView;
    //   private $logueado;
    public function __construct()
    {
        $this->view = new RetiroView();
        $this->maxKm = 6;
        $this->maxPesoImg = 1048576;
        $this->modelPedidos = new ModelPedidosDeRetiro();
        $this->materialesModel = new MaterialModel();
        $this->modelCiudadanos = new CiudadanosModel();
        $this->errorView = new ErrorView();
    }

    public function showFormRetiro()
    {
        $materiales = $this->materialesModel->getAllMateriales();
        $this->view->vistaFormRetiro($materiales);
    }

    public function showListRetiro()
    {
        $pedidos = $this->modelPedidos->getAllpedidos();
        $this->view->vistaListaRetiro($pedidos);
    }

    public function enviarSolicitud()
    {
        if (
            empty($_POST['nombre']) || empty($_POST['apellido']) || empty($_POST['direccion']) || empty($_POST['telefono']) || empty($_POST['distancia']) || empty($_POST['material']) ||
            empty($_POST['franja_horaria']) || empty($_POST['volumen'])
        ) {
            $this->errorView->viewError('Existen uno o mas campos obligatorios vacios');
            die;
        }
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $direccion = $_POST['direccion'];
        $telefono = $_POST['telefono'];
        $distancia = $_POST['distancia'];
        $material = $_POST['material'];
        $volumen = $_POST['volumen'];
        $franja_horaria =  $_POST['franja_horaria'];
        $imagen_cargada = $_FILES['imagen'];
        $nombre_imagen = $_FILES['imagen']['name'];
        $ubi_imagen = $_FILES['imagen']["tmp_name"];
        $nombrefinalImagen = "imagen/" . uniqid("", true) . "." . strtolower(pathinfo($nombre_imagen, PATHINFO_EXTENSION));
        move_uploaded_file($ubi_imagen, $nombrefinalImagen);

        if ($imagen_cargada['size'] != 0) {
            $peso = $imagen_cargada["size"]; //devuelve el valor en bytes
            $extension = $imagen_cargada["type"];

            if (!$this->verificarImagen($peso, $extension)) {
                $this->errorView->viewError('La imagen debe pesar 1Mb como maximo y tener una extension jpg o png');
                die;
            }
        }
        if ($distancia > 6) {
            $this->errorView->viewError('La distancia de su domicilio a la planta supera los Km permitidos');
            die;
        }
        $id_ciudadano = $this->modelCiudadanos->addCiudadano($nombre, $apellido, $direccion, $telefono);
        var_dump($id_ciudadano);
        $this->modelPedidos->addSolicitud($id_ciudadano, $material, $franja_horaria, $distancia, $nombrefinalImagen, $direccion, $volumen);
        $this->errorView->viewError('El aviso fue cargado exitosamente'); //avisa si se acepto el aviso de retiro   
    }



    public function verificarImagen($peso, $extension)
    {
        if (($peso <= $this->maxPesoImg) && ($extension == "image/jpg" || $extension == "image/jpeg" ||
            $extension == "image/png")) {
            return true;
        } else {
            return false;
        }
    }
}
