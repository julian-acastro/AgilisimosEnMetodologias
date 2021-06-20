<?php

require_once 'system.model.php';

class ModelPedidosDeRetiro extends SystemModel
{
    // Devuelve todos los pedidos
    public function getAllpedidos()
    {
        $consulta = "SELECT p.direccion,p.volumen,c.nombre,c.apellido,m.nombre AS nombre_material
                        FROM pedido p 
                        INNER JOIN ciudadano c ON (p.ciudadano=c.ID_ciudadano) INNER JOIN material m ON (p.material=m.ID_material)
                    ";
        //envia la consulta
        $sentencia = $this->getDb()->prepare($consulta); // prepara la consulta
        $sentencia->execute(); // ejecuta
        $pedidos = $sentencia->fetchAll(PDO::FETCH_OBJ); // obtiene la respuesta
        return $pedidos;
    }
}