<?php

require_once 'system.model.php';

class MaterialModel extends SystemModel
{

    // Devuelve todos los materiales.
    public function getAllMateriales()
    {
        //envia la consulta
        $sentencia = $this->getDb()->prepare("SELECT * FROM material"); // prepara la consulta
        $sentencia->execute(); // ejecuta
        $materiales = $sentencia->fetchAll(PDO::FETCH_OBJ); // obtiene la respuesta
        return $materiales;
    }
}
