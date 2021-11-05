<?php 

$uid = $_POST["uid"];
$checkUser = $_POST["checkUser"];
$lastupdate = $_POST["lastupdate"];
$activityData = json_decode($_POST['activityData'],true);
$activitySummaryData = json_decode($_POST['activitySummaryData'],true);
$sleepData = json_decode($_POST['sleepData'],true);
$stressData = json_decode($_POST['stressData'],true);
$weightData = json_decode($_POST['weightData'],true);
$workoutData = json_decode($_POST['workoutsData'],true);

$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'healthData_'.$uid);

if ($checkUser == '0') {
    $conn2 = new mysqli('localhost', 'alpaca', 'alpaca');
    $sql = "CREATE DATABASE healthData_".$uid;
    $conn2->query($sql);
    $conn2->close();
    $conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'healthData_'.$uid);
    $sql = "CREATE TABLE `activity` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `startTime` DECIMAL(17,7) NOT NULL , `endTime` DECIMAL(17,7) NOT NULL , `calorie` FLOAT(7,3) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB";
    mysqli_query($conn, $sql);
    $sql = "CREATE TABLE `activity_summary` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `startTime` VARCHAR(15) NOT NULL , `activeEnergyBurned` INT(10) NOT NULL , `activeEnergyBurnedGoal` INT(10) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB";
    mysqli_query($conn, $sql);
    $sql = "CREATE TABLE `food` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `startTime` VARCHAR(30) NOT NULL , `name` VARCHAR(20) NOT NULL , `amount` FLOAT(3,1) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB";
    mysqli_query($conn, $sql);
    $sql = "CREATE TABLE `lastupdate` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `date` VARCHAR(30) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB";
    mysqli_query($conn, $sql);
    $sql = "CREATE TABLE `sleep` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `startTime` DECIMAL(17,7) NOT NULL , `endTime` DECIMAL(17,7) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB";
    mysqli_query($conn, $sql);
    $sql = "CREATE TABLE `stress` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `startTime` DECIMAL(17,7) NOT NULL , `stress` INT(10) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB";
    mysqli_query($conn, $sql);
    $sql = "CREATE TABLE `weight` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `startTime` DECIMAL(17,7) NOT NULL , `weight` FLOAT(4,1) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB";
    mysqli_query($conn, $sql);
    $sql = "CREATE TABLE `workout` ( `id` INT(10) NOT NULL AUTO_INCREMENT , `startTime` DECIMAL(17,7) NOT NULL , `endTime` DECIMAL(17,7) NOT NULL , `type` VARCHAR(50) NOT NULL , `calorie` FLOAT(5,1) NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB";
    mysqli_query($conn, $sql);
}

// $date = "0";

// $sql = "select * from lastupdate order by id desc";
// $result = mysqli_query($conn, $sql);
// // echo $sql;
// while($row = mysqli_fetch_array($result)) {
//     $date = $row[1];
//     break;
// }

for($i = 0 ; $i < count($activityData) ; $i++){
    $startTime = $activityData[$i]['startTime'];
    $endTime = $activityData[$i]['endTime'];
    $calorie = $activityData[$i]['calorie'];
    $sql = "
        insert into activity(
            startTime, endTime, calorie
        ) values(
            '{$startTime}',
            '{$endTime}',
            '{$calorie}'
        )
    ";
    mysqli_query($conn, $sql);
}
for($i = 0 ; $i < count($activitySummaryData) ; $i++){
    $startTime = $activitySummaryData[$i]['startTime'];
    $activeEnergyBurned = $activitySummaryData[$i]['activeEnergyBurned'];
    $activeEnergyBurnedGoal = $activitySummaryData[$i]['activeEnergyBurnedGoal'];
    $sql = "
        insert into activity_summary(
            startTime, activeEnergyBurned, activeEnergyBurnedGoal
        ) values(
            '{$startTime}',
            '{$activeEnergyBurned}',
            '{$activeEnergyBurnedGoal}'
        )
    ";
    mysqli_query($conn, $sql);
}
// for($i = 0 ; $i < count($lastupdate) ; $i++){
//     $lastupdate_value = $lastupdate[$i]['lastupdate'];
//     $sql = "
//         insert into lastupdate(
//             date
//         ) values(
//             '{$lastupdate_value}'
//         )
//     ";
//     mysqli_query($conn, $sql);
// }

for($i = 0 ; $i < count($sleepData) ; $i++){
    $startTime = $sleepData[$i]['startTime'];
    $endTime = $sleepData[$i]['endTime'];
    $sql = "
        insert into sleep(
            startTime, endTime
        ) values(
            '{$startTime}',
            '{$endTime}'
        )
    ";
    mysqli_query($conn, $sql);
}
for($i = 0 ; $i < count($stressData) ; $i++){
    $startTime = $stressData[$i]['startTime'];
    $stress = $stressData[$i]['stress'];
    $sql = "
        insert into stress(
            startTime, stress
        ) values(
            '{$startTime}',
            '{$stress}'
        )
    ";
    mysqli_query($conn, $sql);
}
for($i = 0 ; $i < count($weightData) ; $i++){
    $startTime = $weightData[$i]['startTime'];
    $weight = $weightData[$i]['weight'];
    $sql = "
        insert into weight(
            startTime, weight
        ) values(
            '{$startTime}',
            '{$weight}'
        )
    ";
    mysqli_query($conn, $sql);

}
for($i = 0 ; $i < count($workoutData) ; $i++){
    $startTime = $workoutData[$i]['startTime'];
    $endTime = $workoutData[$i]['endTime'];
    $type = $workoutData[$i]['type'];
    $calorie = $workoutData[$i]['calorie'];
    $sql = "
        insert into workout(
            startTime, endTime, type, calorie
        ) values(
            '{$startTime}',
            '{$endTime}',
            '{$type}',
            '{$calorie}'
        )
    ";
    mysqli_query($conn, $sql);
}

$sql = "
    insert into lastupdate(
        date
    ) values(
        '{$lastupdate}'
    )
";
mysqli_query($conn, $sql);

// echo json_encode($activitySummaryData[0]["activeEnergyBurned"]);
echo json_encode($weightData[0]["weight"]);

?>