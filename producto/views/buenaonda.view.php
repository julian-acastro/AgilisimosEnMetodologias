<?php
require_once ('views/views.php');
class BuenaOndaView extends Views{
    

    public function ofertaTransporte(){
        $this->smarty->display('formOfertaTransporte.tpl');
    }
}