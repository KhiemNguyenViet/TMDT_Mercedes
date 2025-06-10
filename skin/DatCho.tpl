<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <title>Đặt giữ chỗ xe</title>
    <meta name="description"
        content="Mercedes-Benz Việt Nam - Đặt giữ chỗ xe, thanh toán tiền giữ chỗ xe, đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords"
        content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../skin/tpl/css/DatCho.css?v=<?php echo time(); ?>">
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Banner.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
</head>
<style>
    body {
        opacity: 0;
        transition: opacity 0.1s ease-in-out;
    }
    /* Thêm CSS cho toastr */
    #toast-container {
        position: fixed;
        top: 20px;
        right: 20px;
        z-index: 9999;
    }
    .toast {
        background-color: #fff;
        border-radius: 4px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        padding: 15px;
        margin-bottom: 10px;
        min-width: 300px;
    }
    .toast-success {
        background-color: #dff0d8;
        border-color: #d6e9c6;
        color: #3c763d;
    }
    .toast-error {
        background-color: #f2dede;
        border-color: #ebccd1;
        color: #a94442;
    }
    /* CSS cho popup */
    .popup-overlay {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        z-index: 9999;
        animation: fadeIn 0.3s ease-in-out;
    }

    .popup-content {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        text-align: center;
        min-width: 300px;
        animation: slideIn 0.3s ease-in-out;
    }

    .popup-icon {
        font-size: 48px;
        margin-bottom: 20px;
    }

    .popup-icon.success {
        color: #4CAF50;
    }

    .popup-icon.error {
        color: #f44336;
    }

    .popup-message {
        font-size: 18px;
        margin-bottom: 25px;
        color: #333;
    }

    .popup-buttons {
        display: flex;
        justify-content: center;
        gap: 15px;
    }

    .popup-button {
        padding: 10px 25px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: all 0.3s ease;
    }

    .popup-button.primary {
        background-color: #4CAF50;
        color: white;
    }

    .popup-button.primary:hover {
        background-color: #45a049;
    }

    .popup-button.secondary {
        background-color: #f44336;
        color: white;
    }

    .popup-button.secondary:hover {
        background-color: #da190b;
    }

    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    @keyframes slideIn {
        from {
            transform: translate(-50%, -60%);
            opacity: 0;
        }
        to {
            transform: translate(-50%, -50%);
            opacity: 1;
        }
    }

    /* CSS cho nút khám phá */
    .khampha {
        position: fixed;
        bottom: 30px;
        right: 30px;
        z-index: 1000;
        padding: 15px 25px;
        background-color: #4CAF50;
        color: white;
        border-radius: 50px;
        text-decoration: none;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        transition: all 0.3s ease;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .khampha:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
        background-color: #45a049;
        color: white;
        text-decoration: none;
    }

    .khampha:active {
        transform: translateY(1px);
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    }

    /* Thêm animation cho nút */
    @keyframes float {
        0% {
            transform: translateY(0px);
        }
        50% {
            transform: translateY(-5px);
        }
        100% {
            transform: translateY(0px);
        }
    }

    .khampha {
        animation: float 3s ease-in-out infinite;
    }

    /* Thêm responsive */
    @media (max-width: 768px) {
        .khampha {
            bottom: 20px;
            right: 20px;
            padding: 12px 20px;
            font-size: 14px;
        }
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.body.style.opacity = "1";
    });

</script>

<body>
    {header}
    <a href="/product/{product.id}.html" class="back-link">← Quay lại trang xe đã chọn</a>
    <div class="container">
        <div data-product-id="{product.id}" class="car-section">
            <img src="../uploads/{product.image}" alt="{product.name}" class="car-image">
            <h2>{product.name}</h2>
            <div data-product-id="{product.id}" class="car-info">
                <p>Danh mục: <strong>{product.category_name}</strong></p>
                <p class="price" data-price="{product.price}">Giá xe: <strong>{product.price}</strong></p>
                <p>Tiền giữ chỗ: <strong>10.000.000 VNĐ</strong></p>
            </div>
        </div>

        <div class="form-section_datxe">
            <div class="step-nav">
                <div class="step active">1. Chi tiết thanh toán</div>
                <div class="step">2. Phương thức thanh toán</div>
                <div class="step">3. Thông tin thanh toán</div>
                <div class="step">4. Nhà phân phối</div>
                <div class="step">5. Giữ chỗ ngay</div>
            </div>

            <form id="multiStepForm" method="POST" enctype="multipart/form-data" onsubmit="return false;">
                <!-- Bước 1: Chi tiết thanh toán -->
                <div class="form-step active">
                    <label>Danh xưng*</label>
                    <select name="salutation" required>
                        <option value="Anh">Anh</option>
                        <option value="Chị">Chị</option>
                    </select>

                    <label class="user_info" data-user-id="{user_id}">Họ và Tên*</label>
                    <input type="text" value="{fullName}" name="fullName" placeholder="Nhập họ và tên" required>

                    <label>SĐT*</label>
                    <input type="tel" value="{phone}" name="phoneNumber" pattern="[0-9]{10,11}"
                        placeholder="Ví dụ: 0901234567" required>

                    <label>Email*</label>
                    <input type="email" value="{email}" name="email" placeholder="example@gmail.com" required>

                    <label>Địa chỉ liên hệ</label>
                    <input type="text" value="{address}" name="address" placeholder="Số nhà, đường, quận, thành phố">

                    <button type="button" onclick="nextStep()">Tiếp tục</button>
                </div>

                <!-- Bước 2: Phương thức thanh toán -->
                <div class="form-step">
                    <p>Giá xe: <strong>{product.price}</strong></p>
                    <p>Sử dụng tiền cá nhân hoặc dịch vụ của bên thứ ba để thanh toán hóa đơn cuối cùng. Nhà phân phối
                        chính hãng của Mercedes-Benz Việt Nam sẽ liên hệ Quý khách để làm rõ các điều khoản thanh toán.
                        Khi chọn Tiếp tục, Quý khách sẽ tiến hành thanh toán Tiền giữ chỗ xe</p>
                    <p>Tiền giữ chỗ: <strong>10.000.000 VNĐ</strong></p>

                    <label>Quét mã QR để chuyển tiền:</label><br>
                    <img src='https://img.vietqr.io/image/MB-0981663735-print.jpg?amount=10000000&addInfo={username} Thanh Toán Tiền Giữ Xe {product.name}'
                        alt="Mã QR chuyển tiền" style="max-width: 250px; display: block; margin-bottom: 10px;">

                    <label>Chọn ảnh xác nhận chuyển khoản (bắt buộc):</label>
                    <input id="payment_image" type="file" name="payment_image" accept="image/*" required>


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
                        <button id="xacnhan_giucho" type="button">Xác nhận giữ chỗ</button>
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
    <div class="load_overlay" style="display: none;"></div>
    <div class="load_process" style="display: none;">
        <div class="load_content">
            <img src="/hinhanh/load.gif" alt="loading" width="70">
            <div class="load_note">Hệ thống đang xử lý</div>
        </div>
    </div>
    {footer}

    <script src="../skin/tpl/js/DatCho.js"></script>

    <!-- Thêm HTML cho popup -->
    <div id="popup" class="popup-overlay">
        <div class="popup-content">
            <div class="popup-icon success">✓</div>
            <div class="popup-message"></div>
            <div class="popup-buttons">
                <button class="popup-button primary" onclick="closePopup()">OK</button>
            </div>
        </div>
    </div>

    <script>
        function showPopup(message, isSuccess = true) {
            const popup = document.getElementById('popup');
            const popupMessage = popup.querySelector('.popup-message');
            const popupIcon = popup.querySelector('.popup-icon');
            
            popupMessage.textContent = message;
            popupIcon.className = 'popup-icon ' + (isSuccess ? 'success' : 'error');
            popupIcon.textContent = isSuccess ? '✓' : '✕';
            
            popup.style.display = 'block';
        }

        function closePopup() {
            const popup = document.getElementById('popup');
            popup.style.display = 'none';
            if (popup.dataset.redirect) {
                window.location.href = popup.dataset.redirect;
            }
        }

        // Sửa lại phần xử lý response
        if (result.ok === 1) {
            const popup = document.getElementById('popup');
            popup.dataset.redirect = '/cacmauxe.html';
            showPopup(result.thongbao, true);
        } else {
            showPopup(result.thongbao, false);
        }
    </script>
</body>
<script>
    $(document).ready(function () {
        // Xóa tất cả event handlers cũ trước khi thêm handler mới
        $('#xacnhan_giucho').off('click').on('click', function (e) {
            e.preventDefault();

            // Ngăn chặn double submit
            if ($(this).data('submitting')) return;
            $(this).data('submitting', true);

            console.log('Starting form submission...');

            // Tạo FormData từ form
            var form = document.getElementById('multiStepForm');
            var formData = new FormData(form);

            // Thêm action và các trường bị thiếu
            formData.append('action', 'xacnhan_datcho');

            // Lấy product_id từ data attribute
            var product_id = $('.car-info').data('product-id');
            console.log('Product ID:', product_id);
            formData.append('product_id', product_id);

            var fullName = $('input[name="fullName"]').val();
            console.log('Full Name:', fullName);
            formData.append('fullName', fullName);

            var user_id = $('.user_info').data('user-id');
            console.log('User ID:', user_id);
            formData.append('user_id', user_id);

            // Lấy price từ data attribute
            var price = $('.price').data('price');
            console.log('Price:', price);
            formData.append('price', price);

            // Log tất cả dữ liệu sẽ gửi đi
            console.log('Form data:');
            for (var pair of formData.entries()) {
                console.log(pair[0] + ': ' + pair[1]);
            }

            // Kiểm tra dữ liệu bắt buộc
            if (!product_id) {
                alert('Không tìm thấy thông tin sản phẩm!');
                $(this).data('submitting', false);
                return;
            }

            // console.log('Form data:', formData);
            // debugger;
            // die();
            // Disable button
            $(this).prop('disabled', true).text('Đang xử lý...');

            // Gửi AJAX request
            $.ajax({
                url: '/process.php',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    console.log('Response received:', response);
                    try {
                        var result = JSON.parse(response);
                        if (result.ok === 1) {
                            const popup = document.getElementById('popup');
                            popup.dataset.redirect = '/cacmauxe.html';
                            showPopup(result.thongbao, true);
                        } else {
                            showPopup(result.thongbao, false);
                        }
                    } catch (e) {
                        console.error('Error parsing response:', e);
                        showPopup('Có lỗi xảy ra khi xử lý phản hồi', false);
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Ajax error:', status, error);
                    console.error('Response text:', xhr.responseText);
                    alert('Có lỗi khi gửi yêu cầu: ' + error);
                },
                complete: function () {
                    // Enable button và reset trạng thái submitting
                    $('#xacnhan_giucho')
                        .prop('disabled', false)
                        .text('Xác nhận giữ chỗ')
                        .data('submitting', false);
                }
            });
        });

        // Xóa các event handlers test nếu có
        $('#xacnhan_giucho').off('click.test');
    });
</script>

</html>