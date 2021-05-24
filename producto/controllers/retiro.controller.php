<?php
require_once 'views/retiro.view.php';
class RetiroController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
       
        $this->view = new RetiroView();
    }

    public function showFormRetiro(){
        $this->view->vistaFormRetiro();
    }

}