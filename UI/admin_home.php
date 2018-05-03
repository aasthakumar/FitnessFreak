
<html>
<head>
<title>PHP User SignIn Form</title>
<link rel="stylesheet" href="table.css">
<style>
ul {
    list-style-type: none;
    margin: 0;
    padding: 20;
}

li {
    display: inline;
    padding: 5;
    font-size: 20px;
}
body{
	background-image:url('depositphotos_9780666-Healthy-food.jpg');
	width:400px;
	font-family:calibri;
	top:0;
    left:0;
    min-width:100%;
    min-height:100%;
    
   background-size: cover; 
	width: 100%;
	
	background-repeat: no-repeat;
	overflow: hidden;
	padding: 300px 170px;
	
}
</style>

</head>
<body>
	<div>
  <style>
div {
  position: absolute;
  top: 25%;
  left: 40%;
}</style>
<h1><font color="#1C6EA4">Fitness Freak</font></h1>
</div>
<?php
require 'connection.php';
include ('admin_header.php');


echo "Welcome To Fitness Freak!";

//check connection
if($cn->connect_error){
die("Connection failed: " . $cn->connect_error);
}
//echo "Db connected successfully";

mysqli_close($cn);
?>	
</body></html>