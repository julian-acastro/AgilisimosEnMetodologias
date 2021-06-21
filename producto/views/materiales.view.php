<?php
require_once ('views/views.php');
class MaterialesView extends Views{
    

    public function materiales($materiales){
        $this->smarty->assign("materiales", $materiales);
        $this->smarty->display('materiales.tpl');
    }

    public function showFormMaterial(){
        $this->smarty->display('formAltaMaterial.tpl');
    }

    public function showFormEditarMaterial($material){
        $this->smarty->assign("material", $material);

        $this->smarty->display('formEditarMaterial.tpl');
    }
}