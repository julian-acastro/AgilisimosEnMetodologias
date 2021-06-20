<?php
require_once ('views/views.php');
class IngresoMaterialesView extends Views{

    public function showIngresoMateriales($materiales,$cartoneros,$acopios){
        $this->smarty->assign('acopios', $acopios);
        $this->smarty->assign('cartoneros', $cartoneros);
        $this->smarty->assign('materiales', $materiales);
        $this->smarty->display('ingresoMateriales.tpl');
    }
}