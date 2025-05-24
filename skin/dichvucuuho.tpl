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
    <title>Dịch vụ cứu hộ</title>
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
        <section class="rescue-section">
            <h1>Dịch Vụ Cứu Hộ</h1>
            <p>Mercedes-Benz Việt Nam cung cấp dịch vụ cứu hộ 24/7, đảm bảo hỗ trợ bạn mọi lúc, mọi nơi khi gặp sự cố trên đường. Dịch vụ của chúng tôi được thực hiện bởi đội ngũ kỹ thuật viên chuyên nghiệp, sẵn sàng xử lý mọi tình huống.</p>
    
            <div class="rescue-item">
                <h2>Khi Nào Cần Dịch Vụ Cứu Hộ?</h2>
                <ul>
                    <li>Xe gặp sự cố kỹ thuật (hỏng máy, chết động cơ, v.v.).</li>
                    <li>Lốp xe bị xẹp hoặc hư hỏng.</li>
                    <li>Hết nhiên liệu hoặc pin (đối với xe điện).</li>
                    <li>Tai nạn giao thông cần hỗ trợ khẩn cấp.</li>
                </ul>
            </div>
    
            <div class="rescue-item">
                <h2>Cách Yêu Cầu Cứu Hộ</h2>
                <ul>
                    <li><strong>Gọi hotline cứu hộ:</strong> Liên hệ 1800-XXX-XXX (miễn phí, hoạt động 24/7).</li>
                    <li><strong>Cung cấp thông tin:</strong> Báo cáo vị trí, tình trạng xe, và thông tin liên hệ của bạn.</li>
                    <li><strong>Chờ hỗ trợ:</strong> Đội cứu hộ sẽ đến trong thời gian sớm nhất, thường trong vòng 30-60 phút tại khu vực đô thị.</li>
                </ul>
            </div>
    
            <div class="rescue-item">
                <h2>Cam Kết Của Chúng Tôi</h2>
                <ul>
                    <li><strong>Phản hồi nhanh chóng:</strong> Hỗ trợ 24/7 trên toàn quốc.</li>
                    <li><strong>Kỹ thuật viên chuyên nghiệp:</strong> Được đào tạo bài bản bởi Mercedes-Benz.</li>
                    <li><strong>Phụ tùng chính hãng:</strong> Đảm bảo chất lượng sửa chữa.</li>
                </ul>
                <p><strong>Hotline cứu hộ:</strong> 1800-XXX-XXX</p>
                <p><strong>Email hỗ trợ:</strong> rescue@mercedes-benz.vn</p>
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
    
        .rescue-section {
            background-color: #f8f8f8;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    
        .rescue-section h1 {
            color: #000;
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 20px;
        }
    
        .rescue-item h2 {
            color: #000;
            font-size: 1.8em;
            margin-bottom: 10px;
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
        }
    
        .rescue-item p {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 15px;
        }
    
        .rescue-item ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-bottom: 15px;
        }
    
        .rescue-item ul li {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 10px;
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
            toastr.success('Dịch vụ cứu hộ 24/7 luôn sẵn sàng hỗ trợ bạn!', 'Mercedes-Benz Việt Nam');
        });
    </script>
    {footer}
</body>

</html>