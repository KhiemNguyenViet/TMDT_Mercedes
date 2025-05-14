<?php
include('../includes/tlca_world.php');

$tlca_do = new class_manage();
$check = $tlca_do->load('class_check');
$cpanel = $tlca_do->load('class_cpanel');
$skin = $tlca_do->load('class_skin_cpanel');

// Lấy action từ URL
$action = isset($_GET['action']) ? $_GET['action'] : 'dashboard';

// Kết nối database
$conn = mysqli_connect('localhost', 'root', '', 'mercedes_shop');
if (!$conn) {
    die("Lỗi kết nối database: " . mysqli_error($conn));
}

// Xử lý các action
switch ($action) {
    case 'edit_product':
        include('edit_product.php');
        $template = 'skin_adm/box_li/edit_product';
        break;

    case 'dashboard':
    default:
        $list_product = $cpanel->list_product($conn);
        $thaythe = array(
            'list_product' => $list_product
        );
        $template = 'skin_adm/index';
        break;
}

// Hiển thị template tương ứng
echo $skin->skin_replace($template, $thaythe);

mysqli_close($conn);
