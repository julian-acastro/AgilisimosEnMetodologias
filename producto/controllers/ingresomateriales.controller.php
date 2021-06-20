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

}