
<html>
<head>
<title>Update Trainer</title>
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
    $trainerId=$_POST["trainerId"];
    ?>
<form name="frmRegistration" method="post" action="update_trainer.php">
<input type="hidden" name="uid" value="<?php echo $uid; ?>" />
<input type="hidden" name="trainerId" value="<?php echo $trainerId; ?>" />
<table border="0" width="500" align="center" class="demo-table">
<?php if(!empty($success_message)) { ?> 
<div class="success-message"><?php if(isset($success_message)) echo $success_message; ?></div>
<?php } ?>
<?php if(!empty($error_message)) { ?>   
<div class="error-message"><?php if(isset($error_message)) echo $error_message; ?></div>
<?php } ?>
<tr>
<td><font size = 5>First Name</font></td>
<td><input type="text" class="demoInputBox" name="firstName" value="<?php if(isset($_POST['firstName'])) echo $_POST['firstName']; ?>"></td>
</tr>
<tr>
<td><font size = 5>Middle Name</font></td>
<td><input type="text" class="demoInputBox" name="middleName" value="<?php if(isset($_POST['middleName'])) echo $_POST['middleName']; ?>"></td>
</tr>
<tr>
<td><font size = 5>Last Name</font></td>
<td><input type="text" class="demoInputBox" name="lastName" value="<?php if(isset($_POST['lastName'])) echo $_POST['lastName']; ?>"></td>
</tr>
<tr>
<td><font size = 5>Email</font></td>
<td><input type="text" class="demoInputBox" name="userEmail" value="<?php if(isset($_POST['userEmail'])) echo $_POST['userEmail']; ?>"></td>
</tr>
<tr>
<td colspan="2">
    <input type="submit" name="update_trainer" value="Update Trainer" class="btnRegister"></td>
</td>
</tr>
</table>
</form>
</body></html>