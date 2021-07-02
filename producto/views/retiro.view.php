<?php
require_once('views/views.php');
class RetiroView extends Views
{
    public function vistaFormRetiro($materiales)
    {
        $this->smarty->assign("materiales", $materiales);
        $this->smarty->display('formRetiro.tpl');
    }

    public function vistaListaRetiro($pedidos)
    {
        $this->smarty->assign("pedidos", $pedidos);
        $this->smarty->display('pedidosRetiro.tpl');
    }

}
