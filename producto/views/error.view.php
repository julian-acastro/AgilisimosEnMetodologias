<?php
require_once('views/views.php');

class ErrorView extends Views{

    public function viewError($msj = null)
    {
        $this->smarty->assign("error", $msj);
        $this->smarty->display('error.tpl');
    }
    
}