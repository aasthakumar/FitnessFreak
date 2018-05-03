<?php
require 'connection.php';

$sql="select fn_get_usertype('".$_GET["uid"]."')";
$res=$cn->query($sql);
$rows = $res->fetchAll();
$user_type=$rows[0][0];
?>
<html>
<body>
<ul>
  <li><a href="user_home.php?uid=<?php echo $_GET['uid'] ?>">Home</a></li>
  <li><a href="weight_progress.php?uid=<?php echo $_GET['uid'] ?>">Weight Progress</a></li>
  <li><a href="food_progress.php?uid=<?php echo $_GET['uid'] ?>">Food Progress</a></li>
  <li><a href="exercise_progress.php?uid=<?php echo $_GET['uid'] ?>">Exercise Progress</a></li>
  <?php
  	if ($user_type == "GOLD" || $user_type == "PLATINUM") { 
  		#echo '<li>TEST</li>';
  		echo "<li><a href='diet_chart.php?uid=".$_GET['uid']."'>Diet Chart</a></li>";
  }
  ?>
  <?php
  	if ($user_type == "PLATINUM") { 
  		#echo '<li>TEST</li>';
  		echo "<li><a href='exercise_chart.php?uid=".$_GET['uid']."'>Exercise Chart</a></li>";
  }
  ?>
  <li><a href="usersignin.php">Sign Out</a></li>
</ul>
</body>
</html>


