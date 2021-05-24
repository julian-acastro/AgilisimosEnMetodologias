<?php
require_once 'views/postular.view.php';
class PostularController{
    private $model;
    private $view;
 //   private $logueado;
    public function __construct()
    {
       
        $this->view = new PostularView();
    }

    public function showFormPostular(){
        $this->view->formPostular();
    }

}