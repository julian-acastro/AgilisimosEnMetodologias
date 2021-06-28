<?php
require_once 'views/cartoneros.view.php';
require_once 'models/cartoneros.model.php';
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

    public function listaCartoneros()
    {
        $cartoneros = $this->model->getAll();
        $this->view->listaCartoneros($cartoneros);
    }

    //Funcion para agregar nuevo Cartonero

    public function addCartonero()
    {
        //verifica que esten seteado los parametros
        if (isset($_POST)) {

            //asigna los valores a las variables
            $nombre = isset($_POST['nombre']) ? $_POST['nombre'] : false;
            $apellido = isset($_POST['apellido']) ? $_POST['apellido'] : false;
            $tipo_dni = isset($_POST['tipo_dni']) ? $_POST['tipo_dni'] : false;
            $nro_dni = isset($_POST['nro_dni']) ? $_POST['nro_dni'] : false;
            $direccion = isset($_POST['direccion']) ? $_POST['direccion'] : false;
            $fecha_nac = isset($_POST['fecha_nac']) ? $_POST['fecha_nac'] : false;
            $vehiculo = isset($_POST['vehiculo']) ? $_POST['vehiculo'] : false;


            if ($nombre && $apellido && $tipo_dni && $nro_dni && $direccion && $fecha_nac && $vehiculo) {

                $duplicate = $this->model->verifyExist($tipo_dni, $nro_dni);


                if (empty($duplicate)) {
                    //pasa los datos al modelo para ser agregados en la BD
                    $this->model->addCartonero($nombre, $apellido, $tipo_dni, $nro_dni, $direccion, $fecha_nac, $vehiculo);
                    //redirige a home
                    header('Location: ' . BASE_URL . "listaCartoneros");
                    die;
                }
            }
        }
        //redirige a materiales
        header('Location: ' . BASE_URL . "home");
    }


    /**
     * Obtiene la info para mostrarla en la pantalla de edición
     */
    public function editFormUR($tipo_dni, $nro_dni)
    {

        $urbanRecuperator = $this->model->getUrbanRecuperator($tipo_dni, $nro_dni);
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

            if (empty($duplicate)) {
                $this->model->confirmEdit($name, $surname, $doc_type, $doc_nro, $adress, $birth, $vehicle, $oldType, $oldNro);
                header('Location: ' . BASE_URL . "listaCartoneros");
            }
        }
    }

    /**
     * Funcion borrado del cartonero
     */
    public function deleteCartonero($tipo_dni, $nro_dni)
    {
        if (!isset($tipo_dni, $nro_dni)) {
            header('Location: ' . BASE_URL . "listaCartoneros");
            die;
        }
        $this->model->deleteCartonero($tipo_dni, $nro_dni);
        header('Location: ' . BASE_URL . "listaCartoneros");
    }
}
