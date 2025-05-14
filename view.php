<?php
include('./includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info=$class_member->user_info($conn,$_COOKIE['user_id']);
if(isset($user_info['user_id'])){
    $header = $skin->skin_normal('skin_cpanel/headeruser');
    $thongtinkhachhang = $class_index->getThongTinKhachHang($conn,$user_info['user_id']);
    $username = $thongtinkhachhang['username'];
    $phone = $thongtinkhachhang['phone'];
    $email = $thongtinkhachhang['email'];
}else{
    $header = $skin->skin_normal('skin/header');
    $username = '';
    $phone = '';
    $email = '';
}
// Lấy ID sản phẩm từ URL
$product_id = isset($_GET['blank']) ? $_GET['blank'] : 0;

// Lấy thông tin sản phẩm
$product = $class_index->getProductById($conn,$product_id);

if ($product) {
    // Format giá tiền
    $product['price'] = number_format($product['price'], 0, ',', '.') . ' VNĐ';
    
    // Lấy tên danh mục
    $category = $class_index->getCategoryById($conn,$product['category_id']);
    $product['category_name'] = $category['name'];
    
    // Xử lý và hiển thị nội dung
    $replace = array(
        'header' => $header,
        'footer' => $skin->skin_normal('skin/footer'),
        'product.name' => $product['name'],
        'product.id' => $product['id'],
        'product.image' => $product['image'],
        'product.price' => $product['price'],
        'product.description' => $product['description'],
        'product.category_name' => $product['category_name'],
        'product.stock' => $product['stock'],
        'length' => $product['length_mm'],
        'width' => $product['width_mm'],
        'height' => $product['height_mm'],
        'engine' => $product['engine_type'],
        'displacement_cc' => $product['displacement_cc'],
        'power' => $product['horsepower_hp'],
        'torque' => $product['torque_nm'],
        'transmission' => $product['transmission_type'],
        'drive' => $product['drive_type'],
        'acceleration' => $product['acceleration_0_100_s'],
        'max_speed' => $product['top_speed_kmh'],
        'fuel_capacity' => $product['fuel_capacity'],
        'fuel_type' => $product['fuel_type'],
        'fuel_consumption_combined' => $product['fuel_consumption_l_100km'],
        'username' => $username,
        'phone' => $phone,
        'email' => $email,
    );
    
    echo $skin->skin_replace('skin/SanPhamChiTiet', $replace);
} else {
    header('Location: 404.html');
}
?>