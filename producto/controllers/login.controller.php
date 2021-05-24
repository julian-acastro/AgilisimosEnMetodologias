<?php
require_once 'views/login.view.php';
class LoginController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
       
        $this->view = new LoginView();
    }

    public function showFormLogin(){
        $this->view->formLogin();
    }

}