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

    public function deleteMaterial($ID){
        if(!isset($ID)){
            header('Location: ' . BASE_URL . "materiales");
            die;
        }
        $this->model->deleteMaterial($ID);
        header('Location: ' . BASE_URL . "materiales");
    }

    /**
     * Función para gregar nuevos materiales
     * que la cooperativa acopia
     */
    public function addItem(){
        //verifica que este seteado los parametros
        if(isset($_POST)){
            //asigna los valores a las variables
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
            $formato = isset($_POST['entrega']) ? $_POST['nombre'] : false;
            $rechazo = isset($_POST['rechazo']) ? $_POST['nombre'] : null;

            
            if($nombre && $formato){
                //pasa los datos al modelo para ser agregados en la BD
                $this->model->addMaterial($nombre,$formato,$rechazo);
            }
        }
        //redirige a materiales
        header('Location: ' . BASE_URL . "materiales");
    }

}