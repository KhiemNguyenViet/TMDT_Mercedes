<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="description" content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords" content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mercedes</title>
    <!-- Link tới CSS -->
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Banner.css">
    <link rel="stylesheet" href="../skin/tpl/css/Timhieuthem.css">
    <link rel="stylesheet" href="../skin/tpl/css/DichVu.css">
    <link rel="stylesheet" href="../skin/tpl/css/SanPhamBanChay.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
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

        
    </div>
</div>
<div class="description">
    <h3>Mô tả chi tiết</h3>
    <div class="description-content">
        {product.description}
        <h2>GLC thế hệ mới X254</h2>
        <p>
            GLC thế hệ mới định nghĩa lại sự xa xỉ trong thiết kế thể thao hiện đại, tôn thêm nét khỏe khoắn vốn có của
            dòng xe sang Mercedes-Benz SUV.
            Sự nâng cấp đáng kể về công nghệ và các tính năng hỗ trợ trong không gian nội thất mang đến những trải
            nghiệm đỉnh cao mới.
        </p>
    </div>
</div>
<div class="product-description">
    <div class="image-row">
        <img src="../hinhanh/mota1.jpg" alt="GLC front" />
        <img src="../hinhanh/mota2.jpg" alt="GLC rear" />
        <img src="../hinhanh/mota3.jpg" alt="GLC interior" />
    </div>
    <img src="../hinhanh/mota4.jpg" alt="GLC interior" style="width: 100%; margin-top: 20px; border-radius: 8px;" />
    <h2>Thông số kỹ thuật</h2>
    <p>Thông số kỹ thuật của Mercedes-Benz GLC 300 4MATIC 2024</p>
    <ul style="line-height: 1.8; font-size: 16px; font-family: Arial, sans-serif;"></ul>
    <li style="text-align: justify">D x R x C : 4716 x 1934 x 1640 (mm)</li>
    <li style="text-align: justify">Chiều dài cơ sở : 2888 (mm)</li>
    <li style="text-align: justify">Tự trọng/Tải trọng : 1925/585 (kg)</li>
    <li style="text-align: justify">Động cơ : I4</li>
    <li style="text-align: justify">Dung tích công tác : 1999 (cc)</li>
    <li style="text-align: justify">Công suất cực đại : 190 kW [258 hp] tại 5800 vòng/phút</li>
    <li style="text-align: justify">Mô-men xoắn cực đại : 400 Nm tại 2000 – 3200 vòng/phút</li>
    <li style="text-align: justify">Hộp số : Tự động 9 cấp 9G-TRONIC</li>
    <li style="text-align: justify">Dẫn động : 4 bánh toàn thời gian 4MATIC</li>
    <li style="text-align: justify">Tăng tốc (0 – 100 km/h) : 6,2 (giây)</li>
    <li style="text-align: justify">Vận tốc tối đa : 240 (km/h)</li>
    <li style="text-align: justify">Dung tích bình xăng : 62 (lít)</li>
    <li style="text-align: justify">Loại nhiên liệu : Xăng không chì có trị số octane 95 hoặc cao hơn</li>
    <li style="text-align: justify">Mức tiêu thụ nhiên liệu, kết hợp : (l/100km)</li>
    <li style="text-align: justify">Mức tiêu thụ nhiên liệu, trong đô thị : (l/100km)</li>
    <li style="text-align: justify">Mức tiêu thụ nhiên liệu, ngoài đô thị : (l/100km)</li>
    </ul>
    <h2>Ngoại Thất Mercedes-Benz GLC 300 4MATIC</h2>
    <div style="display: flex; gap: 20px; margin-top: 20px;">
        <img src="../hinhanh/chitiet7.jpg" alt="GLC exterior" style="width: 49%; border-radius: 8px;" />
        <img src="../hinhanh/chitiet8.jpg" alt="GLC exterior" style="width: 49%; border-radius: 8px;" />
    </div>
    <img src="../hinhanh/chitiet6.jpg" alt="GLC exterior"
        style="width: 100%; margin-top: 20px; border-radius: 8px;" />
    <ul style="line-height: 1.8; font-size: 16px; font-family: Arial, sans-serif;"></ul>
    <li style="text-align: justify">Màu xe: Trắng Polar (149), Đen Obsidian (197), Đỏ Hyacinth (996), Xám Graphite
        (831)</li>
    <li style="text-align: justify">Gói thiết kế ngoại thất thể thao AMG Line</li>
    <li style="text-align: justify">Mâm hợp kim thể thao AMG kích thước 20-inch, với thiết kế nan đa chấu</li>
    <li style="text-align: justify">Gương chiếu hậu ngoại thất điều chỉnh &amp; gập điện</li>
    <li style="text-align: justify">Bậc lên xuống bằng hợp kim nhôm</li>
    <li style="text-align: justify">Baga mui ốp nhôm bóng</li>
    <li style="text-align: justify">Đèn chào mừng với logo thương hiệu Mercedes-Benz</li>
    </ul>
    <h2>Nội Thất Mercedes-Benz GLC 300 4MATIC</h2>
    <div style="display: flex; gap: 20px; margin-top: 20px;">
        <img src="../hinhanh/chitiet1.jpg" alt="GLC exterior"
            style="width: 100%; margin-top: 20px; border-radius: 8px;" />
    </div>
    <div style="display: flex; justify-content: space-between; gap: 20px; margin-top: 20px;">
        <img src="../hinhanh/chitiet2.jpg" alt="GLC interior" style="width: 49%; border-radius: 8px;" />
        <img src="../hinhanh/chitiet3.jpg" alt="GLC interior" style="width: 49%; border-radius: 8px;" />
    </div>
    <ul style="line-height: 1.8; font-size: 16px; font-family: Arial, sans-serif;"></ul>
    <li style="text-align: justify">Gói thiết kế nội thất thể thao AMG Line</li>
    <li style="text-align: justify">Ốp bệ bước cửa trước với dòng chữ “Mercedes-Benz” phát sáng</li>
    <li style="text-align: justify">Vô lăng 3 chấu thiết kế thể thao bọc da nappa cao cấp, tích hợp các nút bấm
        điều khiển cảm ứng</li>
    <li style="text-align: justify">Mặt táp-lô &amp; viền cửa sổ bọc da ARTICO</li>
    <li style="text-align: justify">Tựa tay trung tâm phía trước thiết kế vân sợi kim loại</li>
    <li style="text-align: justify">Ốp trang trí nội thất thiết kế vân sợi kim loại</li>
    <li style="text-align: justify">Ghế người lái &amp; hành khách phía trước điều chỉnh điện</li>
    <li style="text-align: justify">Bộ nhớ 3 vị trí cho hàng ghế trước, vô lăng &amp; gương chiếu hậu ngoại thất
    </li>
    <li style="text-align: justify">Hỗ trợ tựa lưng cho ghế người lái &amp; hành khách phía trước</li>
    <li style="text-align: justify">Chức năng sưởi cho hàng ghế trước</li>
    <li style="text-align: justify">Tựa đầu điều chỉnh được</li>
    <li style="text-align: justify">Lưng ghế sau gập lại được</li>
    <li style="text-align: justify">Hệ thống đèn viền trang trí nội thất 64 màu tuỳ chỉnh</li>
    <li style="text-align: justify">Cần gạt nước mưa tự động với cảm biến mưa</li>
    <li style="text-align: justify">Hệ thống điều hòa khí hậu tự động 2 vùng THERMATIC</li>
    <li style="text-align: justify">Kính tối màu cách nhiệt cao cấp cho cửa sổ sau &amp; cửa sổ sau bên hông
    </li>
    <li style="text-align: justify">Cửa sổ trời toàn cảnh Panoramic</li>
    <li style="text-align: justify">Cổng kết nối truyền thông đa phương tiện (USB type C) phía dưới tựa tay
        trung tâm</li>
    <li style="text-align: justify">Cổng sạc điện 12V trong khoang hành lý</li>
    <li style="text-align: justify">Chức năng sạc không dây cho hàng ghế trước</li>
    <li style="text-align: justify">Thảm lót sàn thiết thế kế thao AMG</li>
    </ul>
    <h2>An toàn &amp; An ninh</h2>
    <div style="display: flex; gap: 20px; margin-top: 20px;">
        <img src="../hinhanh/anninh1.jpg" alt="GLC safety" style="width: 32%; border-radius: 8px;" />
        <img src="../hinhanh/anninh2.jpg" alt="GLC safety" style="width: 32%; border-radius: 8px;" />
        <img src="../hinhanh/anninh3.jpg" alt="GLC safety" style="width: 32%; border-radius: 8px;" />
    </div>
    <ul style="line-height: 1.8; font-size: 16px; font-family: Arial, sans-serif;">
        <li style="text-align: justify">Cụm đèn trước với công nghệ DIGITAL LIGHT cao cấp, tích hợp tính năng ULTRA
            RANGE</li>
        <li style="text-align: justify">Highbeam, hỗ trợ tự động điều chỉnh pha/cốt Adaptive High-beam Assist Plus
            &amp; đèn LED chiếu sáng ban ngày</li>
        <li style="text-align: justify">Đèn báo rẽ trên gương chiếu hậu, cụm đèn sau &amp; đèn phanh thứ ba công
            nghệ LED</li>
        <li style="text-align: justify">Đèn phanh Adaptive nhấp nháy khi phanh gấp</li>
        <li style="text-align: justify">Gương chiếu hậu nội thất chống chói tự động</li>
        <li style="text-align: justify">Hệ thống chống bó cứng phanh ABS; Chống trượt khi tăng tốc ASR; Ổn định thân
            xe điện tử ESP®</li>
        <li style="text-align: justify">Hệ thống phanh ADAPTIVE với chức năng hỗ trợ dừng xe (HOLD) và hỗ trợ khởi
            hành ngang dốc (Hill-Start Assist)</li>
        <li style="text-align: justify">Phanh tay điều khiển điện với chức năng nhả phanh thông minh</li>
        <li style="text-align: justify">Hệ thống hỗ trợ phanh phòng ngừa va chạm (Active Brake Assist)</li>
        <li style="text-align: justify">Hệ thống hỗ trợ giữ khoảng cách chủ động DISTRONIC</li>
        <li style="text-align: justify">Hệ thống hỗ trợ giữ làn chủ động (Active Lane Keeping Assist)</li>
        <li style="text-align: justify">Hệ thống hỗ trợ đỗ xe chủ động PARKTRONIC</li>
        <li style="text-align: justify">Chức năng cảnh báo mất tập trung ATTENTION ASSIST</li>
        <li style="text-align: justify">Hệ thống hỗ trợ cảnh báo điểm mù</li>
        <li style="text-align: justify">Hệ thống bảo vệ chủ động PRE-SAFE® &amp; bảo vệ va chạm bên hông PRE-SAFE®
            Impulse Side</li>
        <li style="text-align: justify">Hệ thống kiểm soát hành trình CRUISE CONTROL</li>
        <li style="text-align: justify">Hệ thống khóa cửa trung tâm với chức năng tự động khóa khi xe chạy và mở
            khóa trong trường hợp khẩn cấp</li>
        <li style="text-align: justify">Túi khí phía trước; túi khí bên hông phía trước &amp; túi khí cửa sổ</li>
        <li style="text-align: justify">Cốp sau đóng mở điện</li>
        <li style="text-align: justify">Hệ thống khoá xe thông minh &amp; khởi động bằng nút bấm KEYLESS-GO</li>
        <li style="text-align: justify">Chức năng HANDS-FREE ACCESS</li>
        <li style="text-align: justify">Camera 360o với tính năng Transparent bonnet hỗ trợ quan sát khu vực bên
            dưới nắp capo khi di chuyển qua các cung đường off-road</li>
        <li style="text-align: justify">Lốp dự phòng</li>
        <li style="text-align: justify">Bộ dụng cụ thay lốp</li>
        <li style="text-align: justify">Dây đai an toàn 3 điểm cho tất cả các ghế với bộ căng đai khẩn cấp &amp;
            giới hạn lực siết</li>
    </ul>
    <h2>Khả năng vận hành</h2>
    <ul style="line-height: 1.8; font-size: 16px; font-family: Arial, sans-serif;">
        <li style="text-align: justify">Động cơ mới với công nghệ 48V mild-hybrid</li>
        <li style="text-align: justify">Chức năng ECO start/stop</li>
        <li style="text-align: justify">Hệ thống phanh với đĩa phanh đục lỗ kích thước lớn ở cầu trước</li>
        <li style="text-align: justify">Hệ thống treo AGILITY CONTROL</li>
        <li style="text-align: justify">Hệ thống lái Direct-Steer trợ lực điện với trợ lực &amp; tỉ số truyền lái
            biến
            thiên theo tốc độ</li>
        <li style="text-align: justify">Cần số điều khiển điện DIRECT SELECT phía sau tay lái</li>
        <li style="text-align: justify">Lẫy chuyển số bán tự động DIRECT SELECT phía sau tay lái</li>
        <li style="text-align: justify">Cụm chuyển đổi DYNAMIC SELECT với nhiều chế độ vận hành</li>
    </ul>
</div>
<style>
    .product-description {
    margin: 40px auto;
    max-width: 1200px;
    background: #fff;
    padding: 20px 30px;
    border-radius: 8px;
}
</style>
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