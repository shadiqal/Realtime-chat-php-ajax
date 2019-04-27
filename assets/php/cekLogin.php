<?php
session_start();
include 'koneksi.php';

$username = mysqli_real_escape_string($conn, $_POST['username']);
$password = mysqli_real_escape_string($conn, $_POST['password']);

$sql = "SELECT * FROM user WHERE username='$username' AND password = '$password'";

$query = mysqli_query($conn, $sql);

$data = mysqli_fetch_array($query);

if ($data > 0){
    $_SESSION['username']= $username;
    echo $username;
}
else{
    echo 0;
}



?>