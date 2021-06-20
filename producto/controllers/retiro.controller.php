<?php

require_once 'views/retiro.view.php';
require_once 'models/pedidosRetiro.model.php';

class RetiroController
{
    private $model;
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
    }

    public function showFormRetiro()
    {
        $this->view->vistaFormRetiro();
    }

    public function showListRetiro()
    {
        $this->view->vistaListaRetiro($this->modelPedidos->getAllpedidos());
    }

    public function addRetiro()
    {
        $nombre = $_POST['nombre'];
        $apellido = $_POST['apellido'];
        $direccion = $_POST['direccion'];
        $telefono = $_POST['telefono'];
        $distancia = $_POST['distancia'];
        $material = $_POST['material'];
        $volumen = $_POST['volumen'];
        $franja_horaria =  $_POST['franja_horaria'];
        $peso = $_FILES["input_name"]["size"]; //devuelve el valor en bytes
        $extension = $_FILES["input_name"]["type"];
        $imagen = $_FILES['input_name']['tmp_name'];

        if (
            !empty($nombre) && !empty($apellido) && !empty($direccion) && !empty($telefono) && !empty($distancia) && !empty($material) &&
            !empty($franja_horaria) && !empty($volumen)
        ) {
            if ($this->verificarDistancia() == true) {
                if (!empty($imagen) && $this->verificarImagen($peso, $extension) == false) {
                    $this->view->viewError('La imagen debe pesar 1Mb como maximo y tener una extension jpg o png');
                } else {
                    $this->model->insert($nombre, $apellido, $direccion, $telefono, $distancia, $material, $franja_horaria, $volumen, $imagen);
                    $this->view->viewError('El aviso fue cargado exitosamente');
                }
            } else {
                $this->view->viewError('La distancia de su domicilio a la planta supera los Km permitidos');
            }
        } else {
            $this->view->viewError('Existen uno o mas campos obligatorios vacios');
        }
    }

    public function verificarDistancia()
    {
        $num = $this->min; $this->max;

        if ($num > $this->maxKm) {
            return false;
        } else {
            return true;
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
