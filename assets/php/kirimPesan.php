<?php

session_start();
include 'koneksi.php';

    $pengirim = $_SESSION['username'];
$penerima = $_POST['temanObrolan'];
$pesan = $_POST['pesan'];
$sql = "INSERT INTO chat (pengirim, penerima, chat, file) VALUES ('$pengirim', '$penerima', '$pesan', '$filename') ";
if (mysqli_query($conn, $sql) === TRUE){
    $output = 1;
}else{
    $output = 0;
}

echo $output;

?>