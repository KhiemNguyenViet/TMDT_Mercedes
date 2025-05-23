<?php
include('./includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info=$class_member->user_info($conn,$_COOKIE['user_id']);

if(isset($user_info['user_id']) && $user_info['user_id']>0){
    $header = $skin->skin_normal('skin_cpanel/headeruser');
}else{
    $header = $skin->skin_normal('skin/header');
}

// Lấy ID sản phẩm từ URL
$product_id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

// Debug
error_log("Loading product details for ID: " . $product_id);

    $formatted_price = number_format($product['price'], 0, ',', '.') . ' VNĐ';

    // Chuẩn bị dữ liệu template
    $replace = array(
        'header' => $header,
        'footer' => $skin->skin_normal('skin/footer'),
        'product.id' => $product['id'],
        'product.name' => $product['name_car'],
        'product.price' => $formatted_price,
        'product.image' => $product['image_car'],
        'product.category_name' => $product['category_name']
    );
    
    

    echo $skin->skin_replace('skin/DatCho', $replace);
?>
