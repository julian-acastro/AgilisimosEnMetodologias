<?php
require_once ('views/views.php');
class CartonerosView extends Views{
    

    public function cartoneros(){
        $this->smarty->display('cartoneros.tpl');
    }
}