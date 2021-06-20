<?php
require_once ('views/views.php');
class HomeView extends Views{
    

    public function vistaHome($materiales){
        $this->smarty->assign('materiales', $materiales);
        $this->smarty->display('home.tpl');
    }
}