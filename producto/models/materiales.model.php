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

    // Devuelve un material con el id determinado
    public function getMaterial($ID_material)
    {
        // envia la consulta
        $sentencia = $this->getDb()->prepare("SELECT * FROM material WHERE ID_material = ?"); // prepara la consulta
        $sentencia->execute([$ID_material]); // ejecuta
        $material = $sentencia->fetch(PDO::FETCH_OBJ); // obtiene la respuesta
        return $material;
    }


    /**
     * Agrega el material a la base de datos
     */
    public function addMaterial($nombre, $formato, $rechazo){
        $db = $this->getDb();
        $query = $db->prepare("INSERT INTO material(nombre, formato_entrega,restricciones) VALUES(?,?,?)");//prepara la consulta
        $query->execute([$nombre,$formato,$rechazo]);//ejecuta la consulta
    }

    public function deleteMaterial($ID){
        // enviamos la consulta
        $query = $this->getDb()->prepare("DELETE FROM material WHERE ID_material = ?"); // prepara la consulta
        return $query->execute([$ID]); // ejecuta 
    }

    //edita un material
    public function editMaterial($ID_material, $nombre, $formato_entrega, $restricciones){
        //var_dump($ID_material, $nombre, $formato_entrega, $restricciones); die;
        $consulta = "UPDATE material SET nombre= ?, formato_entrega= ?, restricciones= ? WHERE ID_material = ?";
        $sentencia = $this->getDb()->prepare($consulta); // prepara la consulta
        return $sentencia->execute([$nombre, $formato_entrega, $restricciones, $ID_material]); // ejecuta    
    }
}
