<?php
include('./includes/tlca_world.php');

$keyword = isset($_GET['keyword']) ? trim($_GET['keyword']) : '';

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

$result = $class_index->search_products($conn, $keyword);

$replace = array(
    'header' => $header,
    'footer' => $skin->skin_normal('skin/footer'),
    'list_category' => $class_index->list_category($conn),
    'box_index' => $result['list'],
    'pagination' => $result['pagination'],
    'category_param' => '',
    'sort_param' => '',
    'active_all' => '',
    'sort_default' => 'selected',
    'sort_asc' => '',
    'sort_desc' => '',
    'search_keyword' => htmlspecialchars($keyword)
);

echo $skin->skin_replace('skin/SanPham', $replace);
