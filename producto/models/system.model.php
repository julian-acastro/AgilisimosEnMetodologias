<?php

class SystemModel
{
    private $db;

    public function __construct()
    {
        // 1. abro la conexión con MySQL 
        $this->db = $this->buildConection();
    }

    public function getDb()
    {
        return $this->db;
    }

    public function buildConection()
    {
        $host = 'localhost';
        $userName = 'root';
        $password = '';
        $database = 'db_coop_cartoneros';

        try {
            $pdo = new PDO("mysql:host=$host;dbname=$database;charset=utf8", $userName, $password);

            // solo en modo desarrollo
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_WARNING);
        } catch (Exception $e) {
            var_dump($e);
        }
        return $pdo;
    }
}