<?php
require_once ('views/views.php');
class HomeView extends Views{
    

    public function vistaHome(){
        $this->smarty->display('home.tpl');
    }
}