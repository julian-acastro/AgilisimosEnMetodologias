<?php
require_once ('views/views.php');
class RetiroView extends Views{
    

    public function vistaFormRetiro(){
        $this->smarty->display('formRetiro.tpl');
    }

    public function vistaListaRetiro($pedidos){
        $this->smarty->assign("pedidos", $pedidos);
        $this->smarty->display('pedidosRetiro.tpl');
    }

    public function viewError($msj = null){
        $this->smarty->assign("error", $msj);
        $this->smarty->display('error.tpl');
    }
}