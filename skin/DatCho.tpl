<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Đặt giữ chỗ xe</title>
    <link rel="stylesheet" href="DatCho.css">
</head>

<body>
    <a href="#" class="back-link">← Quay lại trang xe đã chọn</a>
    <div class="container">
        <div class="car-section">
            <img src="../hinhanh/sanpham1.jpg" alt="Xe" class="car-image"
                style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
            <h2>C 300 AMG (V1)</h2>
            <p>Giá: <strong>2.099.000.000 ₫</strong></p>
            <p>Tiền giữ chỗ: <strong>10.000.000 ₫</strong></p>
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
                <div class="form-step active">
                    <label>Danh xưng*</label>
                    <select required>
                        <option value="">Vui lòng chọn</option>
                        <option value="Anh">Anh</option>
                        <option value="Chị">Chị</option>
                    </select>

                    <label>Họ và Tên*</label>
                    <input type="text" placeholder="Nhập họ và tên" required>

                    <label>SĐT*</label>
                    <input type="tel" pattern="[0-9]{10,11}" placeholder="Ví dụ: 0901234567" required>

                    <label>Email*</label>
                    <input type="email" placeholder="example@gmail.com" required>

                    <label>Địa chỉ liên hệ</label>
                    <input type="text" placeholder="Số nhà, đường, quận, thành phố">

                    <button type="button" onclick="nextStep()">Tiếp tục</button>
                </div>

                <!-- Bước 2: Phương thức thanh toán -->
                <div class="form-step">
                    <label>Chọn phương thức*</label>
                    <select required>
                        <option value="">Vui lòng chọn</option>
                        <option value="Thẻ">Thẻ tín dụng</option>
                        <option value="Chuyển khoản">Chuyển khoản</option>
                        <option value="TIền Mặt">Tiền Mặt</option>
                    </select>

                    <label>Ghi chú thanh toán</label>
                    <input type="text" placeholder="Ví dụ: thanh toán qua ngân hàng ACB">

                    <div style="display: flex; justify-content: space-between;">
                        <button type="button" onclick="prevStep()">← Quay lại</button>
                        <button type="button" onclick="nextStep()">Tiếp tục →</button>
                    </div>

                </div>

                <!-- Bước 3: Thông tin thanh toán -->
                <div class="form-step">
                    <label>Số tài khoản*</label>
                    <input type="text" placeholder="Nhập số tài khoản" required>

                    <label>Tên chủ tài khoản*</label>
                    <input type="text" placeholder="Nhập tên chủ tài khoản" required>

                    <label>Ngân hàng*</label>
                    <input type="text" placeholder="VD: Vietcombank, ACB..." required>

                    <label>Chi nhánh</label>
                    <input type="text" placeholder="Tên chi nhánh (nếu có)">
                    <div style="display: flex; justify-content: space-between;">
                        <button type="button" onclick="prevStep()">← Quay lại</button>
                        <button type="button" onclick="nextStep()">Tiếp tục →</button>
                    </div>

                </div>

                <!-- Bước 4: Chọn nhà phân phối -->
                <div class="form-step">
                    <label>Chọn đại lý*</label>
                    <select required>
                        <option value="">Chọn đại lý</option>
                        <option value="Mercedes Hà Nội">Mercedes Hà Nội</option>
                        <option value="Mercedes TP.HCM">Mercedes TP.HCM</option>
                        <option value="Mercedes Đà Nẵng">Mercedes Đà Nẵng</option>
                    </select>

                    <label>Nhân viên phụ trách (nếu có)</label>
                    <input type="text" placeholder="Tên nhân viên tư vấn">

                    <div style="display: flex; justify-content: space-between;">
                        <button type="button" onclick="prevStep()">← Quay lại</button>
                        <button type="button" onclick="nextStep()">Tiếp tục →</button>
                    </div>

                </div>

                <!-- Bước 5: Xác nhận giữ chỗ -->
                <div class="form-step">
                    <p>Xác nhận giữ chỗ xe cho đơn hàng trên?</p>
                    <div style="display: flex; justify-content: space-between;">
                        <button type="button" onclick="prevStep()">← Quay lại</button>
                        <button type="submit">Xác nhận giữ chỗ</button>
                    </div>

                </div>
            </form>

            <div class="success-message" style="display: none;">
                <h3>✅ Đặt giữ chỗ thành công!</h3>

            </div>
            <button onclick="resetPage()" style="position: fixed; bottom: 20px; right: 20px;">Đặt lại</button>
            <script>
                function resetPage() {
                    location.reload();
                }
            </script>
        </div>
    </div>

    <script src="DatCho.js"></script>
</body>

</html>