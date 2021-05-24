<?php
require_once ('views/views.php');
class IngresoMaterialesView extends Views{
    

    public function registrarIngresoMateriales(){
        $this->smarty->display('ingresoMateriales.tpl');
    }
}