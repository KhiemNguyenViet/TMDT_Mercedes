<?php
include('./includes/tlca_world.php');

// Khởi tạo instance của class_manage
$tlca_do = new class_manage();

$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');

// Lấy danh sách sản phẩm
$products = $class_index->getProducts();

// Tạo HTML cho sản phẩm GLC (category_id = 2)
$box_index_html = '';
if (!empty($products)) {
    foreach ($products as $product) {
        // Kiểm tra các khóa cần thiết và lọc theo category_id
        if (isset($product['category_id']) && $product['category_id'] == 2 &&
            isset($product['name']) && isset($product['price']) && isset($product['image'])) {
            // Tính toán giảm giá (giả định: một số sản phẩm có giảm giá 10%)
            $sale_badge = '';
            $original_price = '';
            if ($product['name'] === 'GLC 200 All New 2025') { // Điều kiện tạm để minh họa
                $sale_badge = '<div class="sale-badge">-10%</div>';
                $original_price = '<span class="gia-cu">' . number_format($product['price'] / 0.9, 0, ',', '.') . ' vnđ</span>';
            }

            $box_index_html .= '
            <div class="sanpham-item">
                <div class="image-wrapper">
                    ' . $sale_badge . '
                    <img src="hinhanh/' . htmlspecialchars($product['image']) . '" alt="' . htmlspecialchars($product['name']) . '" class="sanpham-image" />
                </div>
                <p class="sanpham-ten">' . htmlspecialchars($product['name']) . '</p>
                <p class="sanpham-gia">Giá: ' . number_format($product['price'], 0, ',', '.') . ' vnđ ' . $original_price . '</p>
            </div>';
        }
    }
} else {
    $box_index_html = '<p>Không có sản phẩm nào trong danh mục GLC.</p>';
}

// Phân tích URL
$param_url = parse_url($_SERVER['REQUEST_URI']);
parse_str($param_url['query'] ?? '', $url_query);

// Xử lý và hiển thị nội dung
$replace = array(
    'header' => $skin->skin_normal('skin/header'),
    'footer' => $skin->skin_normal('skin/footer'),
    'products' => json_encode($products),
    'box_index' => $box_index_html
);

echo $skin->skin_replace('skin/index', $replace);
?>