<?php
require_once 'views/home.view.php';
class HomeController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
       
        $this->view = new HomeView();
    }

    public function showHome(){
        $this->view->vistaHome();
    }

}
