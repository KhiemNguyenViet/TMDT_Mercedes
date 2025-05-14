<?php
if ($user_info['role'] != 'admin') {
    $thongbao = "Bạn không có quyền truy cập...";
    $replace = array(
        'title' => 'Bạn không có quyền truy cập...',
        'description' => $index_setting['description'],
        'thongbao' => $thongbao,
        'link_chuyen' => '/admincp/dashboard'
    );
    echo $skin->skin_replace('skin_cpanel/chuyenhuong', $replace);
    exit();
}

$thaythe['title'] = 'Sửa sản phẩm';
$thaythe['title_action'] = 'Sửa sản phẩm';

$id = preg_replace('/[^0-9a-zA-Z_-]/', '', $url_query['id']);

$thongtin = mysqli_query($conn, "SELECT *, count(*) AS total FROM products WHERE id='$id'");
$r_tt = mysqli_fetch_assoc($thongtin);

if ($r_tt['total'] == 0) {
    $thongbao = "Sản phẩm không tồn tại...";
    $replace = array(
        'title' => 'Sản phẩm không tồn tại...',
        'description' => $index_setting['description'],
        'thongbao' => $thongbao,
        'link_chuyen' => '/admincp/list-product'
    );
    echo $skin->skin_replace('skin_cpanel/chuyenhuong', $replace);
    exit();
}

$r_tt['price_formatted'] = number_format($r_tt['price'], 0, ',', '.') . ' VNĐ';
$thaythe = array(
    'title' => 'Sửa sản phẩm',
    'title_action' => 'Sửa sản phẩm',
    'box_content' => $skin->skin_replace('skin_cpanel/box_action/edit_product', $r_tt)
);

// Hiển thị template
echo $skin->skin_replace('skin_cpanel/index', $thaythe);
exit();
