$(document).ready(function () {
    // Chặn form reload
    $('form').on('submit', function (e) {
        e.preventDefault();

        let username = $('input[name="username"]').val().trim();
        let password = $('input[name="password"]').val().trim();

        // Kiểm tra dữ liệu đầu vào
        if (username.length < 4) {
            alert('Tên đăng nhập phải từ 4 ký tự trở lên');
            $('input[name="username"]').focus();
            return;
        }

        if (password.length < 6) {
            alert('Mật khẩu phải từ 6 ký tự trở lên');
            $('input[name="password"]').focus();
            return;
        }

        // Gửi AJAX
        $.ajax({
            url: '/admin/process.php',
            method: 'POST',
            data: {
                action: 'dangnhap',
                username: username,
                password: password
            },
            beforeSend: function () {
                // Có thể hiện loading nếu bạn muốn
            },
            success: function (response) {
                let info;
                try {
                    info = JSON.parse(response);
                } catch (e) {
                    alert('Lỗi phản hồi từ máy chủ.');
                    console.error('Response:', response);
                    return;
                }

                if (info.ok == 1) {
                    window.location.href = '/admin/dashboard';
                }  else if (info.ok == 24) {
                    localStorage.setItem('loginStatus', 'loggedInAsUser24');
                    $('.navbar .user-dropdown').css('display', 'none');
                    $('.navbar .tk-dropdown').css('display', 'block');
                    window.location.href = '/index.html';
                }else {
                    alert(info.thongbao || 'Đăng nhập thất bại.');
                }
            },
            error: function (xhr) {
                alert('Không thể kết nối máy chủ. Mã lỗi: ' + xhr.status);
            }
        });
    });
    /////////////////////
    $('a[name="logout"]').click(function() {
        localStorage.removeItem('loginStatus');
        $('.navbar .user-dropdown').css('display', 'block');
        $('.navbar .tk-dropdown').css('display', 'none');
        window.location.href = '/index.html';
    });
    /////////////////////
    // Đặt giữ xe
    $('.buy-btn').click(function() {
        window.location.href = '/dat-cho-xe.html';
    });
});