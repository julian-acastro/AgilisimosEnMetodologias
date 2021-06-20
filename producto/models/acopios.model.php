<?php

require_once 'system.model.php';

class AcopiosModel extends SystemModel
{
    // Devuelve todos los acopios.
    public function getAllAcopios()
    {
        $consulta = "SELECT a.kilos_acopiados,c.nombre AS nombre_cartonero,c.apellido,m.nombre AS nombre_material 
                        FROM acopio a 
                        NATURAL JOIN cartonero c NATURAL JOIN material m
                    ";
        //envia la consulta
        $sentencia = $this->getDb()->prepare($consulta); // prepara la consulta
        $sentencia->execute(); // ejecuta
        $acopios = $sentencia->fetchAll(PDO::FETCH_OBJ); // obtiene la respuesta
        return $acopios;
    }
}