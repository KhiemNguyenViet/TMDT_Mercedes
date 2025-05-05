$('#button_login').on('click', function() {
    username = $('.login-container input[name=username]').val();
    password = $('.login-container input[name=password]').val();
    if (username.length < 4) {
        $('.login-container input[name=username]').focus();
    } else if (password.length < 6) {
        $('.box_form input[name=password]').focus();
    } else {
        $('.load_overlay').show();
        $('.load_process').fadeIn();
        $.ajax({
            url: "/process_login.php",
            type: "post",
            data: {
                username: username,
                password: password
            },
            success: function(kq) {
                var info = JSON.parse(kq);
                setTimeout(function() {
                    $('.load_note').html(info.thongbao);
                }, 1000);
                setTimeout(function() {
                    $('.load_process').hide();
                    $('.load_note').html('Hệ thống đang xử lý');
                    $('.load_overlay').hide();
                    if (info.ok == 1) {
                        window.location.href='/tai-khoan.html';
                    } else {

                    }
                }, 3000);
            }
        });
    }
});

