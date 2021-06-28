<?php
require_once('views/views.php');
class RegistroView extends Views
{
    public function formRegistro()
    {
        $this->smarty->display('formRegistro.tpl');
    }
}
