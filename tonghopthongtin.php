<?php
include('./includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info = $class_member->user_info($conn, $_COOKIE['user_id']);

if (isset($user_info['user_id']) && $user_info['user_id'] > 0) {
    $thongtin_khachhang = $class_index->getThongTinKhachHang($conn,$user_info['user_id']);
    $thongtin_khachhang = $class_index->getThongTinKhachHang($conn,$user_info['user_id']);
    $header = $skin->skin_replace('skin_cpanel/headeruser', $thongtin_khachhang);
} else {
    $header = $skin->skin_normal('skin/header');
}

// Tạo HTML cho sản phẩm GLC (category_id = 2)
$glc_banchay = $class_index->list_glcbanchay($conn, 5);
$suv_banchay = $class_index->list_suvbanchay($conn, 5);
$coupe_banchay = $class_index->list_coupebanchay($conn, 5);


// Xử lý và hiển thị nội dung
$replace = array(
    'email_khachhang'=> $thongtin_khachhang['email'] ?? '',
    'name_khachhang'=> $thongtin_khachhang['full_name'] ?? '',
    'phone_khachhang'=> $thongtin_khachhang['phone'] ?? '',
    'user_id' => $user_info['user_id'],
    'header' => $header,
    'footer' => $skin->skin_normal('skin/footer'),
    'products' => json_encode($products),
    'spsedan_banchay' => $glc_banchay,
    'spsuv_banchay' => $suv_banchay,
    'spcoupe_banchay' => $coupe_banchay,
    'car_models' => $class_index->list_car_models($conn),
);

echo $skin->skin_replace('skin/TongHopThongTinKhuyenMai', $replace);
