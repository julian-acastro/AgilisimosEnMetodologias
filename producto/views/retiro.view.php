<?php
require_once ('views/views.php');
class RetiroView extends Views{
    

    public function vistaFormRetiro(){
        $this->smarty->display('formRetiro.tpl');
    }
}