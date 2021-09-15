<?php
$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'alpaca');
$sql = "select * from topic";
$list = '';
$result = mysqli_query($conn, $sql);
while($row = mysqli_fetch_array($result)) {
    $list = $list."<li><a href=\"index.php?id={$row['id']}\">{$row['title']}</a></li>";
}

$article = array(
    'title'=>'Welcome',
    'description'=>'Hello, we are Team ALPACA'
);
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>

<body>
    <h1><a href="index.php">ALPACA</a></h1>
    <ol>
        <?=$list?>
    </ol>
    <form action="process_create.php" method="POST">
        <p><input type="text" name="title" placeholder="title"></p>
        <p><textarea name="description" placeholder="description"></textarea></p>
        <p><input type="submit"></p>
    </form>
</body>

</html>
