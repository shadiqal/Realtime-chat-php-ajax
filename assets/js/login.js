function validasi() {
    valid = /^[A-Za-z-9]{1,}$/;
    var username = $('#username').val();
    var password = $('#password').val();
    if ((username == '') || (password == '')) {
        $('#pesan').text("Username atau password tidak boleh kosong");
    } else {
        if (!valid.test(username)) {
            $('#pesan').text("Format inputan tidak di izinkan");
        } else {
            cekLogin(username, password);
        }
    }
}



function cekLogin(username, password) {
    $(document).ready(function () {
        $.ajax({
            url: "assets/php/cekLogin.php",
            type: "POST",
            data: {
                username: username,
                password: password
            }
        }).done(function (data) {
            console.log(data);
            if (data == 0) {
                $('#pesan').text("Username atau password yang anda masukkan salah");
            } else {
                window.location = 'pages/chat.html?username=' + username;
            }
        })
    })
}