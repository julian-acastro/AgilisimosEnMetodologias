<?php
require_once ('views/views.php');
class CartonerosView extends Views{
    

    public function cartoneros(){
        $this->smarty->display('cartoneros.tpl');
    }

    public function showFormCartonero(){
        $this->smarty->display('formAltaCartonero.tpl');
    }

    public function editFormUR($urbanRecuperator){

        $this->smarty->assign('urbanRecuperator', $urbanRecuperator);
        $this->smarty->display('editFormUR.tpl');
    }
}