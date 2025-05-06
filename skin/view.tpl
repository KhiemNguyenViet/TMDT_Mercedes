{header}
<link rel="stylesheet" href="skin/tpl/css/product-detail.css">

<div class="product-detail">
    <div class="product-gallery">
        <div class="main-image">
            <img src="../hinhanh/{product.image}" alt="{product.name}">
        </div>
    </div>

    <div class="product-info">
        <h1 class="product-title">{product.name}</h1>
        <div class="product-price">{product.price}</div>
        
        <table class="specs-table">
            <tr>
                <td>Thương hiệu</td>
                <td>Mercedes-Benz</td>
            </tr>
            <tr>
                <td>Dòng xe</td>
                <td>{product.category_name}</td>
            </tr>
            <tr>
                <td>Năm sản xuất</td>
                <td>2025</td>
            </tr>
            <tr>
                <td>Tình trạng</td>
                <td>Mới 100%</td>
            </tr>
            <tr>
                <td>Số lượng còn</td>
                <td>{product.stock} xe</td>
            </tr>
        </table>

        <div class="action-buttons">
            <button class="btn btn-primary" onclick="handleTestDrive()">Đăng ký lái thử</button>
            <button class="btn btn-outline" onclick="handleContact()">Liên hệ tư vấn</button>
        </div>

        <div class="description">
            <h3>Mô tả chi tiết</h3>
            <div class="description-content">
                {product.description}
            </div>
        </div>
    </div>
</div>

<script>
function handleTestDrive() {
    // Scroll to test drive form
    document.querySelector('.testdrive-section').scrollIntoView({ behavior: 'smooth' });
}

function handleContact() {
    alert('Hotline tư vấn: 0123.456.789');
}
</script>

{footer}