<?php
require_once 'views/login.view.php';
require_once 'models/login.model.php';
class LoginController
{
    private $model;
    private $view;
    //   private $logueado;
    public function __construct()
    {
        $this->view = new LoginView();
        $this->model = new LoginModel();
    }
    public function showFormLogin()
    {
        $this->view->formLogin();
    }

    public function verifyUser()
    {
        $usuario = $_POST['nombre_usuario'];
        $pass = $_POST['contrasenia'];
        //busco el usuario
        $verificado = $this->model->VerUserRegistrado($usuario);
        if (!empty($verificado) && password_verify($pass, $verificado->contrasenia)) {
            // abro session y guardo al usuario logueado
            session_start();
            $_SESSION['IS_LOGGED'] = true;
            $_SESSION['ID_USER'] = $verificado->id_usuario;
            $_SESSION['USERNAME'] = $verificado->usuario;
            header("Location: " . BASE_URL . "home");
        } else {

            $this->view->formLogin("Datos inválidos ");
        }
    }

    public function endSesion()
    {
        session_start();
        $_SESSION['IS_LOGGED'] = false;
        session_destroy();
        header("Location: " . BASE_URL . "home");
    }
}
