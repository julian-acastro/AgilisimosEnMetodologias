<?php
require_once 'views/registro.view.php';
class RegistroController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
       
        $this->view = new registroView();
    }

    public function showFormRegistro(){
        $this->view->formRegistro();
    }

}