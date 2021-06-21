<?php

require_once 'system.model.php';

class CiudadanosModel extends SystemModel {
    public function addCiudadano($nombre, $apellido, $direccion, $telefono){
        $db = $this->getDb();
        $query = $db->prepare("INSERT INTO ciudadano(nombre, apellido, direccion, telefono) VALUES(?,?,?,?)");//prepara la consulta
        $query->execute([$nombre, $apellido, $direccion, $telefono]);//ejecuta la consulta
        $lastId = $this->getDb()->lastInsertId();
        return  $lastId;
    }
}