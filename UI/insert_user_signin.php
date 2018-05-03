<html>
<head>
<title>PHP User SignIn Form</title>
<style>
body{
	width:610px;
	font-family:calibri;
}
.error-message {
	padding: 7px 10px;
	background: #fff1f2;
	border: #ffd5da 1px solid;
	color: #d6001c;
	border-radius: 4px;
}
.success-message {
	padding: 7px 10px;
	background: #cae0c4;
	border: #c3d0b5 1px solid;
	color: #027506;
	border-radius: 4px;
}
.demo-table {
	background-image:url('depositphotos_9780666-Healthy-food.jpg');
    top:0;
    left:0;
    min-width:100%;
    min-height:100%;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
   background-size: cover; 
	width: 100%;
	position: absolute;
	
	padding: 300px 170px;
}
.demo-table td {
	padding: 20px 10px;
}
.demoInputBox {
	padding: 10px 30px;
	border: #a9a9a9 1px solid;
	border-radius: 4px;
}
.btnRegister {
	padding: 10px 30px;
	background-color: #3367b2;
	border: 0;
	color: #FFF;
	cursor: pointer;
	border-radius: 4px;
	margin-left: 10px;
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

$q=$cn->exec("call prc_user_signin('".$_POST["UserName"]."','".$_POST["Password"]."',@out)");

$res=$cn->query('select @out')->fetchAll();
print_r($res[0]);
//Write action to txt log
    $log  = "User: ".$_SERVER['REMOTE_ADDR'].' - '.date("F j, Y, g:i a").PHP_EOL.
            "Attempt: ".($res[0]['success']=='1'?'Success':'Failed').PHP_EOL.
            "User: ".$_POST["UserName"].PHP_EOL.
            "Pass: ".md5($_POST["Password"]).PHP_EOL.
            "-------------------------".PHP_EOL;
    //-
    file_put_contents('./log_'.date("j.n.Y").'.txt', $log, FILE_APPEND);

foreach($res[0] as $result) {
	if($result == "Incorrect UserName Password") {
		echo "Incorrect";
		echo '<script type="text/javascript">
				window.location="usersignin.php?status='.$result.'" 
				</script>';
	} else {
		$sql="select fn_get_userrole('".$result."')";
		$res=$cn->query($sql);
		$rows = $res->fetchAll();
		echo "ROle...";
		print_r($rows);
		$user_role=$rows[0][0];
		echo $user_role;
		if ($user_role == 'Admin') {
			echo '<script type="text/javascript">
				window.location="admin_home.php?uid='.$result.'" 
				</script>';

		} else if ($user_role == 'TRAINER') {
			echo '<script type="text/javascript">
				window.location="trainer_home.php?uid='.$result.'" 
				</script>';

		} else if ($user_role == 'DIETICIAN') {
			echo '<script type="text/javascript">
				window.location="dietician_home.php?uid='.$result.'" 
				</script>';

		} else {
			echo '<script type="text/javascript">
				window.location="user_home.php?uid='.$result.'" 
				</script>';
		}
	}
}


//check connection
if($cn->connect_error){
die("Connection failed: " . $cn->connect_error);
}
//echo "Db connected successfully";

mysqli_close($cn);
?>

</body>
</html>