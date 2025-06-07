<?php
include('./includes/tlca_world.php');

// Xử lý request
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info = $class_member->user_info($conn, $_COOKIE['user_id']);
$user_id = $user_info['user_id'];

if ($user_id == '' || $user_id == null) {
    echo '<script>alert("Vui lòng đăng nhập để có lịch sử thanh toán"); window.location.href = "./login.php";</script>';
    exit();
}else{
    $thongtin_khachhang = $class_index->getThongTinKhachHang($conn,$user_info['user_id']);
    $header = $skin->skin_replace('skin_cpanel/headeruser', $thongtin_khachhang);
}
// var_dump($user_id);
// die();
$lichsu_thanhtoan = $class_index->list_lichsu_thanhtoan($conn, $user_id);

$replace = array(
    'header' => $header,
    'footer' => $skin->skin_normal('skin/footer'),
    'list_lichsu_thanhtoan' => $lichsu_thanhtoan
);

echo $skin->skin_replace('skin/lichsu_thanhtoan', $replace);
?>