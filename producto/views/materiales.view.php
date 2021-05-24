<?php
require_once ('views/views.php');
class MaterialesView extends Views{
    

    public function materiales(){
        $this->smarty->display('materiales.tpl');
    }
}