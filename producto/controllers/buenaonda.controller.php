<?php
require_once 'views/buenaonda.view.php';
class BuenaOndaController
{
    private $model;
    private $view;
    //   private $logueado;
    public function __construct()
    {

        $this->view = new BuenaOndaView();
    }

    public function showFormOfertaTransporte()
    {
        $this->view->ofertaTransporte();
    }
}
