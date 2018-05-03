
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
<?php
require 'connection.php';
include ('user_header.php');

$uid=$_GET["uid"];

if(isset($_GET["dt"])) {
  $dt=$_GET["dt"];
} else {
  $now = new DateTime();
  $now->setTimezone(new DateTimeZone('America/New_York'));
  $dt = $now->format('Y-m-d');
}
?>

<form name="food_progress" method="GET">
    <input type="date" id="dt" name="dt" value="<?php echo $dt; ?>">
    <input name="uid" type="hidden" value="<?php echo $uid; ?>"> 
    <button class="button buttonsmall" formaction="exercise_progress.php">View</button>
</form>

<?php
$sql="call prc_view_progress_exerciseprogress('".$uid."','".$dt."')";
$res=$cn->query($sql);
$rows = $res->fetchAll();


echo "</table>";
echo "
<table class='blueTable'>
<thead>
<tr>
<th>Calories Burned</th>
<th>Exercise Name</th>
<th>WorkOutDuration(Minutes)</th>
<th>Date of Activity</th>
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
      $activity_id=$row['ActivityID'];
   	  echo "<tr><td>"; 
  		print_r($row['Calories_Burned']);
  		echo "</td><td>";   
  		echo $row['exercisename'];
  		echo "</td><td>";    
  		echo $row['WorkoutDurationInMinutes'];
  		echo "</td><td>";
  		echo $row['DateOfActivity'];
      echo "</td><td>";
      echo "<form method='POST'>";
      echo "<input type='hidden' name='activity_id' value='".$activity_id."'>";
      echo "<button class='buttonsmall button2' formaction='update_exercise.php'>Update</button>";
      echo "<button class='buttonsmall button2' formaction='delete_exercise.php'>Delete</button>";
      echo "</form>";
  		echo "</td></tr>";
   }
}
echo"</tbody></table>";

?>
<form name="add_exercise" method="POST">
  <input name="uid" type="hidden" value="<?php echo $uid; ?>"> 
  <button class="button button2" formaction="add_exercise_log.php">Add</button>
</form>

<?php
mysqli_close($cn);
?>	
</body></html>