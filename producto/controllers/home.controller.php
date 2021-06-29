<?php
require_once 'views/home.view.php';
require_once 'models/materiales.model.php';

class HomeController
{
    private $view;
    private $materialesModel;

    //   private $logueado;
    public function __construct()
    {
        $this->view = new HomeView();
        $this->materialesModel = new MaterialModel();
    }

    public function showHome()
    {
        $materiales = $this->materialesModel->getAllMateriales();
        $this->view->vistaHome($materiales);
    }
}
