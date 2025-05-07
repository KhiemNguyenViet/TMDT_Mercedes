<?php
include('./includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');

// Tạo HTML cho sản phẩm GLC (category_id = 2)
$glc_banchay = $class_index->list_glcbanchay($conn, 10);

// Xử lý và hiển thị nội dung
$replace = array(
    'header' => $skin->skin_normal('skin/header'),
    'footer' => $skin->skin_normal('skin/footer'),
    'products' => json_encode($products),
    'spglc_banchay' => $glc_banchay
);

echo $skin->skin_replace('skin/index', $replace);
?>