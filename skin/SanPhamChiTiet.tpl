    <!DOCTYPE html>
<html lang="vi">

<head>
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Banner.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Chi tiết xe Mercedes</title>
    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .container {
            display: flex;
            max-width: 1200px;
            margin: 20px auto;
            gap: 40px;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .image-gallery {
            flex: 1;
        }

        .main-image {
            width: 100%;
            height: 360px;
            object-fit: contain;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .thumbnail-wrapper {
            display: flex;
            align-items: center;
        }

        .arrow {
            cursor: pointer;
            font-size: 24px;
            padding: 5px 10px;
            background-color: #eee;
            border-radius: 50%;
            user-select: none;
        }

        .thumbnail-container {
            display: flex;
            overflow: hidden;
            gap: 10px;
            width: 320px;
        }

        .thumbnail-container img {
            width: 70px;
            height: 50px;
            object-fit: cover;
            border: 2px solid transparent;
            cursor: pointer;
            transition: border 0.3s ease;
        }

        .thumbnail-container img.active {
            border: 2px solid #ff0000;
            box-shadow: 0 0 5px #000;
        }

        .info {
            flex: 1;
        }

        .info h2 {
            margin-top: 0;
            font-size: 24px;
        }

        .price {
            color: #000;
            font-size: 24px;
            font-weight: bold;
            margin: 10px 0;
        }

        .old-price {
            text-decoration: line-through;
            color: gray;
            margin-left: 10px;
        }

        .promo-box {
            background-color: #000000;
            color: white;
            padding: 10px 15px;
            margin: 15px 0;
            border-radius: 6px;
            font-size: 14px;
        }

        .buttons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .buttons button {
            flex: 1;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 6px;
            color: white;
            transition: background 0.3s ease;
        }

        .buy-btn {
            background-color: #007bff;
        }

        .buy-btn:hover {
            background-color: #0056b3;
        }

        .consult-btn {
            background-color: #28a745;
        }

        .consult-btn:hover {
            background-color: #1e7e34;
        }

        .product-description {
            margin: 40px auto;
            max-width: 1200px;
            background: #fff;
            padding: 20px 30px;
            border-radius: 8px;
        }

        .tabs {
            border-bottom: 2px solid #ddd;
            margin-bottom: 20px;
        }

        .tabs span {
            margin-right: 20px;
            font-weight: bold;
            padding-bottom: 6px;
            display: inline-block;
            cursor: pointer;
        }

        .tabs .active-tab {
            border-bottom: 3px solid #007bff;
            color: #007bff;
        }

        .tabs .disabled-tab {
            color: #888;
        }

        .image-row {
            display: flex;
            gap: 20px;
            margin-top: 20px;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .image-row img {
            width: 32%;
            border-radius: 8px;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
            /* Ensure it's on top */
        }

        .popup-content {
            background-color: #fff;
            padding: 25px 35px;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 450px;
            width: 90%;
            position: relative;
            /* For positioning the close button */
        }

        .popup-close {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 28px;
            font-weight: bold;
            color: #aaa;
            cursor: pointer;
            line-height: 1;
        }

        .popup-close:hover {
            color: #333;
        }

        .popup-content h2 {
            color: #0056b3;
            /* Mercedes-Benz blue */
            margin-top: 0;
            margin-bottom: 20px;
        }

        .popup-description {
            font-size: 0.95em;
            color: #666;
            margin-bottom: 25px;
        }

        .popup-options {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .popup-option-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 18px;
            text-decoration: none;
            font-size: 1em;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            display: block;
        }

        .popup-option-button:hover {
            background-color: #0056b3;
        }

        .popup-option-button.phone {
            background-color: #28a745;
            /* Green for phone call */
        }

        .popup-option-button.phone:hover {
            background-color: #1e7e34;
        }

        /* CSS for Booking Popup Form - Adjustments for horizontal and nicer layout */
        .booking-popup-content {
            max-width: 700px;
            /* Wider for two-column layout */
            text-align: left;
        }

        .booking-popup-content h2 {
            text-align: center;
            color: #0056b3;
            margin-top: 0;
            margin-bottom: 25px;
            /* More space below title */
        }

        #bookingForm {
            display: flex;
            flex-wrap: wrap;
            /* Allow items to wrap to the next line */
            justify-content: space-between;
            /* Distribute space between items */
        }

        .form-group {
            margin-bottom: 18px;
            /* Increased spacing */
            flex-basis: calc(50% - 10px);
            /* Two columns with a 20px gap total */
            box-sizing: border-box;
        }

        .form-group.full-width {
            flex-basis: 100%;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            font-size: 0.9em;
            color: #444;
            /* Slightly darker label */
        }

        .form-group input[type="text"],
        .form-group input[type="tel"],
        .form-group input[type="email"],
        .form-group input[type="date"],
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 0.95em;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            outline: none;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 80px;
        }

        #bookingForm .popup-option-button {
            flex-basis: 100%;
            /* Make submit button full width */
            margin-top: 15px;
            /* Space above submit button */
            background-color: #0056b3;
            padding: 14px 20px;
            font-size: 1.05em;
            font-weight: bold;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        #bookingForm .popup-option-button:hover {
            background-color: #004085;
        }
    </style>
</head>

<body>
    {header}
    <div class="container">
        <div class="image-gallery">
            <img id="mainImage" src="../hinhanh/{product.image}" alt="{product.name}" class="main-image" />
            <div class="thumbnail-wrapper">
                <span class="arrow" onclick="prevImage()">&#10094;</span>
                <div class="thumbnail-container" id="thumbnailSlider">
                </div>
                <span class="arrow" onclick="nextImage()">&#10095;</span>
            </div>
        </div>

        <div class="info" data-product-id="{product.id}" data-stock="{product.stock}">
            <p>TRANG CHỦ / MERCEDES-BENZ</p>
            <h2>{product.name}</h2>
            <div class="price">
                {product.price} <!-- <span class="old-price">2.839.000.000 VNĐ</span> -->
            </div>
            <p><strong>Dòng xe {product.category_name}</strong></p>

            <div class="promo-box">
                <ul>
                    <li>Khuyến mãi & ưu đãi</li>
                    <li>Tặng phụ kiện chính hãng</li>
                    <li>Tặng 3 năm hành không giới hạn số km</li>
                    <li>Hỗ trợ 3 năm gói cứu hộ</li>
                    <li>Tặng dù, mũ nón, áo, hộp quà</li>
                    <li>Tặng lệ phí giao xe</li>
                </ul>
                <i>* Quý khách vui lòng liên hệ để nhận thêm ưu đãi</i>
            </div>

            <div class="buttons">
                <button class="buy-btn" id="datxe">ĐẶT GIỮ XE</button>
                <button class="consult-btn" id="openConsultPopupBtn">ĐĂNG KÝ TƯ VẤN XE</button>
            </div>

            <script>
                function redirectToBooking(productId) {
                    // Validate ID
                    if (productId && !isNaN(productId)) {
                        console.log("Redirecting to booking with ID:", productId);
                        window.location.href = 'datcho.php?blank=' + productId;
                    } else {
                        console.error("Invalid product ID:", productId);
                    }
                }
            </script>
        </div>
    </div>
    <!-- Mô tả sản phẩm -->
    <div class="product-description">
        <div class="tabs">
            <span class="active-tab">MÔ TẢ</span>
            <span class="disabled-tab">ĐÁNH GIÁ (0)</span>
        </div>

        <!-- <h2>GLC thế hệ mới X254</h2>
        <p>
            GLC thế hệ mới định nghĩa lại sự xa xỉ trong thiết kế thể thao hiện đại, tôn thêm nét khỏe khoắn vốn có của
            dòng xe sang Mercedes-Benz SUV.
            Sự nâng cấp đáng kể về công nghệ và các tính năng hỗ trợ trong không gian nội thất mang đến những trải
            nghiệm đỉnh cao mới.
        </p> -->

        <!-- <div class="image-row">
            <img src="../hinhanh/mota1.jpg" alt="GLC front" />
            <img src="../hinhanh/mota2.jpg" alt="GLC rear" />
            <img src="../hinhanh/mota3.jpg" alt="GLC interior" />
        </div> -->
        <!-- <img src="../hinhanh/mota4.jpg" alt="GLC interior" style="width: 100%; margin-top: 20px; border-radius: 8px;" /> -->
        <h2>Thông số kỹ thuật</h2>
        <p>Thông số kỹ thuật của {product.name}</p>
        <ul style="line-height: 1.8; font-size: 16px; font-family: Arial, sans-serif;"></ul>
        <li style="text-align: justify">D x R x C : {length} x {width} x {height} (mm)</li>
        <li style="text-align: justify">Chiều dài cơ sở : 2888 (mm)</li>
        <li style="text-align: justify">Tự trọng/Tải trọng : 1925/585 (kg)</li>
        <li style="text-align: justify">Động cơ : {engine}</li>
        <li style="text-align: justify">Dung tích công tác : {displacement_cc} (cc)</li>
        <li style="text-align: justify">Công suất cực đại : {power} [258 hp] tại 5800 vòng/phút</li>
        <li style="text-align: justify">Mô-men xoắn cực đại : {torque} Nm tại 2000 – 3200 vòng/phút</li>
        <li style="text-align: justify">Hộp số : {transmission}</li>
        <li style="text-align: justify">Dẫn động : {drive}</li>
        <li style="text-align: justify">Tăng tốc (0 – 100 km/h) : {acceleration} (giây)</li>
        <li style="text-align: justify">Vận tốc tối đa : {max_speed} (km/h)</li>
        <li style="text-align: justify">Dung tích nhiên liệu : {fuel_capacity} (lít)</li>
        <li style="text-align: justify">Loại nhiên liệu : {fuel_type}</li>
        <li style="text-align: justify">Mức tiêu thụ nhiên liệu : {fuel_consumption_combined} (l/100km)</li>
        </ul>
        <!-- <h2>Ngoại Thất Mercedes-Benz GLC 300 4MATIC</h2>
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
        <li style="text-align: justify">Ốp bệ bước cửa trước với dòng chữ "Mercedes-Benz" phát sáng</li>
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
        </ul> -->
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
    <div id="consultPopup" class="popup-overlay" style="display: none;">
        <div class="popup-content">
            <span class="popup-close" id="closeConsultPopupBtn">&times;</span>
            <h2>Đăng Ký Tư Vấn</h2>
            <p class="popup-description">Vui lòng chọn một trong các hình thức tư vấn dưới đây:</p>
            <div class="popup-options">
                <a href="javascript:void(0);" id="openBookingPopupBtn" class="popup-option-button">Đặt Lịch Lái Thử</a>
                <a href="tel:YOUR_PHONE_NUMBER" class="popup-option-button phone">Gọi Điện Tư Vấn Trực Tiếp</a>
                <!-- Hoặc bạn có thể hiển thị số điện thoại:
                <div class="phone-info">
                    <p>Hoặc gọi trực tiếp cho chúng tôi:</p>
                    <p style="font-size: 1.2em; font-weight: bold; color: #0056b3;">YOUR_PHONE_NUMBER</p>
                </div>
                -->
            </div>
        </div>
    </div>

    <div id="bookingPopup" class="popup-overlay" style="display: none;">
        <div class="popup-content booking-popup-content">
            <span class="popup-close" id="closeBookingPopupBtn">&times;</span>
            <h2>Đặt Lịch Lái Thử Xe</h2>
            <form id="bookingForm">
                <div class="form-group">
                    <label for="bookingFullName">Họ và Tên:</label>
                    <input type="text" id="bookingFullName" value="{username}" name="fullName" placeholder="Nhập họ và tên" required>
                </div>
                <div class="form-group">
                    <label for="bookingPhoneNumber">Số Điện Thoại:</label>
                    <input type="tel" id="bookingPhoneNumber" value="{phone}" name="phoneNumber" placeholder="Nhập số điện thoại" pattern="[0-9]{10,11}" title="Vui lòng nhập số điện thoại hợp lệ (10-11 chữ số)" required>
                </div>
                <div class="form-group">
                    <label for="bookingEmail">Email (Không bắt buộc):</label>
                    <input type="email" id="bookingEmail" value="{email}" name="email" placeholder="Nhập email">
                </div>
                <div class="form-group">
                    <label for="bookingTestDriveDate">Ngày Lái Thử:</label>
                    <input type="date" id="bookingTestDriveDate" name="testDriveDate" required>
                </div>
                <div class="form-group">
                    <label for="bookingTestDriveTime">Giờ Lái Thử:</label>
                    <select id="bookingTestDriveTime" name="testDriveTime" required>
                        <option value="">Chọn giờ</option>
                        <option value="08:30">08:30</option>
                        <option value="09:00">09:00</option>
                        <option value="09:30">09:30</option>
                        <option value="10:00">10:00</option>
                        <option value="10:30">10:30</option>
                        <option value="11:00">11:00</option>
                        <option value="11:30">11:30</option>
                        <option value="13:30">13:30</option>
                        <option value="14:00">14:00</option>
                        <option value="14:30">14:30</option>
                        <option value="15:00">15:00</option>
                        <option value="15:30">15:30</option>
                        <option value="16:00">16:00</option>
                        <option value="16:30">16:30</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="bookingLocation">Địa điểm (Showroom):</label>
                    <select id="bookingLocation" name="location" required>
                        <option value="Mercedes-Benz Haxaco Láng Hạ">Mercedes-Benz Haxaco Láng Hạ</option>
                        <option value="Mercedes-Benz Haxaco Điện Biên Phủ">Mercedes-Benz Haxaco Điện Biên Phủ</option>
                    </select>
                    <!-- Hoặc dùng select nếu có nhiều địa điểm:
                    <select id="bookingLocation" name="location" required>
                        <option value="Showroom A">Showroom A</option>
                        <option value="Showroom B">Showroom B</option>
                    </select>
                    -->
                </div>
                <div class="form-group full-width">
                    <label for="bookingNotes">Ghi chú (Xe muốn lái thử, yêu cầu khác,...):</label>
                    <textarea id="bookingNotes" name="notes" rows="3"></textarea>
                </div>
                <button class="datlich-button">GỬI YÊU CẦU ĐẶT LỊCH</button>
            </form>
        </div>
    </div>

    <script>
        const images = [
            "../hinhanh/{product.image}",
            "../hinhanh/chitiet1.jpg",
            "../hinhanh/chitiet2.jpg",
            "../hinhanh/chitiet3.jpg",
            "../hinhanh/chitiet4.jpg",
            "../hinhanh/chitiet5.jpg",
            "../hinhanh/chitiet6.jpg",
            "../hinhanh/chitiet7.jpg",
            "../hinhanh/chitiet8.jpg",
        ];

        let currentIndex = 0;
        let visibleStart = 0;
        const maxVisible = 4;

        const mainImage = document.getElementById("mainImage");
        const thumbnailSlider = document.getElementById("thumbnailSlider");

        function renderThumbnails() {
            thumbnailSlider.innerHTML = "";
            const visibleImages = images.slice(visibleStart, visibleStart + maxVisible);

            visibleImages.forEach((src, idx) => {
                const img = document.createElement("img");
                img.src = src;
                img.className = "thumbnail" + ((src === mainImage.src) ? " active" : "");
                img.onclick = () => {
                    currentIndex = images.indexOf(src);
                    updateMainImage();
                };
                thumbnailSlider.appendChild(img);
            });
        }

        function updateMainImage() {
            mainImage.src = images[currentIndex];
            renderThumbnails();
        }

        function prevImage() {
            if (visibleStart > 0) {
                visibleStart--;
                renderThumbnails();
            }
        }

        function nextImage() {
            if (visibleStart + maxVisible < images.length) {
                visibleStart++;
                renderThumbnails();
            }
        }

        // Initial load
        updateMainImage();

        document.addEventListener('DOMContentLoaded', function () {
            const consultPopup = document.getElementById('consultPopup');
            const closeBtn = document.getElementById('closeConsultPopupBtn');
            if (closeBtn) {
                closeBtn.addEventListener('click', function () {
                    if (consultPopup) {
                        consultPopup.style.display = 'none';
                    }
                });
            }

            // Optional: Close popup if user clicks outside the popup content
            if (consultPopup) {
                consultPopup.addEventListener('click', function (event) {
                    if (event.target === consultPopup) { // Check if the click is on the overlay itself
                        consultPopup.style.display = 'none';
                    }
                });
            }

            // JavaScript for Booking Popup
            const bookingPopup = document.getElementById('bookingPopup');
            const openBookingBtn = document.getElementById('openBookingPopupBtn');
            const closeBookingBtn = document.getElementById('closeBookingPopupBtn'); // ID cho nút đóng booking popup
            const bookingForm = document.getElementById('bookingForm');

            if (openBookingBtn) {
                openBookingBtn.addEventListener('click', function (event) {
                    event.preventDefault(); // Ngăn hành vi mặc định của thẻ <a>
                    if (bookingPopup) {
                        bookingPopup.style.display = 'flex';
                        // Tùy chọn: Ẩn popup tư vấn khi mở popup đặt lịch
                        if (consultPopup) {
                            consultPopup.style.display = 'none';
                        }
                    }
                });
            }

            if (closeBookingBtn) {
                closeBookingBtn.addEventListener('click', function () {
                    if (bookingPopup) {
                        bookingPopup.style.display = 'none';
                    }
                });
            }

            if (bookingPopup) {
                bookingPopup.addEventListener('click', function (event) {
                    // Đóng popup nếu click vào vùng overlay bên ngoài nội dung
                    if (event.target === bookingPopup) {
                        bookingPopup.style.display = 'none';
                    }
                });
            }
            // Cập nhật ngày tối thiểu cho input date là ngày hiện tại
            const testDriveDateInput = document.getElementById('bookingTestDriveDate');
            if (testDriveDateInput) {
                const today = new Date().toISOString().split('T')[0];
                testDriveDateInput.setAttribute('min', today);
            }
        });
    </script>
    {footer}
</body>

</html>