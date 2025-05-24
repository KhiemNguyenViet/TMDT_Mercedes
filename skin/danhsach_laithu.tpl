<!DOCTYPE html>
<html lang="en">
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
    {footer}
    <style>
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

</html>