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
    <title>Tư vấn miễn phí</title>
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
        <section class="consultation-section">
            <h1>Tư Vấn Miễn Phí</h1>
            <p>Chúng tôi cung cấp dịch vụ tư vấn miễn phí để giúp bạn lựa chọn mẫu xe Mercedes-Benz phù hợp nhất với nhu cầu và phong cách của bạn. Đội ngũ chuyên gia của chúng tôi sẵn sàng hỗ trợ bạn qua nhiều kênh liên lạc.</p>
    
            <div class="consultation-item">
                <h2>Lợi Ích Khi Sử Dụng Dịch Vụ Tư Vấn</h2>
                <ul>
                    <li><strong>Tư vấn cá nhân hóa:</strong> Được hỗ trợ bởi các chuyên viên giàu kinh nghiệm, giúp bạn hiểu rõ từng dòng xe.</li>
                    <li><strong>So sánh mẫu xe:</strong> So sánh các dòng xe như Sedan, SUV, Coupe hoặc xe điện EQ Series.</li>
                    <li><strong>Thông tin chi tiết:</strong> Cung cấp thông số kỹ thuật, giá cả, và các chương trình khuyến mãi hiện hành.</li>
                    <li><strong>Hỗ trợ tài chính:</strong> Tư vấn các gói vay, trả góp phù hợp với ngân sách của bạn.</li>
                </ul>
            </div>
    
            <div class="consultation-item">
                <h2>Cách Nhận Tư Vấn</h2>
                <ul>
                    <li><strong>Trực tuyến:</strong> Điền biểu mẫu tư vấn tại mục <a href="/contact">Liên Hệ</a> hoặc nhấn nút "Tư Vấn Ngay" trên trang sản phẩm.</li>
                    <li><strong>Gọi điện:</strong> Liên hệ qua hotline 1800-XXX-XXX để được hỗ trợ ngay.</li>
                    <li><strong>Đến đại lý:</strong> Thăm các đại lý chính hãng như Mercedes-Benz Haxaco Láng Hạ để gặp trực tiếp chuyên viên.</li>
                </ul>
            </div>
    
            <div class="consultation-item">
                <h2>Liên Hệ Ngay</h2>
                <p>Đừng ngần ngại liên hệ với chúng tôi để được tư vấn miễn phí! Chúng tôi cam kết mang lại trải nghiệm tốt nhất cho bạn.</p>
                <p><strong>Hotline:</strong> 1800-XXX-XXX (Miễn phí)</p>
                <p><strong>Email:</strong> support@mercedes-benz.vn</p>
                <a href="/contact" class="btn">Điền Biểu Mẫu Tư Vấn</a>
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
    
        .consultation-section {
            background-color: #f8f8f8;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    
        .consultation-section h1 {
            color: #000;
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 20px;
        }
    
        .consultation-item h2 {
            color: #000;
            font-size: 1.8em;
            margin-bottom: 10px;
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
        }
    
        .consultation-item p {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 15px;
        }
    
        .consultation-item ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-bottom: 15px;
        }
    
        .consultation-item ul li {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 10px;
        }
    
        .consultation-item a {
            color: #007bff;
            text-decoration: none;
        }
    
        .consultation-item a:hover {
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
            toastr.success('Nhận tư vấn miễn phí từ đội ngũ chuyên gia của chúng tôi!', 'Mercedes-Benz Việt Nam');
        });
    </script>
    {footer}
</body>

</html>