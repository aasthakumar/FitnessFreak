<?php

$uid=$_GET["uid"];
?>
<html>
<body>
<ul div>
  <li><a href="dietician_home.php?uid=<?php echo $uid; ?>">Home</a></li>
  <li><a href="show_diet_charts.php?uid=<?php echo $uid; ?>">Diet Charts</a></li>
  <li><a href="usersignin.php">Sign Out</a></li>
</ul>
</body>
</html>