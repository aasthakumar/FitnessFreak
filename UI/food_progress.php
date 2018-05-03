
<html>
<head>
<title>Food Progress</title>
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
		<button class="button buttonsmall" formaction="food_progress.php">View</button>
	</form>
<?php
$sql="call prc_view_foodprogress('".$uid."','".$dt."')";
$res=$cn->query($sql);
//print_r($res);
$rows = $res->fetchAll();
echo "</table>";
echo "
<table class='blueTable'>
<thead>
<tr>
<th>Food Name</th>
<th>Quantity</th>
<th>Meal Type</th>
<th>Date of Consumption</th>
<th>Daily Calorie Limit</th>
<th>Calories Consumed</th>
</tr>
</thead>
<tfoot>
<tr>
<td colspan='7'>
</td>
</tr>
</tfoot>
<tbody>";
$total_calories_consumed = 0;
$daily_calories_limit = 0;
foreach($rows as $row) {
   if ($row) {
   		$foodLogId=$row["FoodLogID"];
   		$foodName=$row["FoodName"];
   		$quantity=$row["Quantity"];
   		$mealType=$row["MealType"];
   	    echo "<tr><td>";  
  		echo $foodName;
  		echo "</td><td>";    
  		echo $quantity;
  		echo "</td><td>";
  		echo $mealType;
  		echo "</td><td>";   
  		echo $row['DateOfConsumption'];
  		echo "</td><td>"; 
  		echo $row['DailyCalorieLimit']; 
  		$daily_calories_limit = $row['DailyCalorieLimit'];		
  		echo "</td><td>";
		echo $row['CaloriesConsumed'];
  		$total_calories_consumed += $row['CaloriesConsumed'];
  		echo "</td><td>";
  		echo "<form method='POST'>";
        echo "<input type='hidden' name='uid' value='".$uid."'>";
      	echo "<input type='hidden' name='foodLogId' value='".$foodLogId."'>";
      	echo "<button class='buttonsmall button2' formaction='delete_food_log.php'>Delete</button>";
      	echo "</form>";
		echo "</td></tr>";
   }
}
echo "<tr><td></td><td></td><td></td><td><td><b>Total Calories Consumed</b></td><td><b>";
echo $total_calories_consumed;
echo "</b></td></tr>";
echo "<tr><td></td><td></td><td></td><td><td><b>Remaining Calories For Day</b></td><td><b>";
echo $daily_calories_limit - $total_calories_consumed;
echo "</b></td></tr>";

echo"
</tbody>
</table>";
?>
<form name="add_food" method="POST">
  <input name="uid" type="hidden" value="<?php echo $uid; ?>"> 
  <button class="button button2" formaction="add_food_log.php">Add</button>
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