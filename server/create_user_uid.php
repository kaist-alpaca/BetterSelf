<?php 

$uid = $_GET["uid"];
$photoURL = $_GET["photoURL"];

$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'alpaca');
$sql = "select * from topic";
$sql = "
    insert into user_uid(
        uid
    ) values(
        '{$uid}',
        '{$_POST['description']}',
        NOW()
    )
";


echo "dfdss";

?>