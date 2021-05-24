<?php
require_once ('views/views.php');
class PostularView extends Views{
    

    public function formPostular(){
        $this->smarty->display('formPostular.tpl');
    }
}