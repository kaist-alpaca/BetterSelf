<?php 

$uid = $_GET["uid"];

$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'alpaca');
$sql = "select * from user_info WHERE user_uid='{$uid}'";
$tmp = 0;

$result = mysqli_query($conn, $sql);

$list;

while($row = mysqli_fetch_array($result)) {
    $list = array("result" => "1" , "user_uid" => $row['user_uid'], "email"=> $row['email'], "user_name"=> $row['user_name']);
    $tmp = 1;
}

if ($tmp) {
    // echo json_encode($list);
    echo json_encode(array('result_code' => '200', 'result'=>$list));
} else {
    // echo json_encode(array("result" => "0"));
    echo json_encode(array('result_code' => '200', 'result'=>'0'));
}

?>