<?php
include('./includes/config.php');

if(isset($_COOKIE['user_id'])) {
    $ok = 0;
    $thongbao = 'Thất bại! Bạn đã đăng nhập';
} else {
    $username = addslashes(strip_tags($_REQUEST['username']));
    $password = addslashes(strip_tags($_REQUEST['password']));
    $email = addslashes(strip_tags($_REQUEST['email']));
    $name = addslashes(strip_tags($_REQUEST['name']));
    $phone = addslashes(strip_tags($_REQUEST['phone']));
    $address = addslashes(strip_tags($_REQUEST['address']));

    // Kiểm tra độ dài username
    if(strlen($username) < 4) {
        $ok = 0;
        $thongbao = 'Tên đăng nhập phải từ 4 ký tự trở lên';
    } else {
        // Kiểm tra username tồn tại
        $check_user = mysqli_query($conn, "SELECT COUNT(*) as total FROM users WHERE username='$username'");
        $r_check = mysqli_fetch_assoc($check_user);

        if($r_check['total'] > 0) {
            $ok = 0;
            $thongbao = 'Tên đăng nhập đã tồn tại';
        } else {
            // Kiểm tra email tồn tại
            $check_email = mysqli_query($conn, "SELECT COUNT(*) as total FROM users WHERE email='$email'");
            $r_email = mysqli_fetch_assoc($check_email);

            if($r_email['total'] > 0) {
                $ok = 0;
                $thongbao = 'Email đã được sử dụng';
            } else {
                // Mã hóa mật khẩu
                $hashed_password = md5($password);

                // Thêm user mới
                $query = "INSERT INTO users (username, password, email, full_name, phone, address, role,avatar) 
                         VALUES ('$username', '$hashed_password', '$email', '$name', '$phone', '$address', 'user','')";

                if(mysqli_query($conn, $query)) {
                    $ok = 1;
                    $thongbao = 'Đăng ký thành công';
                } else {
                    $ok = 0;
                    $thongbao = 'Lỗi: ' . mysqli_error($conn);
                }
            }
        }
    }
}

$info = array(
    'ok' => $ok,
    'thongbao' => $thongbao
);

echo json_encode($info);
exit;
?>