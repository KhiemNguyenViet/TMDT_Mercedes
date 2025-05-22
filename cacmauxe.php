<?php
include('./includes/tlca_world.php');

// Xử lý request
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info = $class_member->user_info($conn, $_COOKIE['user_id']);

if (isset($user_info['user_id']) && $user_info['user_id'] > 0) {
    $header = $skin->skin_normal('skin_cpanel/headeruser');
} else {
    $header = $skin->skin_normal('skin/header');
}

// Lấy kết quả từ box_index
$result = $class_index->box_index($conn);

// Xử lý và hiển thị nội dung
$replace = array(
    'header' => $header,
    'footer' => $skin->skin_normal('skin/footer'),
    'list_category' => $class_index->list_category($conn),
    'box_index' => $result['list'],
    'pagination' => $result['pagination'],
    'category_param' => $result['category_param'],
    'sort_param' => $result['sort_param'],
    'active_all' => $result['active_all'],
    'sort_default' => $result['sort_default'],
    'sort_asc' => $result['sort_asc'],
    'sort_desc' => $result['sort_desc']
);

echo $skin->skin_replace('skin/SanPham', $replace);
