
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
<?php
require 'connection.php';
include ('user_header.php');


$sql="call prc_ViewExerciseChartRecommendation('".$_GET["uid"]."',@out)";
$res=$cn->query($sql);
//print_r($res);
$rows = $res->fetchAll();


echo "</table>";
echo "
<table class='blueTable'>
<thead>
<tr>
<th>Exercise Name</th>
<th>Calories Burned</th>
<th>DateRecommended</th>
</tr>
</thead>
<tfoot>
<tr>
<td colspan='7'>
</td>
</tr>
</tfoot>
<tbody>";
foreach($rows as $row) {
   if ($row) {
   	    echo "<tr><td>"; 
  		print_r($row['ExerciseName']);
  		echo "</td><td>";   
  		echo $row['CaloriesBurnFormula'];  
      echo "</td><td>";   
      print_r($row['DateRecommended']);  
  				echo "</td></tr>";
   }
}
echo"
</tbody>
</table>";


//check connection
if($cn->connect_error){
die("Connection failed: " . $cn->connect_error);
}
//echo "Db connected successfully";

mysqli_close($cn);
?>	
</body></html>