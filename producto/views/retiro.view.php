<?php
require_once ('views/views.php');
class RetiroView extends Views{
    

    public function vistaFormRetiro(){
        $this->smarty->display('formRetiro.tpl');
    }

    public function vistaListaRetiro(){
        $this->smarty->display('pedidosRetiro.tpl');
    }
}