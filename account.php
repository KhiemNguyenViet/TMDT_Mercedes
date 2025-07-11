<?php
    include('./includes/tlca_world.php');

    // Xử lý request
    $check = $tlca_do->load('class_check');
    $class_index = $tlca_do->load('class_index');
    $skin = $tlca_do->load('class_skin');
    $class_member = $tlca_do->load('class_member');
    $user_info = $class_member->user_info($conn, $_COOKIE['user_id']);

    if(isset($user_info['user_id']) && $user_info['user_id'] > 0) {
        $thongtin_khachhang = $class_index->getThongTinKhachHang($conn, $user_info['user_id']);
        $header = $skin->skin_replace('skin_cpanel/headeruser', $thongtin_khachhang);
        
        // Lấy thông tin chi tiết người dùng
        $thongtin_khachhang = mysqli_query($conn, "SELECT * FROM users WHERE user_id = " . $user_info['user_id']);
        $result_thongtin_khachhang = mysqli_fetch_assoc($thongtin_khachhang);
        
        // Xử lý và hiển thị nội dung
        $replace = array(
            // 'password' => $result_thongtin_khachhang['password'],
            'full_name' => $result_thongtin_khachhang['full_name'],
            'user_avatar' => $result_thongtin_khachhang['avatar']?$result_thongtin_khachhang['avatar']:'../hinhanh/no-images.jpg',
            'user_name' => $result_thongtin_khachhang['username'],
            'user_address' => $result_thongtin_khachhang['address'],
            'user_phone' => $result_thongtin_khachhang['phone'],
            'user_email' => $result_thongtin_khachhang['email'],
            'user_id' => $result_thongtin_khachhang['user_id'],
            'header' => $header,
            'footer' => $skin->skin_normal('skin/footer'),
        );

        echo $skin->skin_replace('skin/HoSo', $replace);
    } else {
        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
        echo "<script>alert('Vui lòng đăng nhập để xem thông tin tài khoản!'); window.location.href='login.php';</script>";
    }
?>