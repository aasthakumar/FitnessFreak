<?php

$uid=$_GET["uid"];
?>
<html>
<body>
<ul div>
  <li><a href="trainer_home.php?uid=<?php echo $uid; ?>">Home</a></li>
  <li><a href="show_exercises.php?uid=<?php echo $uid; ?>">Exercises</a></li>
  <li><a href="usersignin.php">Sign Out</a></li>
</ul>
</body>
</html>


