<?php
    require_once 'models/system.model.php';

class LoginModel extends SystemModel{


    public function VerUserRegistrado($usuario)
    {
  
  
      $sentencia = $this->getDb()->prepare("SELECT * FROM secretaria WHERE usuario=? "); // prepara la consulta
      $sentencia->execute([$usuario]); // ejecuta
      return $sentencia->fetch(PDO::FETCH_OBJ); // obtiene la respuesta
  
    }
   
}
?>
