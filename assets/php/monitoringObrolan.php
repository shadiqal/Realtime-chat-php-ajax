<?php

session_start();

include 'koneksi.php';
$username = $_SESSION['username'];
$temanObrolan = $_POST['temanObrolan'];
$output = '';

// Mencari Data teman obrolan
$cari = "SELECT * FROM user WHERE username = '$temanObrolan' LIMIT 1";
$dapat = mysqli_query($conn, $cari);
$data = mysqli_fetch_array($dapat);
$gambarTemanObrolan = $data['gambar'];

// Mencari Data histori obrolan
$sql = "SELECT * FROM chat WHERE 
        (user1 = '$username' AND user2 = '$temanObrolan') 
        OR 
        (user1 = '$temanObrolan' AND user2 = '$username')
        ORDER BY id ASC";

$query = mysqli_query($conn, $sql);

while ( $data = mysqli_fetch_array($query) ){


        $user1 = $data['user1'];
        $user2 = $data['user2'];
        $chat = $data['chat'];
        $waktu = $data['chatTime'];
        
        if (($user1 == $username)){
            $output .= '
                        <div class="outgoing_msg">
                            <div class="sent_msg">
                                <p>'.$chat.'</p>
                                <span class="time_date"> '.$waktu.'</span>
                            </div>
                        </div>
                    ';
        } else {
            $output .= '
                        <div class="incoming_msg">
                            <div class="incoming_msg_img"> <img src="../assets/image/profile/'.$gambarTemanObrolan.'" alt="sunil">
                            </div>
                            <div class="received_msg">
                                <div class="received_withd_msg">
                                    <p>'.$chat.'</p>
                                <span class="time_date"> '.$waktu.'</span>
                                </div>
                            </div>
                        </div>
                    ';
        }
        $output .= '<input type="hidden" id="temanObrolan" value="'.$temanObrolan.'">';
    

}
echo $output;

?>