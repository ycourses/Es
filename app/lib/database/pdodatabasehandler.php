<?php
namespace PHPMVC\LIB\Database;

class PDODatabaseHandler extends DatabaseHandler
{
    private static $_instance;
    private static $_handler;

    function __construct()	{
        self::init();
    }
    public function __call($name,$arguments)
    {
        return call_user_func_array(array(&self::$_handler, $name),$arguments);
    }

    protected static function init()
    {

        try{
            self::$_handler=new \PDO('mysql://hostname='.DATABASE_HOST_NAME.';dbname='.
                DATABASE_DB_NAME,DATABASE_USERNAME,DATABASE_PASSWORD, array(\PDO::ATTR_ERRMODE => \PDO::ERRMODE_WARNING,
                \PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'));
        }catch(\PDOException $e){
            echo 'Sory your may not have access to the database server.';
        }


    }

    public static function getInstance()
    {
        if(self::$_instance === null){
            self::$_instance  = new self();
        }
        return self::$_instance;
    }
}
