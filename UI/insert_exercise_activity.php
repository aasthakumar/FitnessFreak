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
.button2:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
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
	<?php
require 'connection.php';

$uid = $_POST["uid"];

$q=$cn->exec("call prc_ExerciseDailyActivity_insert('".$_POST["duration"]."', '".$uid."','". $_POST["exercise"]."',@out)");

$res=$cn->query('select @out')->fetchAll();
?>
<strong>
    <?= $res[0][0] ?>
</strong>

<form name="go_to_exercise_progress" method="GET"">
	<input type="hidden" name="uid" value="<?php echo $uid; ?>"/>
	<button class="button button2" formaction="exercise_progress.php">Exercise Progress</button>
</body>

<?php
//check connection
if($cn->connect_error){
die("Connection failed: " . $cn->connect_error);
}
//echo "Db connected successfully";
mysqli_close($cn);
?>



</body>
</html>