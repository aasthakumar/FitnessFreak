<html>
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

// echo $_POST["streetaddr"];
$q=$cn->exec("call prc_user_signup('". $_POST["firstName"]."','". $_POST["middleName"]."','". $_POST["lastName"]."','". $_POST["password"]."','". $_POST["height"]."','". $_POST["planoption"]."','". $_POST["Weight"]."','". $_POST["DOB"]."','". $_POST["staddr"]."','". $_POST["city"]."','". $_POST["state"]."','". $_POST["country"]."','". $_POST["ZipCode"]."','". $_POST["userEmail"]."','". $_POST["GoalWeight"]."','". $_POST["DaysToAchieveGoal"]."',@out)");

$res=$cn->query('select @out')->fetchAll();
//print_r($res);

foreach($res[0] as $result) {
   echo $result . "\n";
   if($result == "User Successfully Added") {
   		echo '<script type="text/javascript">
				window.location="usersignin.php" 
				</script>';
   } else {
   		echo '<script type="text/javascript">
				window.location="UserSignUp.php"
				</script>';
   }
}

//check connection
if($cn->connect_error){
die("Connection failed: " . $cn->connect_error);
}
//echo "Db connected successfully";
echo $_POST["staddr"];
mysqli_close($cn);
?>
</body>
</html>