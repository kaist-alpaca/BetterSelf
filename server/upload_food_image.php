<?php 

$uid = $_GET["uid"];
$index = $_GET["index"];
$photoURL = $_GET["photoURL"];

// 임시로 저장된 정보(tmp_name)
$tempFile = $_FILES['imgFile']['tmp_name'];

// 파일타입 및 확장자 체크
$fileTypeExt = explode("/", $_FILES['imgFile']['type']);

// 파일 타입 
$fileType = $fileTypeExt[0];

// 이미지 파일이 맞는지 검사. 
if($fileType == 'application' || $fileType == 'image'){
    // 임시 파일 옮길 디렉토리 및 파일명
    // $resFile = "./img/{$_FILES['imgFile']['name']}";
    // $resFile = "./img/food/{$uid}/.{$photoURL}.jpg";
    $resFile = "./img/food/{$uid}.{$photoURL}.jpg";
    // 임시 저장된 파일을 우리가 저장할 디렉토리 및 파일명으로 옮김
    $imageUpload = move_uploaded_file($tempFile, $resFile);

    $conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'food');
    $sql = "SHOW TABLES";
    $result = $conn->query($sql);
    $uid = $_GET["uid"];
    $tmp = 1;

    while ( $tables = $result->fetch_array()) {
        // echo $tables[0];
        if ($tables[0] == $uid) {
        $tmp = 0;
        }
    }
    if ($tmp == 1) {
        // echo "안녕";
        $sql = "CREATE TABLE `food`.`{$uid}` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `photoURL` VARCHAR(25) NOT NULL, PRIMARY KEY (`id`)) ENGINE = InnoDB";
        mysqli_query($conn, $sql);
    }
    
    $sql = "select * from `{$uid}` WHERE photoURL='{$photoURL}'";
    $result = mysqli_query($conn, $sql);
    if(mysqli_num_rows($result) == 0) {
        $sql = "
        insert into `{$uid}`(
            photoURL
        ) value(
            '{$photoURL}'
        )";
        mysqli_query($conn, $sql);
    }
    
    // 업로드 성공 여부 확인
    if($imageUpload == true){
        echo json_encode("true");
    }else{
        // echo "fail";
        echo "fail";
    }
}   // end if - filetype
    // 파일 타입이 image가 아닌 경우 
else {
    echo "fail";
    echo ($fileType);
    exit;
}

?>