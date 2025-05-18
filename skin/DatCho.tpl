<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Đặt giữ chỗ xe</title>
    <link rel="stylesheet" href="../skin/tpl/css/DatCho.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Banner.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
</head>

<body>
    {header}
    <a href="/product/{product.id}.html" class="back-link">← Quay lại trang xe đã chọn</a>
    <div class="container">
        <div data-product-id="{product.id}" class="car-section">
            <img src="../hinhanh/{product.image}" alt="{product.name}" class="car-image">
            <h2>{product.name}</h2>
            <div data-product-id="{product.id}" class="car-info">
                <p>Danh mục: <strong>{product.category_name}</strong></p>
                <p class="price" data-price="{product.price}">Giá xe: <strong>{product.price}</strong></p>
                <p>Tiền giữ chỗ: <strong>10.000.000 VNĐ</strong></p>
            </div>
        </div>

        <div class="form-section">
            <div class="step-nav">
                <div class="step active">1. Chi tiết thanh toán</div>
                <div class="step">2. Phương thức thanh toán</div>
                <div class="step">3. Thông tin thanh toán</div>
                <div class="step">4. Nhà phân phối</div>
                <div class="step">5. Giữ chỗ ngay</div>
            </div>

            <form id="multiStepForm">
                <!-- Bước 1: Chi tiết thanh toán -->
                <div  class="form-step active">
                    <label>Danh xưng*</label>
                    <select name="salutation" required>
                        <option value="Anh">Anh</option>
                        <option value="Chị">Chị</option>
                    </select>

                    <label class="user_info" data-user-id="{user_id}">Họ và Tên*</label>
                    <input type="text" value="{username}" name="fullName" placeholder="Nhập họ và tên" required>

                    <label>SĐT*</label>
                    <input type="tel" value="{phone}" name="phoneNumber" pattern="[0-9]{10,11}" placeholder="Ví dụ: 0901234567" required>

                    <label>Email*</label>
                    <input type="email" value="{email}" name="email" placeholder="example@gmail.com" required>

                    <label>Địa chỉ liên hệ</label>
                    <input type="text" value="{address}" name="address" placeholder="Số nhà, đường, quận, thành phố">

                    <button type="button" onclick="nextStep()">Tiếp tục</button>
                </div>

                <!-- Bước 2: Phương thức thanh toán -->
                <div class="form-step">
                    <p>Giá xe: <strong>{product.price}</strong></p>
                    <p>Sử dụng tiền cá nhân hoặc dịch vụ của bên thứ ba để thanh toán hóa đơn cuối cùng. Nhà phân phối chính hãng của Mercedes-Benz Việt Nam sẽ liên hệ Quý khách để làm rõ các điều khoản thanh toán. Khi chọn Tiếp tục, Quý khách sẽ tiến hành thanh toán Tiền giữ chỗ xe</p>
                    <p>Tiền giữ chỗ: <strong>10.000.000 VNĐ</strong></p>

                    <label>Quét mã QR để chuyển tiền:</label><br>
                    <img src="../hinhanh/qr_code.png" alt="Mã QR chuyển tiền" style="max-width: 250px; display: block; margin-bottom: 10px;">

                    <!-- <label>Chọn ảnh xác nhận chuyển khoản (bắt buộc):</label>
                    <input type="file" name="payment_image" accept="image/*" required> -->

                    <form action="upload_process.php" method="POST" enctype="multipart/form-data">
                        Chọn ảnh xác nhận chuyển khoản (bắt buộc): <input type="file" name="image" required>
                        <br><br>
                        <input type="submit" name="submit" value="Upload">
                    </form>

                    <label>Ghi chú thanh toán</label>
                    <input type="text" name="pay_note" placeholder="Ví dụ: Ghi chú nhắc nhở của khách hàng...">

                    <div style="display: flex; justify-content: space-between;">
                        <button type="button" onclick="prevStep()">← Quay lại</button>
                        <button type="button" onclick="nextStep()">Tiếp tục →</button>
                    </div>

                </div>

                <!-- Bước 3: Thông tin thanh toán -->
                <div class="form-step">
                    <label>Số tài khoản của quý khách *</label>
                    <input type="text" name="bank_account_number" placeholder="Nhập số tài khoản" required>

                    <label>Tên chủ tài khoản của quý khách *</label>
                    <input type="text" name="bank_account_name" placeholder="Nhập tên chủ tài khoản" required>

                    <label>Ngân hàng của quý khách *</label>
                    <input type="text" name="bank_name" placeholder="VD: Vietcombank, ACB..." required>

                    <label>Chi nhánh ngân hàng của quý khách</label>
                    <input type="text" name="bank_branch" placeholder="Tên chi nhánh (nếu có)">
                    <div style="display: flex; justify-content: space-between;">
                        <button type="button" onclick="prevStep()">← Quay lại</button>
                        <button type="button" onclick="nextStep()">Tiếp tục →</button>
                    </div>

                </div>

                <!-- Bước 4: Chọn nhà phân phối -->
                <div class="form-step">
                    <label>Chọn đại lý*</label>
                    <select name="dealer" required>
                        <option value="">Chọn đại lý</option>
                        <option value="Mercedes Hà Nội">Mercedes Hà Nội</option>
                        <option value="Mercedes TP.HCM">Mercedes TP.HCM</option>
                        <option value="Mercedes Đà Nẵng">Mercedes Đà Nẵng</option>
                    </select>

                    <label>Nhân viên phụ trách (nếu có)</label>
                    <input type="text" name="sales_person" placeholder="Tên nhân viên tư vấn">

                    <div style="display: flex; justify-content: space-between;">
                        <button type="button" onclick="prevStep()">← Quay lại</button>
                        <button type="button" onclick="nextStep()">Tiếp tục →</button>
                    </div>

                </div>

                <!-- Bước 5: Xác nhận giữ chỗ -->
                <div class="form-step">
                    <p>Qúy khách xác nhận giữ chỗ xe cho đơn hàng trên?</p>
                    <div style="display: flex; justify-content: space-between;">
                        <button type="button" onclick="prevStep()">← Quay lại</button>
                        <button id="xacnhan_giucho" type="submit">Xác nhận giữ chỗ</button>
                    </div>

                </div>
            </form>

            <!-- <div class="success-message" style="display: none;">
                <h3>✅ Đã đặt giữ chỗ vui lòng đợi xác nhận từ nhà phân phối!</h3>

            </div> -->
            <!-- <button onclick="resetPage()" style="position: fixed; bottom: 20px; right: 20px;">Đặt lại</button> -->
            <script>
                function resetPage() {
                    location.reload();
                }
            </script>
        </div>
    </div>
    {footer}

    <script src="../skin/tpl/js/DatCho.js"></script>
</body>

</html>