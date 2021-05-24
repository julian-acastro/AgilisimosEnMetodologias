<?php
require_once ('views/views.php');
class LoginView extends Views{
    

    public function formLogin(){
        $this->smarty->display('formLogin.tpl');
    }
}