<?php
require_once 'views/ventamateriales.view.php';
class VentaMaterialesController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
       
        $this->view = new VentaMaterialesView();
    }

    public function showVentaMateriales(){
        $this->view->ventaMateriales();
    }

}
