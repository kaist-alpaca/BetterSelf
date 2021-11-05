<?php 

$uid = $_GET["uid"];
$date = "0";

$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'healthData_'.$uid);
$sql = "select * from lastupdate order by id desc";
$result = mysqli_query($conn, $sql);
// echo $sql;
while($row = mysqli_fetch_array($result)) {
    $date = $row[1];
    break;
}

echo json_encode($date);

?>