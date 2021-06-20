<?php

require_once 'system.model.php';

class CartonerosModel extends SystemModel
{
    // Devuelve todos los cartoneros.
    public function getAllNombreApellidoCartoneros()
    {
        //envia la consulta
        $sentencia = $this->getDb()->prepare("SELECT tipo_dni,nro_dni,nombre,apellido FROM cartonero"); // prepara la consulta
        $sentencia->execute(); // ejecuta
        $cartoneros = $sentencia->fetchAll(PDO::FETCH_OBJ); // obtiene la respuesta
        return $cartoneros;
    }
}