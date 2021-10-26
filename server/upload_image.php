<?php 

$uid = $_GET["uid"];
$photoURL = $_GET["photoURL"];
echo (copy($photoURL, "./img/profile/{$uid}.jpg"))

?>