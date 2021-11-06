<?php 

$uid = $_GET["uid"];
$date = "0";
$tmp = 0;

$list = array();

$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'healthData_'.$uid);
$sql = "select * from food order by id desc";
$result = mysqli_query($conn, $sql);

while($row = mysqli_fetch_array($result)) {
    array_push($list, array("time" => $row['startTime'], "name"=> $row['name'], "amount"=> $row['amount']));
    $tmp = 1;
}

if ($tmp) {
    echo json_encode(array('result'=>$list));
} else {
    echo json_encode(array('result'=>'0'));
}


?>