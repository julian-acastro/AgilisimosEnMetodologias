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
    public function editFormUR($nro_dni)
    {
        $urbanRecuperator = $this->model->getUrbanRecuperator($nro_dni);
        $this->view->editFormUR($urbanRecuperator);
    }

    /**
     * edita el cartonero
     */
    public function confirmEdit()
    {
        $name = isset($_POST['nombre']) ? $_POST['nombre'] : false;
        $surname = isset($_POST['apellido']) ? $_POST['apellido'] : false;
        $doc_type = isset($_POST['tipo_dni']) ? $_POST['tipo_dni'] : false;
        $doc_nro = isset($_POST['nro_dni']) ? $_POST['nro_dni'] : false;
        $adress = isset($_POST['direccion']) ? $_POST['direccion'] : false;
        $birth = isset($_POST['fecha_nac']) ? $_POST['fecha_nac'] : false;
        $vehicle = isset($_POST['vehiculo']) ? $_POST['vehiculo'] : false;
        $oldType = isset($_POST['oldType']) ? $_POST['oldType'] : false;
        $oldNro = isset($_POST['oldNro']) ? $_POST['oldNro'] : false;

        if ($name && $surname && $doc_type && $doc_nro && $adress && $birth && $vehicle) {

            $duplicate = $this->model->verifyExist($doc_type, $doc_nro);

            if(empty($duplicate)){
            $this->model->confirmEdit($name, $surname, $doc_type, $doc_nro, $adress, $birth, $vehicle, $oldType, $oldNro);
            header('Location: ' . BASE_URL . "home");
            }
        }
    }
}
