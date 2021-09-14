<?php
$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'alpaca');

$sql = "select * from topic limit 1000";
$result = mysqli_query($conn, $sql);
$row = mysqli_fetch_array($result);
echo '<h1>'.$row['title'].'</h1>';
echo $row['description'];

?>