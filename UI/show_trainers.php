<html>
<head>
<title>Exercise Progress</title>
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
   background-size: cover; 
	width: 100%;
	
	background-repeat: no-repeat;
	
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
.buttonsmall {
    background-color: #1C6EA4;
    border: none;
    color: white;
    padding: 12px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 8px;
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
include('admin_header.php');
$uid=$_GET["uid"];

$sql="select * from trainer;";
$res=$cn->query($sql);
$rows = $res->fetchAll();

echo "</table>";
echo "
<table class='blueTable'>
<thead>
<tr>
<th>First Name</th>
<th>Middle Name</th>
<th>Last Name</th>
<th>Email Id</th>
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
      //print_r($row);
      $trainerId=$row['TrainerID'];
      $firstName=$row['FirstName'];
      $middleName=$row['MiddleName'];
      $lastName=$row['LastName'];
      $emailAddress=$row['EmailAddress'];
      print_r($userid);
   	  echo "<tr><td>"; 
  		echo $firstName;
  		echo $trainerId;
  		echo "</td><td>";   
  		echo $middleName;
  		echo "</td><td>";    
  		echo $lastName;
  		echo "</td><td>";
  		echo $emailAddress;
      echo "</td><td>";
      echo "<form method='POST'>";
      echo "<input type='hidden' name='uid' value=".$uid.">";
      echo "<input type='hidden' name='trainerId' value='".$trainerId."'>";
      echo "<input type='hidden' name='firstName' value='".$firstName."'>";
      echo "<input type='hidden' name='middleName' value='".$middleName."'>";
      echo "<input type='hidden' name='lastName' value='".$lastName."'>";
      echo "<input type='hidden' name='userEmail' value='".$emailAddress."'>";
      echo "<button class='buttonsmall button2' formaction='update_trainer_form.php'>Update</button>";
      echo "</form>";
  	echo "</td></tr>";
   }
}
echo"</tbody></table>";
?>
<form name="add_trainer" method="POST">
	<input type="hidden" name="uid" value="<?php echo $uid; ?>">
  	<button class="button button2" formaction="add_trainer.php">Add</button>
</form>

<?php
mysqli_close($cn);
?>	
</body></html>