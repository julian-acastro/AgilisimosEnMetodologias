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

    /**
     * Traigo todos los datos del cartonero 
     * por el ID que se le pasa por parametro
     */
    public function getUrbanRecuperator($nro_dni){

        $db = $this->getDb();
        $query = $db->prepare("SELECT * FROM cartonero WHERE nro_dni = ?");
        $query->execute([$nro_dni]);
        $urbanRecuperator = $query->fetch(PDO::FETCH_OBJ);

        return $urbanRecuperator;
    }
}