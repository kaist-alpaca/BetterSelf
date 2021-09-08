<?php
$conn = mysqli_connect('localhost', 'alpaca', 'alpaca', 'alpaca');

$sql = "
    insert into topic(
        title, description, created
    ) value(
        'MySQL',
        'MySQL is..',
        now()
    )";

mysqli_query($conn, $sql);

echo mysqli_error($conn);
?>