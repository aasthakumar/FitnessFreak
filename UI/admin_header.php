<?php

$uid=$_GET["uid"];
?>
<html>
<body>
<ul div>
  <li><a href="admin_home.php?uid=<?php echo $uid; ?>">Home</a></li>
  <li><a href="show_users.php?uid=<?php echo $uid; ?>">Users</a></li>
  <li><a href="show_trainers.php?uid=<?php echo $uid; ?>">Trainers</a></li>
  <li><a href="show_dieticians.php?uid=<?php echo $uid; ?>">Dieticians</a></li>
  <li><a href="show_offers.php?uid=<?php echo $uid; ?>">Offers</a></li>
  <li><a href="usersignin.php">Sign Out</a></li>
</ul>
</body>
</html>


