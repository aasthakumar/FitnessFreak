
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
<form name="frmSignIn" method="post" action="insert_user_signin.php">
<table border="0" width="500" align="center" class="demo-table">
<?php if(!empty($success_message)) { ?>	
<div class="success-message"><?php if(isset($success_message)) echo $success_message; ?></div>
<?php } ?>
<?php if(!empty($error_message)) { ?>	
<div class="error-message"><?php if(isset($error_message)) echo $error_message; ?></div>
<?php } ?>
<tr>
<td><font size = 5>UserName</font></td>
<td><input type="text" class="demoInputBox" name="UserName" value=""></td>
</tr>
<tr>
<td><font size = 5>Password</font></td>
<td><input type="password" class="demoInputBox" name="Password" value=""></td>
</tr>
<tr>
<td>
<input type="submit" name="register-user" value="Make Me Healthy" class="btnRegister"></td>
</tr>
</table>
</form>
</body></html>