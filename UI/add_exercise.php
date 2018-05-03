
<html>
<head>
<title>Add Exercise</title>
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
    <?php
    $uid=$_POST["uid"];
    ?>
<form name="frmRegistration" method="post" action="insert_exercise.php">
<input type="hidden" name="uid" value="<?php echo $uid; ?>" />
<table border="0" width="500" align="center" class="demo-table">
<?php if(!empty($success_message)) { ?> 
<div class="success-message"><?php if(isset($success_message)) echo $success_message; ?></div>
<?php } ?>
<?php if(!empty($error_message)) { ?>   
<div class="error-message"><?php if(isset($error_message)) echo $error_message; ?></div>
<?php } ?>
<tr>
<td><font size = 5>Exercise Name</font></td>
<td><input type="text" class="demoInputBox" name="exerciseName" value="<?php if(isset($_POST['exerciseName'])) echo $_POST['exerciseName']; ?>"></td>
</tr>
<tr>
<td><font size = 5>Duration</font></td>
<td><input type="text" class="demoInputBox" name="duration" value="<?php if(isset($_POST['duration'])) echo $_POST['duration']; ?>"></td>
</tr>
<tr>
<td><font size = 5>Calories Burned</font></td>
<td><input type="text" class="demoInputBox" name="caloriesBurned" value="<?php if(isset($_POST['caloriesBurned'])) echo $_POST['caloriesBurned']; ?>"></td>
</tr>
<tr>
<td colspan="2">
    <input type="submit" name="add_exercise" value="Add Exercise" class="btnRegister"></td>
</td>
</tr>
</table>
</form>
</body></html>