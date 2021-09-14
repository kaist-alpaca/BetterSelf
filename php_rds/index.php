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
$update_link = '';
$delete_link = '';
if(isset($_GET['id'])){
    $sql = "select * from topic where id={$_GET['id']}";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_array($result);
    $article['title'] = $row['title'];
    $article['description'] = $row['description'];

    $update_link = '<a href="update.php?id='.$_GET['id'].'">update</a>';
    $delete_link = '
        <form action="process_delete.php" method="post">
            <input type="hidden" name="id" value="'.$_GET['id'].'">
            <input type="submit" value="delete">
        </form>
    ';
}
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
    <a href="create.php">create</a>
    <?=$update_link?>
    <?=$delete_link?>
    <h2><?=$article['title']?></h2>
    <?=$article['description']?>
</body>

</html>