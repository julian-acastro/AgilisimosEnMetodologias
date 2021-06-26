<?php
require_once 'views/cartoneros.view.php';
class CartonerosController
{
    private $model;
    private $view;
    //   private $logueado;
    public function __construct()
    {
        $this->model = new CartonerosModel();
        $this->view = new CartonerosView();
    }

    public function showCartoneros()
    {
        $this->view->cartoneros();
    }

    public function showFormCartonero()
    {
        $this->view->showFormCartonero();
    }

    /**
     * Obtiene la info para mostrarla en la pantalla de edición
     */
    public function editFormUR($nro_dni){
        $urbanRecuperator = $this->model->getUrbanRecuperator($nro_dni);
        $this->view->editFormUR($urbanRecuperator);
    }
}
