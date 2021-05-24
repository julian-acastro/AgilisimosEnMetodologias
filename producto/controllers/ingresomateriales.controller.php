<?php
require_once 'views/ingresomateriales.view.php';
class IngresoMaterialesController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
       
        $this->view = new IngresoMaterialesView();
    }

    public function showIngesoMateriales(){
        $this->view->registrarIngresoMateriales();
    }

}