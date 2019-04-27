//Inisiasi 
function inisiasi() {
    var interval;
    daftarObrolan();
}


//Proses Updating dan kirim Pesan
function daftarObrolan() {
    $(document).ready(function () {
        list = '';
        $.ajax({
            url: '../assets/php/daftarObrolan.php',
        }).done(function (data) {
            var data = JSON.parse(data);
            for (var i = 0; i < data.length; i++) {
                var list = '<div class = "chat_list" >' +
                    '<div class="chat_people" style="cursor: pointer;" onclick="manage(\'' + data[i]['temanObrolan'] + '\')"> ' +
                    '<div class="chat_img">' +
                    '<img src="../assets/image/profile/' + data[i]['gambar'] + '" alt="">' +
                    '</div>' +
                    '<div class = "chat_ib" >' +
                    '<h5>' + data[i]['namaLengkap'] + '<span class = "chat_date" > Status: </span></h5>' +
                    '<p ></p>' +
                    ' </div>' +
                    '</div>' +
                    '</div>';
                $(list).appendTo('#daftarObrolan');

            }
        });
    })
}
function manage(temanObrolan) {
    this.teman = temanObrolan;
    clearInterval(this.intervalID);
    this.intervalID = setInterval(function () {
        loadHistoriObrolan(temanObrolan)
    }, 500);
}
function loadHistoriObrolan(temanObrolan) {
    $.ajax({
        url: '../assets/php/historiObrolan.php',
        type: 'POST',
        data: {
            temanObrolan: temanObrolan
        }
    }).done(function (response) {
        $('#historiObrolan').html(response)
    });
}
function kirimPesan(pesan) {
    var temanObrolan = this.teman;
    var pesan = pesan;
    $('#pesan').val('');
    $.ajax({
        url: '../assets/php/kirimPesan.php',
        type: 'POST',
        data: {
            temanObrolan: temanObrolan,
            pesan: pesan
        }
    }).done(function (response) {
        manage(temanObrolan);
        $('#pesan').val('');
    });
}

//Fitur 
function cariTemanObrolan() {
    var keyword = $('#keyword').val();
    clearInterval(this.intervalID);
    $('#daftarObrolan').text('');
    $('#historiObrolan').text('');
    if (keyword == '') {
        daftarObrolan();
    } else {
        list = '';
        $.ajax({
            url: '../assets/php/cariTemanObrolan.php',
            type: 'POST',
            data: {
                keyword: keyword
            }
        }).done(function (data) {
            var data = JSON.parse(data);
            for (var i = 0; i < data.length; i++) {
                var list = '<div class = "chat_list" >' +
                    '<div class="chat_people" style="cursor: pointer;" onclick="manage(\'' + data[i]['temanObrolan'] + '\')"> ' +
                    '<div class="chat_img">' +
                    '<img src="../assets/image/profile/' + data[i]['gambar'] + '" alt="">' +
                    '</div>' +
                    '<div class = "chat_ib" >' +
                    '<h5>' + data[i]['namaLengkap'] + '<span class = "chat_date" > Status: </span></h5>' +
                    '<p ></p>' +
                    ' </div>' +
                    '</div>' +
                    '</div>';
                $(list).appendTo('#daftarObrolan');

            }
        });
    }
}
$("#pesan").emojioneArea({
    pickerPosition: "top",
    events: {
        keydown: function (editor, event) {
            if (event.keyCode == 13) {
                kirimPesan(this.getText());
            }
            
        }
    }
});