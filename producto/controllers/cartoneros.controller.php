<?php
require_once 'views/cartoneros.view.php';
class CartonerosController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
       
        $this->view = new CartonerosView();
    }

    public function showCartoneros(){
        $this->view->cartoneros();
    }

}