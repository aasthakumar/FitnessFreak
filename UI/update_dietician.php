<html>
<head>
<title>Update Trainer</title>
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
$dieticianId= $_POST["dieticianId"];

$q=$cn->exec("call prc_update_dietician('".$uid."', '".$dieticianId."', '".$_POST["firstName"]."', '".$_POST["middleName"]."',
    '".$_POST["lastName"]."', '".$_POST["position"]."' ,'".$_POST["userEmail"]."', @out)");

$res=$cn->query('select @out')->fetchAll();
?>
<strong>
    <?php echo $res[0][0]; ?>
</strong>
<?php

$log  = "User: ".$_SERVER['REMOTE_ADDR'].' - '.date("F j, Y, g:i a").PHP_EOL.
            "Attempt: ".($res[0]['success']=='1'?'Success':'Failed').PHP_EOL.
            "User: ".$_POST["UserName"].PHP_EOL.
            "Pass: ".md5($_POST["Password"]).PHP_EOL.
            "-------------------------".PHP_EOL;
    //-
    file_put_contents('./log_'.date("j.n.Y").'.txt', $log, FILE_APPEND);

?>

<form name="go_to_show_dieticians" method="GET">
	<input type="hidden" name="uid" value="<?php echo $uid; ?>"/>
	<button class="button button2" formaction="show_dieticians.php">Dieticians</button>
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