<?php
require_once 'views/materiales.view.php';
require_once 'models/materiales.model.php';

class MaterialesController
{
    private $model;
    private $view;
    //   private $logueado;
    public function __construct()
    {
        $this->view = new MaterialesView();
        $this->model = new MaterialModel();
    }

    public function showFormMaterial()
    {
        $this->view->showFormMaterial();
    }

    public function showMateriales()
    {
        // pido los materiales al MODELO
        $materiales = $this->model->getAllMateriales();
        // actualizo la vista
        $this->view->materiales($materiales);
    }

    public function deleteMaterial($ID)
    {
        if (!isset($ID)) {
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
    public function addItem()
    {
        //verifica que este seteado los parametros
        if (isset($_POST)) {
            //asigna los valores a las variables
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
            $formato = isset($_POST['entrega']) ? $_POST['entrega'] : false;
            $rechazo = isset($_POST['rechazo']) ? $_POST['rechazo'] : null;


            if ($nombre && $formato) {
                //pasa los datos al modelo para ser agregados en la BD
                $this->model->addMaterial($nombre, $formato, $rechazo);
            }
        }
        //redirige a materiales
        header('Location: ' . BASE_URL . "materiales");
    }

    public function showFormEditMaterial($ID_material)
    {
        // traigo el material
        $material = $this->model->getMaterial($ID_material);
        // actualizo la vista
        $this->view->showFormEditarMaterial($material);
    }

    public function editMaterial()
    {
        // traigo el id del material, del value del boton, con en name id_material_editar
        $ID_material = $_POST['id_material_editar'];
        // toma los valores enviados por el formulario
        $nombre = $_POST['nombre'];
        $formato_entrega = $_POST['formato_entrega'];
        $restricciones = $_POST['restricciones'];

        //edito el material
        $editMaterial = $this->model->editMaterial($ID_material, $nombre, $formato_entrega, $restricciones);

        //redirige a materiales
        header('Location: ' . BASE_URL . "materiales");
        // $this->endResult('No se pudo editar! Revise su conexión', 'editar_publicacion/' . $id_car, $editcar, $photos);
    }
}
