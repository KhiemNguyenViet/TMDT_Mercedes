<?php
include('./includes/tlca_world.php');

$tlca_do = new class_manage();
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');

// Lấy ID sản phẩm từ URL
$product_id = isset($_GET['blank']) ? $_GET['blank'] : 0;

// Lấy thông tin sản phẩm
$product = $class_index->getProductById($conn,$product_id);

if ($product) {
    // Format giá tiền
    $product['price'] = number_format($product['price'], 0, ',', '.') . ' vnđ';
    
    // Lấy tên danh mục
    $category = $class_index->getCategoryById($conn,$product['category_id']);
    $product['category_name'] = $category['name'];
    
    // Xử lý và hiển thị nội dung
    $replace = array(
        'header' => $skin->skin_normal('skin/header'),
        'footer' => $skin->skin_normal('skin/footer'),
        'product.name' => $product['name'],
        'product.image' => $product['image'],
        'product.price' => $product['price'],
        'product.description' => $product['description'],
        'product.category_name' => $product['category_name'],
        'product.stock' => $product['stock']
    );
    
    echo $skin->skin_replace('skin/view', $replace);
} else {
    header('Location: 404.html');
}
?>