<?php
include('./includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info = $class_member->user_info($conn, $_COOKIE['user_id']);

if (isset($user_info['user_id']) && $user_info['user_id'] > 0) {
    $thongtin_khachhang = $class_index->getThongTinKhachHang($conn,$user_info['user_id']);
    $header = $skin->skin_replace('skin_cpanel/headeruser', $thongtin_khachhang);
} else {
    $header = $skin->skin_normal('skin/header');
}

// Xử lý và hiển thị nội dung
$replace = array(
    'user_id' => $user_info['user_id'],
    'header' => $header,
    'footer' => $skin->skin_normal('skin/footer')
);

echo $skin->skin_replace('skin/doitra', $replace);
