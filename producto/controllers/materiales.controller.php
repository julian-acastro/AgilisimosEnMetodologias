<?php
require_once 'views/materiales.view.php';
require_once 'models/materiales.model.php';



class MaterialesController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
        $this->view = new MaterialesView();
        $this->model = new MaterialModel();
    }

    public function showFormMaterial(){
        $this->view->showFormMaterial();
    }

    public function showMateriales()
    {
        // pido los materiales al MODELO
        $materiales = $this->model->getAllMateriales();
       
        // actualizo la vista
        $this->view->materiales($materiales);
    }

}