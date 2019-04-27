<?php

session_start();
include 'koneksi.php';
$keyword = $_POST['keyword'];
$username = $_SESSION['username'];
$output = array();
$var = array();

$sql = "SELECT * FROM user WHERE namaLengkap LIKE '%$keyword%'";
$query = mysqli_query($conn, $sql);

while ( $data = mysqli_fetch_array($query) ){
    $var['username'] = $username;
    $var['namaLengkap'] = $data['namaLengkap'];
    $var['temanObrolan'] = $data['username'];
    $var['gambar'] = $data['gambar'];

    array_push($output, $var);
}

echo json_encode($output);

?>