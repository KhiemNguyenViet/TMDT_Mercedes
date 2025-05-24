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
    <title>Đổi trả xe</title>
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
        <section class="return-section">
            <h1>Chính Sách Đổi Trả Xe</h1>
            <p>Mercedes-Benz Việt Nam cam kết mang đến sự hài lòng tối đa cho khách hàng. Chính sách đổi trả xe của chúng tôi được thiết kế để đảm bảo quyền lợi của bạn trong các trường hợp cần thiết.</p>
    
            <div class="return-item">
                <h2>Điều Kiện Đổi Trả</h2>
                <ul>
                    <li>Xe phải được mua từ đại lý chính hãng Mercedes-Benz Việt Nam.</li>
                    <li>Thời gian đổi trả: Trong vòng 7 ngày kể từ ngày nhận xe.</li>
                    <li>Xe chưa qua sử dụng nhiều (dưới 100 km) và không có hư hỏng do người dùng.</li>
                    <li>Các lỗi kỹ thuật hoặc sản xuất được xác nhận bởi trung tâm dịch vụ chính hãng.</li>
                </ul>
            </div>
    
            <div class="return-item">
                <h2>Quy Trình Đổi Trả</h2>
                <ul>
                    <li><strong>Bước 1:</strong> Liên hệ hotline 1800-XXX-XXX hoặc điền biểu mẫu đổi trả tại mục <a href="/contact">Liên Hệ</a>.</li>
                    <li><strong>Bước 2:</strong> Mang xe đến trung tâm dịch vụ chính hãng để kiểm tra.</li>
                    <li><strong>Bước 3:</strong> Cung cấp hóa đơn mua hàng và các giấy tờ liên quan.</li>
                    <li><strong>Bước 4:</strong> Chờ xác nhận từ đội ngũ kỹ thuật (thường trong 3-5 ngày làm việc).</li>
                    <li><strong>Bước 5:</strong> Nhận xe thay thế hoặc hoàn tiền theo chính sách.</li>
                </ul>
            </div>
    
            <div class="return-item">
                <h2>Lưu Ý</h2>
                <ul>
                    <li>Chính sách đổi trả không áp dụng cho các trường hợp hư hỏng do sử dụng sai mục đích.</li>
                    <li>Chi phí vận chuyển (nếu có) sẽ được thỏa thuận giữa khách hàng và đại lý.</li>
                    <li>Liên hệ ngay để được hỗ trợ chi tiết.</li>
                </ul>
                <p><strong>Hotline:</strong> 1800-XXX-XXX</p>
                <p><strong>Email:</strong> return@mercedes-benz.vn</p>
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
    
        .return-section {
            background-color: #f8f8f8;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
    
        .return-section h1 {
            color: #000;
            font-size: 2.5em;
            text-align: center;
            margin-bottom: 20px;
        }
    
        .return-item h2 {
            color: #000;
            font-size: 1.8em;
            margin-bottom: 10px;
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
        }
    
        .return-item p {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 15px;
        }
    
        .return-item ul {
            list-style-type: disc;
            margin-left: 20px;
            margin-bottom: 15px;
        }
    
        .return-item ul li {
            font-size: 1.1em;
            color: #333;
            line-height: 1.6;
            margin-bottom: 10px;
        }
    
        .return-item a {
            color: #007bff;
            text-decoration: none;
        }
    
        .return-item a:hover {
            text-decoration: underline;
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
            toastr.success('Tìm hiểu chính sách đổi trả xe của chúng tôi!', 'Mercedes-Benz Việt Nam');
        });
    </script>
    {footer}
</body>

</html>