<?php
require_once('views/views.php');
class VentaMaterialesView extends Views
{
    public function ventaMateriales()
    {
        $this->smarty->display('ventaMateriales.tpl');
    }
}
