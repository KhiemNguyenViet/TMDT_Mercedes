<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

include('./includes/tlca_world.php');

$tlca_do = new class_manage();
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');

// Lấy và validate ID sản phẩm 
$product_id = isset($_GET['blank']) ? (int)$_GET['blank'] : 0;

// Debug
error_log("Raw product ID from URL: " . $_GET['blank']);
error_log("Parsed product ID: " . $product_id);

// Kiểm tra ID hợp lệ
if (!$product_id || $product_id <= 0) {
    error_log("Invalid product ID received: " . $_GET['blank']);
    die("Invalid product ID: " . htmlspecialchars($_GET['blank']));
}

// Kết nối database
$conn = mysqli_connect('localhost', 'root', '', 'mercedes_shop');
if (!$conn) {
    die("Database connection failed: " . mysqli_connect_error());
}

// Query lấy thông tin sản phẩm với ID
$sql = "SELECT p.*, c.name as category_name 
        FROM products p
        LEFT JOIN categories c ON p.category_id = c.id
        WHERE p.id = ?";

$stmt = mysqli_prepare($conn, $sql);
mysqli_stmt_bind_param($stmt, "i", $product_id);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$product = mysqli_fetch_assoc($result);

if ($product) {
    // Format giá tiền
    $formatted_price = number_format($product['price'], 0, ',', '.') . ' VNĐ';

    // Chuẩn bị dữ liệu template
    $replace = array(
        'header' => $skin->skin_normal('skin/header'),
        'footer' => $skin->skin_normal('skin/footer'),
        'product.id' => $product['id'],
        'product.name' => $product['name'],
        'product.price' => $formatted_price,
        'product.image' => $product['image'],
        'product.category_name' => $product['category_name']
    );

    echo $skin->skin_replace('skin/DatCho', $replace);
} else {
    die("Không tìm thấy sản phẩm với ID: " . $product_id);
}
