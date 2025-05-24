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
    <title>Bảo dưỡng định kỳ</title>
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
        <section class="maintenance-section">
            <h1>Bảo Dưỡng Định Kỳ</h1>
            <p>Để đảm bảo xe Mercedes-Benz của bạn luôn hoạt động ở trạng thái tốt nhất, chúng tôi cung cấp dịch vụ bảo dưỡng định kỳ tại các trung tâm dịch vụ chính hãng trên toàn quốc.</p>
    
            <div class="maintenance-item">
                <h2>Lợi Ích Của Bảo Dưỡng Định Kỳ</h2>
                <ul>
                    <li><strong>Duy trì hiệu suất:</strong> Giữ động cơ, hệ thống phanh, và các bộ phận khác hoạt động tối ưu.</li>
                    <li><strong>Tăng tuổi thọ xe:</strong> Phát hiện và khắc phục sớm các vấn đề tiềm ẩn.</li>
                    <li><strong>Đảm bảo an toàn:</strong> Kiểm tra các tính năng an toàn như phanh, lốp, và đèn.</li>
                    <li><strong>Bảo hành chính hãng:</strong> Tuân thủ lịch bảo dưỡng để duy trì chế độ bảo hành.</li>
                </ul>
            </div>
    
            <div class="maintenance-item">
                <h2>Lịch Bảo Dưỡng</h2>
                <p>Chúng tôi khuyến nghị bảo dưỡng định kỳ sau mỗi 10,000 km hoặc 12 tháng (tùy điều kiện nào đến trước). Các hạng mục bao gồm:</p>
                <ul>
                    <li>Thay dầu động cơ và lọc dầu.</li>
                    <li>Kiểm tra hệ thống phanh, lốp, và hệ thống treo.</li>
                    <li>Kiểm tra và thay thế lọc gió, lọc nhiên liệu (nếu cần).</li>
                    <li>Cập nhật phần mềm MBUX và các hệ thống điện tử.</li>
                </ul>
            </div>
    
            <div class="maintenance-item">
                <h2>Đặt Lịch Bảo Dưỡng</h2>
                <ul>
                    <li><strong>Trực tuyến:</strong> Truy cập mục "Dịch Vụ" và điền biểu mẫu đặt lịch bảo dưỡng.</li>
                    <li><strong>Gọi điện:</strong> Liên hệ 1800-XXX-XXX để đặt lịch tại trung tâm gần nhất.</li>
                    <li><strong>Đến trực tiếp:</strong> Thăm các trung tâm dịch vụ như Mercedes-Benz Haxaco Láng Hạ.</li>
                </ul>
                <p><strong>Hotline:</strong> 1800-XXX-XXX</p>
                <p><strong>Email:</strong> service@mercedes-benz.vn</p>
            </div>
        </section>
    </div>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            font-family: Arial, sans-serif;
        }
    
        .maintenance-section {
            background-color: #f8f8f8;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    
        .maintenance-section h1 {
            color: #000;
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 20px;
        }
    
        .maintenance-item h2 {
            color: #000;
            font-size: 1.8em;
            margin-bottom: 10px;
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
        }
    
        .maintenance-item p {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 15px;
        }
    
        .maintenance-item ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-bottom: 15px;
        }
    
        .maintenance-item ul li {
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
            toastr.success('Đặt lịch bảo dưỡng định kỳ để xe luôn trong trạng thái hoàn hảo!', 'Mercedes-Benz Việt Nam');
        });
    </script>
    {footer}
</body>

</html>