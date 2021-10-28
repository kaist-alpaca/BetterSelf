<?php 

$uid = $_GET["uid"];
$email = $_GET["email"];
$user_name = $_GET["user_name"];

$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'alpaca');
$sql = "
    insert into user_uid(
        uid
    ) values(
        '{$uid}'
    )
";
mysqli_query($conn, $sql);
$sql = "
    insert into user_info(
        user_uid, email, user_name
    ) values(
        '{$uid}',
        '{$email}',
        '{$user_name}'
    )
";
mysqli_query($conn, $sql);

echo ("1");

?>