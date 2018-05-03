<?php>

//create connection
$dbms = 'mysql';

//Replace the below connection parameters to fit your environment
$host = 'localhost:3306'; 
$db = 'fitnessfreak';
$user = 'root';
$pass = '11223344wifi';
$dsn = "$dbms:host=$host;dbname=$db";

$cn=new PDO($dsn, $user, $pass);

?>