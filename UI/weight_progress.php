
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
.button {
    background-color: #1C6EA4;
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 10px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
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
include ('user_header.php');

$uid=$_GET["uid"];

$sql="select * from progress where UserID = ".$uid." order by ProgressDate desc";
$res=$cn->query($sql);
//print_r($res);
$rows = $res->fetchAll();

echo "</table>";
echo "
<table class='blueTable'>
<thead>
<tr>
<th>Progress Date</th>
<th>Weight</th>
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
   		$progressDate=$row["ProgressDate"];
   		$currentWeight=$row["CurrentWeight"];
   	    echo "<tr><td>";  
  		echo $progressDate;
  		echo "</td><td>";    
  		echo $currentWeight;
		echo "</td></tr>";
   }
}
echo"</tbody></table>";
?>
<form name="add_weight" method="POST">
  <input name="uid" type="hidden" value="<?php echo $uid; ?>"> 
  <button class="button button2" formaction="add_weight_log.php">Add</button>
</form>

<?php
//check connection
if($cn->connect_error){
die("Connection failed: " . $cn->connect_error);
}
//echo "Db connected successfully";

mysqli_close($cn);
?>	
</body></html>