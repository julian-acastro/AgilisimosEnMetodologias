<?php
require_once 'views/materiales.view.php';
class MaterialesController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
       
        $this->view = new MaterialesView();
    }

    public function showMateriales(){
        $this->view->materiales();
    }

}