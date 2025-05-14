<?php

// Kiểm tra quyền truy cập
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

// Set tiêu đề trang
$thaythe['title'] = 'Sửa sản phẩm';
$thaythe['title_action'] = 'Sửa sản phẩm';

// Lấy ID sản phẩm từ URL và validate
$id = preg_replace('/[^0-9]/', '', $url_query['id']);

// Query lấy thông tin sản phẩm
$query = mysqli_query($conn, "SELECT p.*, c.name as category_name 
                             FROM products p
                             LEFT JOIN categories c ON p.category_id = c.id 
                             WHERE p.id='$id'");
$product = mysqli_fetch_assoc($query);

// Kiểm tra sản phẩm tồn tại
if (!$product) {
    $thongbao = "Sản phẩm không tồn tại...";
    $replace = array(
        'title' => 'Sản phẩm không tồn tại...',
        'description' => $index_setting['description'],
        'thongbao' => $thongbao,
        'link_chuyen' => '/admincp/products'
    );
    echo $skin->skin_replace('skin_cpanel/chuyenhuong', $replace);
    exit();
}

// Format giá tiền hiển thị
$product['price_formatted'] = number_format($product['price'], 0, ',', '.') . ' VNĐ';

// Truyền dữ liệu vào template
$thaythe['box_right'] = $skin->skin_replace('skin_adm/box_li/edit_product', array(
    'id' => $product['id'],
    'name' => $product['name'],
    'price_raw' => $product['price'],
    'price' => $product['price_formatted'],
    'description' => $product['description'],
    'stock' => $product['stock'],
    'image' => $product['image'],
    'category_name' => $product['category_name']
));

// Return để hiển thị template
return $thaythe;