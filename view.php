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
$sql = "SELECT 
    p.*, 
    c.name AS category_name,
    pd.*
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
LEFT JOIN product_details pd ON p.id = pd.product_id
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
        'product.name' => $product['name'],
        'product.id' => $product_id,
        'product.image' => $product['image'],
        'product.price' => $product['price'],
        'product.description' => $product['description'],
        'product.category_name' => $product['category_name'],
        'product.stock' => $product['stock'],
        'length' => $product['length_mm'] ?? 'Đang cập nhật',
        'width' => $product['width_mm'] ?? 'Đang cập nhật',
        'height' => $product['height_mm'] ?? 'Đang cập nhật',
        'engine' => $product['engine_type'] ?? 'Đang cập nhật',
        'displacement_cc' => $product['displacement_cc'] ?? 'Đang cập nhật',
        'power' => $product['horsepower_hp'] ?? 'Đang cập nhật',
        'torque' => $product['torque_nm'] ?? 'Đang cập nhật',
        'transmission' => $product['transmission_type'] ?? 'Đang cập nhật',
        'drive' => $product['drive_type'] ?? 'Đang cập nhật',
        'acceleration' => $product['acceleration_0_100_s'] ?? 'Đang cập nhật',
        'max_speed' => $product['top_speed_kmh'] ?? 'Đang cập nhật',
        'fuel_capacity' => $product['fuel_capacity'] ?? 'Đang cập nhật',
        'fuel_type' => $product['fuel_type'] ?? 'Đang cập nhật',
        'fuel_consumption_combined' => $product['fuel_consumption_l_100km'],
        'username' => $username,
        'phone' => $phone,
        'email' => $email,
        'product.category_name' => $product['category_name'],
        'user_id' => $user_info['user_id']
    );
    // var_dump($replace);
    // die();

    echo $skin->skin_replace('skin/SanPhamChiTiet', $replace);
} else {
    die("Không tìm thấy sản phẩm với ID: " . $product_id);
}
