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
                    <input type="text" value="{username}" name="fullName" placeholder="Nhập họ và tên" required>

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
                            alert('Thành công: ' + result.thongbao);
                            // Chuyển hướng ngay sau khi alert
                            window.location.href = '/cacmauxe.html';
                        } else {
                            alert('Lỗi: ' + result.thongbao);
                        }
                    } catch (e) {
                        console.error('Error parsing response:', e);
                        console.error('Raw response:', response);
                        alert('Có lỗi xảy ra khi xử lý phản hồi từ server');
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