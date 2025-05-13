<?php

include('./includes/tlca_world.php');

$tlca_do = new class_manage();
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');

// Lấy ID sản phẩm từ URL
$product_id = isset($_GET['blank']) ? (int)$_GET['blank'] : 0;

// Debug
error_log("Loading product details for ID: " . $product_id);

// Khởi tạo kết nối database
$conn = mysqli_connect('localhost', 'root', '', 'mercedes_shop');
if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

// Lấy thông tin sản phẩm
$sql = "SELECT p.*, c.name as category_name 
        FROM products p
        LEFT JOIN categories c ON p.category_id = c.id 
        WHERE p.id = $product_id";

$result = mysqli_query($conn, $sql);
$product = mysqli_fetch_assoc($result);

if ($product) {
    // Format giá tiền
    $formatted_price = number_format($product['price'], 0, ',', '.') . ' VNĐ';

    // Chuẩn bị dữ liệu cho template
    $replace = array(
        'header' => $skin->skin_normal('skin/header'),
        'footer' => $skin->skin_normal('skin/footer'),
        'product.id' => $product['id'],
        'product.name' => $product['name'],
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
        'product.category_name' => $product['category_name']
    );

    // Debug
    error_log("Product data for template: " . print_r($replace, true));

    echo $skin->skin_replace('skin/SanPhamChiTiet', $replace);
} else {
    die("Không tìm thấy sản phẩm với ID: " . $product_id);
}
