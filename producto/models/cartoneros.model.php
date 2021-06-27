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

    public function getAll()
    {
        //envia la consulta
        $sentencia = $this->getDb()->prepare("SELECT * FROM cartonero"); // prepara la consulta
        $sentencia->execute(); // ejecuta
        $cartoneros = $sentencia->fetchAll(PDO::FETCH_OBJ); // obtiene la respuesta
        return $cartoneros;
    }

    /**
     * Traigo todos los datos del cartonero 
     * por el ID que se le pasa por parametro
     */
    public function getUrbanRecuperator($tipo_dni, $nro_dni){

        $db = $this->getDb();
        $query = $db->prepare("SELECT * FROM cartonero WHERE tipo_dni = ? AND nro_dni = ?");
        $query->execute([$tipo_dni, $nro_dni]);
        $urbanRecuperator = $query->fetch(PDO::FETCH_OBJ);

        return $urbanRecuperator;
    }

    /**
     * verifica que no exista un cartonero con el mismo
     * tipo y número de documento
     */
    public function verifyExist($doc_type, $doc_nro){

        $db = $this->getDb();
        $query = $db->prepare("SELECT * FROM cartonero WHERE tipo_dni = ? AND nro_dni = ?");
        $query->execute([$doc_type, $doc_nro]);
        $exist = $query->fetch(PDO::FETCH_OBJ);
        
        return $exist;
    }

    public function confirmEdit($name, $surname, $doc_type, $doc_nro, $adress, $birth, $vehicle, $oldType, $oldNro){
        
        $db = $this->getDb();
        $query = $db->prepare("UPDATE cartonero SET nombre=?, apellido=?, tipo_dni=?, nro_dni=?, direccion=?, fecha_nac=?, vehiculo=? WHERE tipo_dni = ? AND nro_dni = ?");
        $query->execute([$name, $surname, $doc_type, $doc_nro, $adress, $birth, $vehicle, $oldType, $oldNro]);
    }

    //Agrega el Cartonero a la DB
    public function addCartonero($nombre, $apellido, $tipo_dni, $nro_dni, $direccion, $fecha_nac, $vehiculo){
        $db = $this->getDb();
        $query = $db->prepare("INSERT INTO cartonero(tipo_dni, nro_dni, nombre, apellido, direccion, fecha_nac, vehiculo) VALUES(?,?,?,?,?,?,?)");//prepara la consulta
        $query->execute([$tipo_dni, $nro_dni, $nombre, $apellido, $direccion, $fecha_nac, $vehiculo]);//ejecuta la consulta

    }
}