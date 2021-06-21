<?php

require_once 'views/retiro.view.php';
require_once 'models/pedidosRetiro.model.php';
require_once 'models/ciudadanos.model.php';
require_once 'models/materiales.model.php';
class RetiroController
{
    private $modelPedidos;
    private $modelCiudadanos;
    private $materialesModel;
    private $view;
    //   private $logueado;
    public function __construct()
    {
        $this->view = new RetiroView();
        $this->maxKm = 6;
        $this->maxPesoImg = 1100000;
        $this->min = 1;
        $this->max = 12;
        $this->modelPedidos = new ModelPedidosDeRetiro();
        $this->materialesModel = new MaterialModel();
        $this->modelCiudadanos = new CiudadanosModel();
    }

    public function showFormRetiro()
    {
        $materiales = $this->materialesModel-> getAllMateriales();
        $this->view->vistaFormRetiro($materiales);
    }

    public function showListRetiro()
    {
        $this->view->vistaListaRetiro($this->modelPedidos->getAllpedidos());
    }

    public function enviarSolicitud()
    {
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $direccion = $_POST['direccion'];
        $telefono = $_POST['telefono'];
        $distancia = $_POST['distancia'];
        $material = $_POST['material'];
        $volumen = $_POST['volumen'];
        $franja_horaria =  $_POST['franja_horaria'];
        
        if(!isset($_FILES)) {
            $peso = $_FILES["imagen"]["size"]; //devuelve el valor en bytes
            $extension = $_FILES["imagen"]["type"];
            $imagen = $_FILES['imagen']['tmp_name'];
        }
        
        //var_dump($nombre, $apellido, $direccion, $telefono, $material, $franja_horaria, $distancia, $direccion, $volumen);die;

        if (
            !empty($nombre) && !empty($apellido) && !empty($direccion) && !empty($telefono) && !empty($distancia) && !empty($material) &&
            !empty($franja_horaria) && !empty($volumen)
        ) {
            if ((int)$distancia) {
                if (!empty($imagen) && $this->verificarImagen($peso, $extension) == false) {
                    $this->view->viewError('La imagen debe pesar 1Mb como maximo y tener una extension jpg o png');
                } else {
                    $id_ciudadano = $this->modelCiudadanos->addCiudadano($nombre, $apellido, $direccion, $telefono);
                    $this->modelPedidos->addSolicitud($id_ciudadano, $material, $franja_horaria, $distancia, $imagen = NULL, $direccion, $volumen);
                                             
                    $this->view->viewError('El aviso fue cargado exitosamente'); //avisa si se acepto el aviso de retiro
                }
            } else {
                $this->view->viewError('La distancia de su domicilio a la planta supera los Km permitidos');
            }
        } else {
            $this->view->viewError('Existen uno o mas campos obligatorios vacios');
        }
    }

    public function verificarImagen($peso, $extension)
    {
        if (($peso <= $this->maxPesoImg) && ($extension == "imagen/jpg" || $extension == "imagen/jpeg" ||
            $extension == "imagen/png")) {
            return true;
        } else {
            return false;
        }
    }
}
