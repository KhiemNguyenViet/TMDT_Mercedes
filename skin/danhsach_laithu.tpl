<!DOCTYPE html>
<html lang="vi">
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
</head>

<body>
    {header}
    <div class="mercedes-drive-list">
        <div class="mercedes-header">
            <img src="../hinhanh/logo.jpg" alt="Mercedes-Benz" class="mercedes-logo">
            <h2>Lịch lái thử Mercedes-Benz</h2>
            <p class="mercedes-slogan">The Best or Nothing</p>
        </div>
        <div class="mercedes-table-wrapper">
            <table class="mercedes-table">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Họ tên</th>
                        <th>Số điện thoại</th>
                        <th>Địa chỉ</th>
                        <th>Ngày đăng ký</th>
                        <th>Giờ lái thử</th>
                        <th>Xe đăng ký</th>
                        <th>Ghi chú</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Lặp qua danh sách lịch lái thử ở đây -->
                    {li_lichlai}
                    <!-- Kết thúc ví dụ mẫu -->
                </tbody>
            </table>
        </div>
    </div>
    <style>
        #overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(5px);
            z-index: 1000;
        }

        #popup_khuy_laithu {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            width: 350px;
            border-radius: 10px;
            display: none;
            box-shadow: 0 5px 30px rgba(0, 0, 0, 0.3);
            z-index: 1001;
        }

        #popup_khuy_laithu h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 20px;
            text-align: center;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 8px;
        }

        #popup_khuy_laithu form {
            display: flex;
            flex-direction: column;
        }

        #popup_khuy_laithu label {
            color: #555;
            font-weight: 500;
            font-size: 13px;
        }

        #popup_khuy_laithu input[type="email"],
        #popup_khuy_laithu input[type="text"],
        #popup_khuy_laithu textarea {
            width: 95%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 13px;
            transition: all 0.3s ease;
        }

        #popup_khuy_laithu input[type="email"]:focus,
        #popup_khuy_laithu input[type="text"]:focus,
        #popup_khuy_laithu textarea:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
            outline: none;
        }

        #popup_khuy_laithu textarea {
            resize: vertical;
            min-height: 80px;
        }

        #popup_khuy_laithu button[type="submit"] {
            background: #4a90e2;
            color: white;
            border: none;
            padding: 8px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 500;
            transition: background 0.3s ease;
            margin-top: 5px;
        }

        #popup_khuy_laithu button[type="submit"]:hover {
            background: #357abd;
        }

        #popup_khuy_laithu button.close {
            position: absolute;
            top: 10px;
            right: 10px;
            background: #ff4757;
            color: white;
            border: none;
            width: 25px;
            height: 25px;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            transition: background 0.3s ease;
        }

        #popup_khuy_laithu button.close:hover {
            background: #ff6b81;
        }
    </style>
    <div id="overlay"></div>
    <div id="popup_khuy_laithu">
        <button class="close" onclick="closePopup_khuy_laithu()">×</button>
        <h3>Khách hàng gửi email yêu cầu hủy lịch lái thử</h3>
        <p style="font-size: 12px; color: #e21616; font-style: italic; text-align: center;">*Gửi email để hủy lịch
            lái thử*</p>
        <form action="../admin/sendmail.php" method="POST">
            <label class="hidden">Đến email:</label><br>
            <input class="hidden" type="email" name="to_email" required value="khiemnguyenviet.2004@gmail.com"
                readonly><br><br>
            <label>Email khách hàng:</label><br>
            <input type="email" name="from_email" value="{email_khachhang}" required><br><br>

            <label>Tiêu đề:</label><br>
            <input type="text" name="subject" required value="Yêu cầu hủy lịch lái thử" readonly><br><br>

            <label>Nội dung:</label><br>
            <textarea name="message" rows="4" required placeholder="Nhập nội dung email"></textarea><br><br>

            <button type="submit" name="khachhangsend"
                onclick="kh_updateStatus(currentTestDriveId, 'processing')">Gửi</button>
        </form>
    </div>
    {footer}
    <style>
        .hidden {
            display: none;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .mercedes-drive-list {
            max-width: 1100px;
            margin: 40px auto;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.15);
            padding: 32px 32px 24px 32px;
            font-family: 'GothamRounded-Medium', 'SF-Pro-Text', Arial, sans-serif;
            border: 1px solid #e5e5e5;
        }

        .mercedes-header {
            text-align: center;
            margin-bottom: 32px;
        }

        .mercedes-logo {
            width: 80px;
            margin-bottom: 12px;
        }

        .mercedes-header h2 {
            font-size: 2.2rem;
            color: #222;
            font-weight: 700;
            letter-spacing: 2px;
            margin-bottom: 4px;
        }

        .mercedes-slogan {
            color: #888;
            font-size: 1.1rem;
            font-style: italic;
            margin-bottom: 0;
        }

        .mercedes-table-wrapper {
            overflow-x: auto;
        }

        .mercedes-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background: #f8f9fa;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.04);
        }

        .mercedes-table th,
        .mercedes-table td {
            padding: 14px 16px;
            text-align: center;
        }

        .mercedes-table th {
            background: #222;
            color: #fff;
            font-weight: 600;
            font-size: 1rem;
            border-bottom: 2px solid #b4b4b4;
        }

        .mercedes-table tr {
            transition: background 0.2s;
        }

        .mercedes-table tbody tr:hover {
            background: #e5e5e5;
        }

        .mercedes-table td {
            color: #222;
            font-size: 1rem;
            border-bottom: 1px solid #e5e5e5;
        }

        .status {
            padding: 6px 16px;
            border-radius: 16px;
            font-weight: 600;
            font-size: 0.95rem;
            display: inline-block;
        }

        .status.pending {
            background: #ffe082;
            color: #bfa100;
        }

        .status.confirmed {
            background: #c8e6c9;
            color: #256029;
        }

        .status.cancelled {
            background: #ffcdd2;
            color: #b71c1c;
        }

        @media (max-width: 700px) {
            .mercedes-drive-list {
                padding: 12px 2px;
            }

            .mercedes-header h2 {
                font-size: 1.3rem;
            }

            .mercedes-table th,
            .mercedes-table td {
                padding: 8px 6px;
                font-size: 0.95rem;
            }
        }
    </style>
</body>
<script>
    let currentTestDriveId = null;
    const popup_khuy_laithu = document.getElementById('popup_khuy_laithu');
    const overlay = document.getElementById('overlay');

    // Lặp qua tất cả các nút xác nhận
    document.querySelectorAll('.btn-khachhang-cancel').forEach(function (btn) {
        btn.addEventListener('click', function () {
            currentTestDriveId = this.dataset.id;
            console.log("Mở popup cho ID:", currentTestDriveId);
            popup_khuy_laithu.style.display = 'block';
            overlay.style.display = 'block';
        });
    });

    function closePopup_khuy_laithu() {
        popup_khuy_laithu.style.display = 'none';
        overlay.style.display = 'none';
        currentTestDriveId = null;
    }
    overlay.addEventListener('click', closePopup_khuy_laithu);
</script>

</html>