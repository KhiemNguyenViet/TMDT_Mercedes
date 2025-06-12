<!DOCTYPE html>
<html lang="vi">

<head>
    <meta name="description"
        content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords"
        content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Banner.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <link rel="stylesheet" href="../skin/tpl/css/ChiTietSanPham.css">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Chi tiết xe Mercedes</title>
</head>
<style>
    body {
        opacity: 0;
        transition: opacity 0.1s ease-in-out;
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.body.style.opacity = "1";
    });

</script>

<body>
    {header}
    <script>
        // Cập nhật lại chức năng điều hướng ảnh
        function prevImage() {
            if (currentIndex > 0) {
                currentIndex--;
                // Nếu ảnh hiện tại nằm ngoài vùng thumbnail đang hiển thị thì dịch thumbnail
                if (currentIndex < visibleStart) {
                    visibleStart = currentIndex;
                }
                updateMainImage();
            }
        }

        function nextImage() {
            if (currentIndex < images.length - 1) {
                currentIndex++;
                // Nếu ảnh hiện tại vượt quá vùng thumbnail đang hiển thị thì dịch thumbnail
                if (currentIndex >= visibleStart + maxVisible) {
                    visibleStart = currentIndex - maxVisible + 1;
                }
                updateMainImage();
            }
        }
    </script>
    <div class="container">
        <div class="image-gallery">
            <img id="mainImage" src="../uploads/{product.image}" alt="{product.name}" class="main-image" onclick="showImage(this.src)" style="cursor: pointer;" />
            <div class="thumbnail-wrapper">
                <span class="arrow" onclick="prevImage()">&#10094;</span>
                <div class="thumbnail-container" id="thumbnailSlider">
                </div>
                <span class="arrow" onclick="nextImage()">&#10095;</span>
            </div>
        </div>

        <div class="info" data-user-id="{user_id}" data-product-id="{product.id}" data-stock="{product.stock}">
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
        </div>
    </div>
    <!-- Mô tả sản phẩm -->
    <div class="product-description">
        <div class="tabs">
            <span class="active-tab">MÔ TẢ</span>
        </div>
        <div class="specs-row" style="display: flex; gap: 32px; flex-wrap: wrap;">
            <div class="specs-col" style="flex: 1 1 350px; min-width: 320px;">
                <div class="section-header">
                    <i class="fas fa-cog"></i> THÔNG SỐ KỸ THUẬT
                </div>
                <table class="specs-table">
                    <thead>
                        <tr>
                            <th>Thông số</th>
                            <th>Chi tiết</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td data-label="Kích thước (D x R x C)">Kích thước (D x R x C)</td>
                            <td data-label="Kích thước (D x R x C)">{length} x {width} x {height} (mm)</td>
                        </tr>
                        <tr>
                            <td data-label="Chiều dài cơ sở">Chiều dài cơ sở</td>
                            <td data-label="Chiều dài cơ sở">2888 (mm)</td>
                        </tr>
                        <tr>
                            <td data-label="Tự trọng/Tải trọng">Tự trọng/Tải trọng</td>
                            <td data-label="Tự trọng/Tải trọng">1925/585 (kg)</td>
                        </tr>
                        <tr>
                            <td data-label="Động cơ">Động cơ</td>
                            <td data-label="Động cơ">{engine}</td>
                        </tr>
                        <tr>
                            <td data-label="Dung tích công tác">Dung tích công tác</td>
                            <td data-label="Dung tích công tác">{displacement_cc} (cc)</td>
                        </tr>
                        <tr>
                            <td data-label="Công suất cực đại">Công suất cực đại</td>
                            <td data-label="Công suất cực đại">{power} [258 hp] tại 5800 vòng/phút</td>
                        </tr>
                        <tr>
                            <td data-label="Mô-men xoắn cực đại">Mô-men xoắn cực đại</td>
                            <td data-label="Mô-men xoắn cực đại">{torque} Nm tại 2000 – 3200 vòng/phút</td>
                        </tr>
                        <tr>
                            <td data-label="Hộp số">Hộp số</td>
                            <td data-label="Hộp số">{transmission}</td>
                        </tr>
                        <tr>
                            <td data-label="Dẫn động">Dẫn động</td>
                            <td data-label="Dẫn động">{drive}</td>
                        </tr>
                        <tr>
                            <td data-label="Tăng tốc (0 – 100 km/h)">Tăng tốc (0 – 100 km/h)</td>
                            <td data-label="Tăng tốc (0 – 100 km/h)">{acceleration} (giây)</td>
                        </tr>
                        <tr>
                            <td data-label="Vận tốc tối đa">Vận tốc tối đa</td>
                            <td data-label="Vận tốc tối đa">{max_speed} (km/h)</td>
                        </tr>
                        <tr>
                            <td data-label="Dung tích nhiên liệu">Dung tích nhiên liệu</td>
                            <td data-label="Dung tích nhiên liệu">{fuel_capacity} (lít)</td>
                        </tr>
                        <tr>
                            <td data-label="Loại nhiên liệu">Loại nhiên liệu</td>
                            <td data-label="Loại nhiên liệu">{fuel_type}</td>
                        </tr>
                        <tr>
                            <td data-label="Mức tiêu thụ nhiên liệu">Mức tiêu thụ nhiên liệu</td>
                            <td data-label="Mức tiêu thụ nhiên liệu">{fuel_consumption_combined} (l/100km)</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="specs-col" style="flex: 1 1 350px; min-width: 320px;">
                <div class="section-header">
                    <i class="fas fa-tachometer-alt"></i> KHẢ NĂNG VẬN HÀNH
                </div>
                <table class="specs-table">
                    <thead>
                        <tr>
                            <th>Tính năng</th>
                            <th>Mô tả</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td data-label="Động cơ mới">Động cơ mới</td>
                            <td data-label="Động cơ mới">Công nghệ 48V mild-hybrid</td>
                        </tr>
                        <tr>
                            <td data-label="Chức năng ECO">Chức năng ECO</td>
                            <td data-label="Chức năng ECO">ECO start/stop</td>
                        </tr>
                        <tr>
                            <td data-label="Hệ thống phanh">Hệ thống phanh</td>
                            <td data-label="Hệ thống phanh">Đĩa phanh đục lỗ kích thước lớn ở cầu trước</td>
                        </tr>
                        <tr>
                            <td data-label="Hệ thống treo">Hệ thống treo</td>
                            <td data-label="Hệ thống treo">AGILITY CONTROL</td>
                        </tr>
                        <tr>
                            <td data-label="Hệ thống lái">Hệ thống lái</td>
                            <td data-label="Hệ thống lái">Direct-Steer trợ lực điện với trợ lực & tỉ số truyền lái biến
                                thiên theo tốc độ</td>
                        </tr>
                        <tr>
                            <td data-label="Cần số">Cần số</td>
                            <td data-label="Cần số">Điều khiển điện DIRECT SELECT phía sau tay lái</td>
                        </tr>
                        <tr>
                            <td data-label="Lẫy chuyển số">Lẫy chuyển số</td>
                            <td data-label="Lẫy chuyển số">Bán tự động DIRECT SELECT phía sau tay lái</td>
                        </tr>
                        <tr>
                            <td data-label="Chế độ vận hành">Chế độ vận hành</td>
                            <td data-label="Chế độ vận hành">Cụm chuyển đổi DYNAMIC SELECT với nhiều chế độ vận hành
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
    <div id="consultPopup" class="popup-overlay" style="display: none;">
        <div class="popup-content">
            <span class="popup-close" id="closeConsultPopupBtn">&times;</span>
            <h2>Đăng Ký Tư Vấn</h2>
            <p class="popup-description">Vui lòng chọn một trong các hình thức tư vấn dưới đây:</p>
            <div class="popup-options">
                <a href="javascript:void(0);" id="openBookingPopupBtn" class="popup-option-button">Đặt Lịch Lái Thử</a>
                <a href="tel:YOUR_PHONE_NUMBER" class="popup-option-button phone">Gọi Điện Tư Vấn Trực Tiếp</a>
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
                    <input type="text" id="bookingFullName" value="{username}" name="fullName"
                        placeholder="Nhập họ và tên" required>
                </div>
                <div class="form-group">
                    <label for="bookingPhoneNumber">Số Điện Thoại:</label>
                    <input type="tel" id="bookingPhoneNumber" value="{phone}" name="phoneNumber"
                        placeholder="Nhập số điện thoại" pattern="[0-9]{10,11}"
                        title="Vui lòng nhập số điện thoại hợp lệ (10-11 chữ số)" required>
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
                <button type="button" class="datlich-button">GỬI YÊU CẦU ĐẶT LỊCH</button>
            </form>
        </div>
    </div>

    <!-- Thêm popup thông báo thành công -->
    <div id="successPopup" class="popup-overlay" style="display: none;">
        <div class="popup-content success-popup">
            <div class="success-icon">✓</div>
            <h2>Đặt lịch thành công!</h2>
            <p>Yêu cầu đặt lịch lái thử xe của Quý khách đã được gửi. Chúng tôi sẽ liên hệ lại sớm nhất, xin quý khách vui lòng để ý kiểm tra email để nhận thông báo.</p>
            <button class="close-success-popup">Đóng</button>
        </div>
    </div>

    <script>
        const images = [
            "../uploads/{product.image}",
            "../hinhanh/chitiet1.jpg",
            "../hinhanh/chitiet2.jpg",
            "../hinhanh/chitiet3.jpg",
            "../hinhanh/chitiet4.jpg",
            "../hinhanh/chitiet5.jpg",
            // "../hinhanh/chitiet6.jpg",
            // "../hinhanh/chitiet7.jpg",
            // "../hinhanh/chitiet8.jpg",
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

        // function prevImage() {
        //     if (visibleStart > 0) {
        //         visibleStart--;
        //         renderThumbnails();
        //     }
        // }

        // function nextImage() {
        //     if (visibleStart + maxVisible < images.length) {
        //         visibleStart++;
        //         renderThumbnails();
        //     }
        // }

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

        function showImage(src) {
            // Tạo modal container
            const modal = document.createElement('div');
            modal.style.position = 'fixed';        // Đặt vị trí cố định trên màn hình
            modal.style.zIndex = '9999';           // Đảm bảo hiển thị trên cùng các phần tử khác
            modal.style.left = '0';                // Căn lề trái
            modal.style.top = '0';                 // Căn lề trên
            modal.style.width = '100%';            // Chiều rộng 100% màn hình
            modal.style.height = '100%';           // Chiều cao 100% màn hình
            modal.style.backgroundColor = 'rgba(0,0,0,0.9)';  // Nền đen với độ trong suốt 90%
            modal.style.display = 'flex';          // Sử dụng flexbox để căn giữa
            modal.style.alignItems = 'center';     // Căn giữa theo chiều dọc
            modal.style.justifyContent = 'center'; // Căn giữa theo chiều ngang
            modal.style.cursor = 'pointer';        // Con trỏ chuột thành dạng pointer

            // Tạo ảnh phóng to
            const img = document.createElement('img');
            img.src = src;                         // Lấy đường dẫn ảnh từ tham số
            img.style.maxWidth = '90%';            // Chiều rộng tối đa 90% màn hình
            img.style.maxHeight = '90%';           // Chiều cao tối đa 90% màn hình
            img.style.objectFit = 'contain';       // Giữ tỷ lệ ảnh gốc

            // Thêm ảnh vào modal
            modal.appendChild(img);

            // Thêm modal vào body của trang
            document.body.appendChild(modal);

            // Xử lý sự kiện click để đóng modal
            modal.onclick = function() {
                document.body.removeChild(modal);   // Xóa modal khỏi trang
            };
        }

    </script>
    {footer}
</body>

</html>