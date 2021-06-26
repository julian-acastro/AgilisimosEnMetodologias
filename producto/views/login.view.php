<?php
require_once ('views/views.php');
class LoginView extends Views{
    

    public function formLogin($error = null){
        $this->smarty->assign("error", $error);
        $this->smarty->display('formLogin.tpl');
    }
}
