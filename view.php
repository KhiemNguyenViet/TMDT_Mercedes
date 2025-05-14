<?php
include('./includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info = $class_member->user_info($conn, $_COOKIE['user_id']);
if (isset($user_info['user_id'])) {
    $header = $skin->skin_normal('skin_cpanel/headeruser');
    $thongtinkhachhang = $class_index->getThongTinKhachHang($conn, $user_info['user_id']);
    $username = $thongtinkhachhang['username'];
    $phone = $thongtinkhachhang['phone'];
    $email = $thongtinkhachhang['email'];
} else {
    $header = $skin->skin_normal('skin/header');
    $username = '';
    $phone = '';
    $email = '';
}
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

    $product['price'] = number_format($product['price'], 0, ',', '.') . ' VNĐ';

    // Lấy tên danh mục
    $category = $class_index->getCategoryById($conn, $product['category_id']);
    $product['category_name'] = $category['name'];

    // Xử lý và hiển thị nội dung
    //  

    // Chuẩn bị dữ liệu cho template

    $replace = array(
        'header' => $header,
        'footer' => $skin->skin_normal('skin/footer'),
        'product.id' => $product['id'],
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
        'product.category_name' => $product['category_name']
    );

    // Debug
    error_log("Product data for template: " . print_r($replace, true));

    echo $skin->skin_replace('skin/SanPhamChiTiet', $replace);
} else {
    die("Không tìm thấy sản phẩm với ID: " . $product_id);
}
