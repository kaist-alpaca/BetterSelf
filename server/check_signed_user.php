<?php 

$uid = $_GET["uid"];

$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'alpaca');
$sql = "select * from user_uid WHERE uid='{$uid}'";
$check = 0;

$result = mysqli_query($conn, $sql);

$list;

while($row = mysqli_fetch_array($result)) {
    $check = 1;
}

echo json_encode($check);

?>