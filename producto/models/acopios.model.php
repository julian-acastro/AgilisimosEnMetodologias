<?php

require_once 'system.model.php';

class AcopiosModel extends SystemModel
{
    // Devuelve todos los acopios.
    public function getAllAcopios()
    {
        $consulta = "SELECT a.kilos_acopiados,c.nro_dni,c.nombre AS nombre_cartonero,c.apellido,m.nombre AS nombre_material
                    FROM acopio a 
                    INNER JOIN cartonero c ON (a.tipo_dni=c.tipo_dni AND a.nro_dni=c.nro_dni)
                    INNER JOIN material m ON (a.ID_material=m.ID_material)
                    ";
        //envia la consulta
        $sentencia = $this->getDb()->prepare($consulta); // prepara la consulta
        $sentencia->execute(); // ejecuta
        $acopios = $sentencia->fetchAll(PDO::FETCH_OBJ); // obtiene la respuesta
        return $acopios;
    }

    public function getAllAcopiosByKilos()
    {
        $consulta = "SELECT a.nro_dni,SUM(a.kilos_acopiados) AS kilos_acopiados,m.nombre AS nombre_material
                    FROM acopio a 
                    INNER JOIN material m ON (a.ID_material=m.ID_material)
                    GROUP BY a.ID_material,a.nro_dni
                    ";
        //envia la consulta
        $sentencia = $this->getDb()->prepare($consulta); // prepara la consulta
        $sentencia->execute(); // ejecuta
        $acopios = $sentencia->fetchAll(PDO::FETCH_OBJ); // obtiene la respuesta
        return $acopios;
    }

    public function addAcopio($ID_material, $tipo_dni, $nro_dni, $kilos_acopiados)
    {
        $db = $this->getDb();
        $query = $db->prepare("INSERT INTO acopio (ID_material,tipo_dni,nro_dni,kilos_acopiados) VALUES(?,?,?,?)"); //prepara la consulta
        $query->execute([$ID_material, $tipo_dni, $nro_dni, $kilos_acopiados]); //ejecuta la consulta
    }
}
