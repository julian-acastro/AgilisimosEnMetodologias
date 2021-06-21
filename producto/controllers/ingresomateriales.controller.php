<?php
require_once 'views/ingresomateriales.view.php';
require_once 'models/materiales.model.php';
require_once 'models/cartoneros.model.php';
require_once 'models/acopios.model.php';

class IngresoMaterialesController{
    private $model;
    private $view;
    private $materialesModel;
    private $cartonerosModel;
    private $acopiosModel;
    //private $logueado;
    public function __construct()
    {
        $this->view = new IngresoMaterialesView();
        $this->materialesModel = new MaterialModel();
        $this->cartonerosModel = new CartonerosModel();
        $this->acopiosModel = new AcopiosModel();
    }

    public function showIngesoMateriales(){
        $materiales = $this->materialesModel->getAllMateriales();
        $cartoneros = $this->cartonerosModel->getAllNombreApellidoCartoneros();
        $acopios = $this->acopiosModel->getAllAcopios();
        $this->view->showIngresoMateriales($materiales,$cartoneros,$acopios);
    }

    public function addAcopio(){
        if(isset($_POST)){
            //asigna los valores a las variables
            $cartonero = isset($_POST['cartonero']) ? $_POST['cartonero'] : null;
            $ID_material = isset($_POST['material']) ? $_POST['material'] : null;
            $kilos_acopiados = isset($_POST['peso']) ? $_POST['peso'] : null;

            if(!$cartonero || !$ID_material || !$kilos_acopiados){
                header('Location: ' . BASE_URL . "ingresoMateriales");
                die;
            }
            $cartonero = explode('/', $cartonero);
            $tipo_dni = $cartonero[0];
            $nro_dni = $cartonero[1];
            
            //pasa los datos al modelo para ser agregados en la BD
            $query = $this->acopiosModel->addAcopio($ID_material, $tipo_dni, $nro_dni,(int)$kilos_acopiados);
        }
        //redirige a materiales
        header('Location: ' . BASE_URL . "ingresoMateriales");
    }

}