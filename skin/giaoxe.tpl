<!DOCTYPE html>
<html lang="vi">

<head>
    <meta name="description"
        content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords"
        content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <meta charset="UTF-8">
    <title>Giao xe trên toàn quốc</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- Thêm CSS của Toastr -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

    <!-- Thêm JS của Toastr -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
    {header}
    <div class="container">
        <section class="delivery-section">
            <h1>Giao Xe Trên Toàn Quốc</h1>
            <p>Mercedes-Benz Việt Nam cung cấp dịch vụ giao xe tận nơi trên toàn quốc, đảm bảo xe được giao đến tay bạn trong thời gian nhanh nhất với chất lượng đảm bảo.</p>
    
            <div class="delivery-item">
                <h2>Lợi Ích Của Dịch Vụ Giao Xe</h2>
                <ul>
                    <li><strong>Tiện lợi:</strong> Nhận xe tại địa chỉ của bạn, từ Hà Nội, TP.HCM đến các tỉnh thành khác.</li>
                    <li><strong>An toàn:</strong> Xe được vận chuyển bởi đội ngũ chuyên nghiệp, đảm bảo không hư hỏng.</li>
                    <li><strong>Linh hoạt:</strong> Lựa chọn thời gian và địa điểm giao xe phù hợp.</li>
                    <li><strong>Hỗ trợ giấy tờ:</strong> Hỗ trợ hoàn thiện thủ tục đăng ký, đăng kiểm trước khi giao xe.</li>
                </ul>
            </div>
    
            <div class="delivery-item">
                <h2>Quy Trình Giao Xe</h2>
                <ul>
                    <li><strong>Bước 1:</strong> Đặt mua xe qua website hoặc tại đại lý.</li>
                    <li><strong>Bước 2:</strong> Cung cấp thông tin giao xe (địa chỉ, thời gian mong muốn).</li>
                    <li><strong>Bước 3:</strong> Xác nhận đơn hàng và thanh toán (bao gồm đặt cọc 10,000,000 VNĐ).</li>
                    <li><strong>Bước 4:</strong> Nhận xe tại địa chỉ đã đăng ký, kiểm tra xe cùng nhân viên giao hàng.</li>
                </ul>
            </div>
    
            <div class="delivery-item">
                <h2>Liên Hệ Đặt Giao Xe</h2>
                <p>Liên hệ ngay để được hỗ trợ giao xe nhanh chóng và thuận tiện.</p>
                <p><strong>Hotline:</strong> 1800-XXX-XXX</p>
                <p><strong>Email:</strong> delivery@mercedes-benz.vn</p>
                <a href="/contact" class="btn">Điền Biểu Mẫu Giao Xe</a>
            </div>
        </section>
    </div>
    
    <style>
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
        }
    
        .delivery-section {
            background-color: #f8f8f8;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    
        .delivery-section h1 {
            color: #000;
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 20px;
        }
    
        .delivery-item h2 {
            color: #000;
            font-size: 1.8em;
            margin-bottom: 10px;
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
        }
    
        .delivery-item p {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 15px;
        }
    
        .delivery-item ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-bottom: 15px;
        }
    
        .delivery-item ul li {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 10px;
        }
    
        .delivery-item a {
            color: #007bff;
            text-decoration: none;
        }
    
        .delivery-item a:hover {
            text-decoration: underline;
        }
    
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #000;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
        }
    
        .btn:hover {
            background-color: #333;
        }
    </style>
    
    <script>
        $(document).ready(function () {
            toastr.options = {
                "closeButton": true,
                "progressBar": true,
                "positionClass": "toast-top-right",
                "timeOut": "5000"
            };
            toastr.success('Nhận xe Mercedes-Benz tại bất kỳ đâu trên toàn quốc!', 'Mercedes-Benz Việt Nam');
        });
    </script>
    {footer}
</body>

</html>