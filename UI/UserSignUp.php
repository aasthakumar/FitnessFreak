
<html>
<head>
<title>PHP User Registration Form</title>
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
<form name="frmRegistration" method="post" action="insert_user_signup.php">
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
<td><input type="text" class="demoInputBox" name="middleName" value="<?php if(isset($_POST['middleName'])) echo $_POST['firstName']; ?>"></td>
</tr>
<tr>
<td><font size = 5>Last Name</font></td>
<td><input type="text" class="demoInputBox" name="lastName" value="<?php if(isset($_POST['lastName'])) echo $_POST['lastName']; ?>"></td>
</tr>
<tr>
<td><font size = 5>Password</font></td>
<td><input type="password" class="demoInputBox" name="password" value=""></td>
</tr>
<tr>
<td><font size = 5>Confirm Password</font></td>
<td><input type="password" class="demoInputBox" name="confirm_password" value=""></td>
</tr>
<tr>
<td><font size = 5>Height</font></td>
<td><input type="text" class="demoInputBox" name="height" value=""></td>
</tr>
<tr>
<td><font size = 5>Weight</font></td>
<td><input type="text" class="demoInputBox" name="Weight" value=""></td>
</tr>
<tr>
<td><font size = 5>Date Of Birth</font></td>
<td><input type="Date" class="demoInputBox" name="DOB" value=""></td>
</tr>
<tr>
<td><font size = 5>Street Address</font></td>
<td><input type="text" class="demoInputBox" name="staddr" value=""></td>
</tr>
<tr>
<td><font size = 5>City</font></td>
<td><input type="text" class="demoInputBox" name="city" value=""></td>
</tr>
<tr>
<tr>
<td><font size = 5>State</font></td>
<td><input type="text" class="demoInputBox" name="state" value=""></td>
</tr>
<tr>
<td><font size = 5>Country</font></td>
<td><input type="text" class="demoInputBox" name="country" value=""></td>
</tr>
<tr>
<td><font size = 5>ZipCode</font></td>
<td><input type="text" class="demoInputBox" name="ZipCode" value=""></td>
</tr>
<td><font size = 5>Email</font></td>
<td><input type="text" class="demoInputBox" name="userEmail" value="<?php if(isset($_POST['userEmail'])) echo $_POST['userEmail']; ?>"></td>
</tr>
<tr>
<td><font size = 5>GoalWeight</font></td>
<td><input type="text" class="demoInputBox" name="GoalWeight" value=""></td>
</tr>
<tr>
<tr>
<td><font size = 5>DaysToAchieveGoal</font></td>
<td><input type="text" class="demoInputBox" name="DaysToAchieveGoal" value=""></td>
</tr>
<tr>
<td><font size = 5>Plan Option</font></td>
<td><input type="radio" name="planoption" value="100" <?php if(isset($_POST['planoption']) && $_POST['planoption']=="100") { ?>checked<?php  } ?>> 100
<input type="radio" name="planoption" value="150" <?php if(isset($_POST['planoption']) && $_POST['gender']=="150") { ?>checked<?php  } ?>> 150
<input type="radio" name="planoption" value="200" <?php if(isset($_POST['planoption']) && $_POST['gender']=="200") { ?>checked<?php  } ?>> 200

</td>
</tr>
<tr>
<td colspan=2>
<input type="checkbox" name="terms"> I accept Terms and Conditions <input type="submit" name="register-user" value="Make Me Healthy" class="btnRegister"></td>
</tr>
</table>
</form>
</body></html>