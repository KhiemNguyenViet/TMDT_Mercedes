<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="description"
        content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords"
        content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách lịch lái thử</title>
    <style>
        .fade {
            display: none;
        }
        /* skin/tpl/css/lichsu_thanhtoan.css */
        .container-fluid {
            padding: 0 15px;
        }

        .table-responsive {
            margin-top: 20px;
        }

        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .table thead th {
            background-color: #1a252f;
            color: #fff;
            font-weight: 600;
            text-align: center;
            padding: 12px;
        }

        .table tbody tr {
            transition: background-color 0.2s;
        }

        .table tbody tr:hover {
            background-color: #f8f9fa;
        }

        .table img.img-thumbnail {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 4px;
        }

        .badge {
            padding: 8px 12px;
            font-size: 12px;
            font-weight: 500;
            border-radius: 12px;
        }

        .badge.bg-warning {
            background-color: #ffc107;
        }

        .badge.bg-info {
            background-color: #17a2b8;
        }

        .badge.bg-success {
            background-color: #28a745;
        }

        .badge.bg-danger {
            background-color: #dc3545;
        }

        .btn-primary {
            background-color: #ffffff;
            border-color: #ffffff;
            padding: 6px 12px;
            font-size: 14px;
            border-radius: 4px;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .btn-primary:hover {
            background-color: #91dfaa;
            border-color: #91dfaa;
        }

        .modal-content {
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .modal-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }

        .modal-title {
            font-weight: 600;
            color: #1a252f;
        }

        .modal-body img {
            max-width: 100%;
            max-height: 300px;
            object-fit: contain;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        .modal-body h6 {
            font-weight: 600;
            color: #1a252f;
            margin-bottom: 10px;
        }

        .modal-body p {
            margin-bottom: 8px;
            color: #333;
        }

        .no-data {
            padding: 40px 0;
            text-align: center;
        }

        .no-data img {
            width: 150px;
            opacity: 0.5;
            margin-bottom: 20px;
        }

        .no-data h4 {
            font-weight: 600;
            color: #1a252f;
        }

        .no-data p {
            color: #6c757d;
            margin-bottom: 20px;
        }

        #scrollToTop {
            background-color: #00548e;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            transition: opacity 0.3s;
        }

        #scrollToTop:hover {
            background-color: #003d69;
        }

        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.9);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .table-mobile td {
            font-size: 14px;
            padding: 10px;
        }

        /* Popup styles */
        .popup {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 1000;
            align-items: center;
            justify-content: center;
        }

        .popup-content {
            background: #fff;
            width: 90%;
            max-width: 800px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.3s ease-in-out;
        }

        .popup-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }

        .popup-title {
            font-weight: 600;
            color: #1a252f;
            margin: 0;
        }

        .popup-close {
            background: none;
            border: none;
            font-size: 24px;
            cursor: pointer;
            color: #1a252f;
        }

        .popup-close:hover {
            color: #00548e;
        }

        .popup-body {
            padding: 20px;
            max-height: 60vh;
            overflow-y: auto;
        }

        .popup-footer {
            padding: 10px 20px;
            border-top: 1px solid #dee2e6;
            text-align: right;
        }

        .popup-body img {
            max-width: 100%;
            max-height: 300px;
            object-fit: contain;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        .popup-body h6 {
            font-weight: 600;
            color: #1a252f;
            margin-bottom: 10px;
        }

        .popup-body p {
            margin-bottom: 8px;
            color: #333;
        }

        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }

            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .table-responsive {
                overflow-x: auto;
            }

            .table th,
            .table td {
                font-size: 14px;
                padding: 8px;
            }

            .table img.img-thumbnail {
                width: 40px;
                height: 40px;
            }

            .btn-primary {
                font-size: 12px;
                padding: 5px 10px;
            }

            .popup-content {
                width: 95%;
                max-height: 80vh;
            }

            .popup-body {
                max-height: 50vh;
            }
        }
    </style>
</head>

<body>
    <!-- Breadcrumb -->
    {header}

    <!-- Main Content -->
    <div class="container my-5">
        <h2 class="mb-4" style="text-align: center;">Lịch sử thanh toán</h2>
        <a href="\cacmauxe.html" class="btn btn-primary">Khám phá thêm xe ngay</a>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Mã đơn hàng</th>
                        <th>Sản phẩm</th>
                        <th>Tổng tiền</th>
                        <th>Số tiền đặt cọc</th>
                        <th>Thông tin ngân hàng</th>
                        <th>Trạng thái</th>
                        <th>Ngày tạo</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- BEGIN: orders -->
                    {list_lichsu_thanhtoan}
                    <!-- Popup Chi tiết đơn hàng -->
                    <div class="popup" id="orderDetail{orders.id}">
                        <div class="popup-content">
                            <div class="popup-header">
                                <h5 class="popup-title">Chi tiết đơn hàng #{orders.id}</h5>
                                <button type="button" class="popup-close" onclick="closePopup('orderDetail{orders.id}')">×</button>
                            </div>
                            <div class="popup-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h6 class="mb-3">Thông tin khách hàng</h6>
                                        <p><strong>Họ tên:</strong> {orders.salutation} {orders.full_name}</p>
                                        <p><strong>Số điện thoại:</strong> {orders.phone_number}</p>
                                        <p><strong>Email:</strong> {orders.email}</p>
                                        <p><strong>Địa chỉ:</strong> {orders.contact_address}</p>
                                    </div>
                                    <div class="col-md-6">
                                        <h6 class="mb-3">Thông tin đại lý</h6>
                                        <p><strong>Đại lý:</strong> {orders.dealer}</p>
                                        <p><strong>Nhân viên bán hàng:</strong> {orders.sales_person}</p>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6 class="mb-3">Hình ảnh thanh toán</h6>
                                        <img src="Uploads/{orders.image_thanhtoan}" class="img-fluid rounded" alt="Hình ảnh thanh toán">
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6 class="mb-3">Ghi chú thanh toán</h6>
                                        <p>{orders.payment_notes}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="popup-footer">
                                <button type="button" class="btn btn-secondary" onclick="closePopup('orderDetail{orders.id}')">Đóng</button>
                            </div>
                        </div>
                    </div>
                    <!-- END: orders -->
                </tbody>
            </table>
        </div>
    </div>
    {footer}
</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    // Hàm mở popup
    function openPopup(popupId) {
        document.getElementById(popupId).style.display = 'flex';
    }

    // Hàm đóng popup
    function closePopup(popupId) {
        document.getElementById(popupId).style.display = 'none';
    }
</script>
</html>