<?php

$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'food');
$uid = $_GET["uid"];
$photoURL = $_GET["photoURL"];
// $sql = "SHOW TABLES";
// $result = $conn->query($sql);
// $uid = $_GET["uid"];
// $tmp = 1;

// while ( $tables = $result->fetch_array()) {
//     echo $tables[0];
//     if ($tables[0] == $uid) {
//     $tmp = 0;
//     }
// }
// if ($tmp == 1) {
//     echo "안녕";
//     $sql = "CREATE TABLE `food`.`{$uid}` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `date` VARCHAR(20) NOT NULL, `num` INT(10) NOT NULL, PRIMARY KEY (`id`)) ENGINE = InnoDB";
//     mysqli_query($conn, $sql);
// }
// $sql = "
// insert into `{$uid}`(
//     date, num
// ) value(
//     '20211003',
//     12
// )";
// mysqli_query($conn, $sql);




$sql = "select * from `{$uid}` WHERE photoURL='{$photoURL}'";
$result = mysqli_query($conn, $sql);
if(mysqli_num_rows($result) > 0) {
    echo 1;
} else {
    echo 0;
}


// while($row = mysqli_fetch_array($result)) {
//     $list = array("result" => "1" , "user_uid" => $row['user_uid'], "email"=> $row['email'], "user_name"=> $row['user_name']);
//     $tmp = 1;
// }

// if ($tmp) {
//     // echo json_encode($list);
//     echo json_encode(array('result_code' => '200', 'result'=>$list));
// } else {
//     // echo json_encode(array("result" => "0"));
//     echo json_encode(array('result_code' => '200', 'result'=>'0'));
// }

?>