
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
<form name="frmRegistration" method="post" action="insert_offer.php">
<input type="hidden" name="uid" value="<?php echo $uid; ?>" />
<table border="0" width="500" align="center" class="demo-table">
<?php if(!empty($success_message)) { ?> 
<div class="success-message"><?php if(isset($success_message)) echo $success_message; ?></div>
<?php } ?>
<?php if(!empty($error_message)) { ?>   
<div class="error-message"><?php if(isset($error_message)) echo $error_message; ?></div>
<?php } ?>
<tr>
<td><font size = 5>Offer Details</font></td>
<td><input type="text" class="demoInputBox" name="offerDetails" value="<?php if(isset($_POST['offerDetails'])) echo $_POST['offerDetails']; ?>"></td>
</tr>
<tr>
<td><font size = 5>Valid Till</font></td>
<td><input type="date" class="demoInputBox" name="validTill" value="<?php if(isset($_POST['validTill'])) echo $_POST['validTill']; ?>"></td>
</tr>
<tr>
<td><font size = 5>Applicable To Tier</font></td>
    <td><select style="width:150" name="applicableToTier" >
            <option value="Silver">Silver</option>
            <option value="Gold">Gold</option>
            <option value="Platinum">Platinum</option>
  </select></td>
 </tr>
<tr>
<td colspan="2">
    <input type="submit" name="add_offer" value="Add Offer" class="btnRegister"></td>
</td>
</tr>
</table>
</form>
</body></html>