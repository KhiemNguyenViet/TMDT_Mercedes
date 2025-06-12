<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xin chào Admin</title>
    <meta name="description"
        content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords"
        content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../skin_adm/css/admin.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/skin_adm/js/process.js"></script>
    <script src="/assets/js/payment-image.js"></script>
    <link rel="icon" type="image/x-icon" href="{favicon}">
    <style>
        .dichvu-slider {
            display: flex;
            overflow-x: auto;
            scroll-behavior: smooth;
            gap: 1rem;
            padding-bottom: 1rem;
        }

        .dichvu-slider::-webkit-scrollbar {
            height: 8px;
        }

        .dichvu-slider:hover {
            cursor: grab;
        }

        .user-dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 90px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .dropdown-content ul li {
            text-align: center;
            padding: 7px;
        }

        .dropdown-content ul li a {
            text-decoration: none;
            color: black;
        }

        .user-dropdown:hover .dropdown-content {
            display: block;
        }

        /* Nền mờ của popup */
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

        #popup,
        #popup_xl_thanhtoan,
        #popup_ht_thanhtoan,
        #popup_huy_thanhtoan,
        #popup_huy_laithu,
        #popup_ht_laithu {
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

        #popup h3,
        #popup_xl_thanhtoan h3,
        #popup_ht_thanhtoan h3,
        #popup_huy_thanhtoan h3,
        #popup_huy_laithu h3,
        #popup_ht_laithu h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 20px;
            text-align: center;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 8px;
        }

        #popup form,
        #popup_xl_thanhtoan form,
        #popup_ht_thanhtoan form,
        #popup_huy_thanhtoan form,
        #popup_huy_laithu form,
        #popup_ht_laithu form {
            display: flex;
            flex-direction: column;
        }

        #popup label,
        #popup_xl_thanhtoan label,
        #popup_ht_thanhtoan label,
        #popup_huy_thanhtoan label,
        #popup_huy_laithu label,
        #popup_ht_laithu label {
            color: #555;
            font-weight: 500;
            font-size: 13px;
        }

        #popup input[type="email"],
        #popup input[type="text"],
        #popup textarea,
        #popup_xl_thanhtoan input[type="email"],
        #popup_xl_thanhtoan input[type="text"],
        #popup_xl_thanhtoan textarea,
        #popup_ht_thanhtoan input[type="email"],
        #popup_ht_thanhtoan input[type="text"],
        #popup_ht_thanhtoan textarea,
        #popup_huy_thanhtoan input[type="email"],
        #popup_huy_thanhtoan input[type="text"],
        #popup_huy_thanhtoan textarea,
        #popup_huy_laithu input[type="email"],
        #popup_huy_laithu input[type="text"],
        #popup_huy_laithu textarea,
        #popup_ht_laithu input[type="email"],
        #popup_ht_laithu input[type="text"],
        #popup_ht_laithu textarea {
            width: 95%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 13px;
            transition: all 0.3s ease;
        }

        #popup input[type="email"]:focus,
        #popup input[type="text"]:focus,
        #popup textarea:focus,
        #popup_xl_thanhtoan input[type="email"]:focus,
        #popup_xl_thanhtoan input[type="text"]:focus,
        #popup_xl_thanhtoan textarea:focus,
        #popup_ht_thanhtoan input[type="email"]:focus,
        #popup_ht_thanhtoan input[type="text"]:focus,
        #popup_ht_thanhtoan textarea:focus,
        #popup_huy_thanhtoan input[type="email"]:focus,
        #popup_huy_thanhtoan input[type="text"]:focus,
        #popup_huy_thanhtoan textarea:focus,
        #popup_huy_laithu input[type="email"]:focus,
        #popup_huy_laithu input[type="text"]:focus,
        #popup_huy_laithu textarea:focus,
        #popup_ht_laithu input[type="email"]:focus,
        #popup_ht_laithu input[type="text"]:focus,
        #popup_ht_laithu textarea:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
            outline: none;
        }

        #popup textarea,
        #popup_xl_thanhtoan textarea,
        #popup_ht_thanhtoan textarea,
        #popup_huy_thanhtoan textarea,
        #popup_huy_laithu textarea,
        #popup_ht_laithu textarea {
            resize: vertical;
            min-height: 80px;
        }

        #popup button[type="submit"],
        #popup_xl_thanhtoan button[type="submit"],
        #popup_ht_thanhtoan button[type="submit"],
        #popup_huy_thanhtoan button[type="submit"],
        #popup_huy_laithu button[type="submit"],
        #popup_ht_laithu button[type="submit"] {
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

        #popup button[type="submit"]:hover,
        #popup_xl_thanhtoan button[type="submit"]:hover,
        #popup_ht_thanhtoan button[type="submit"]:hover,
        #popup_huy_thanhtoan button[type="submit"]:hover,
        #popup_huy_laithu button[type="submit"]:hover,
        #popup_ht_laithu button[type="submit"]:hover {
            background: #357abd;
        }

        #popup button.close,
        #popup_xl_thanhtoan button.close,
        #popup_ht_thanhtoan button.close,
        #popup_huy_thanhtoan button.close,
        #popup_huy_laithu button.close,
        #popup_ht_laithu button.close {
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

        #popup button.close:hover,
        #popup_xl_thanhtoan button.close:hover,
        #popup_ht_thanhtoan button.close:hover,
        #popup_huy_thanhtoan button.close:hover,
        #popup_huy_laithu button.close:hover,
        #popup_ht_laithu button.close:hover {
            background: #ff6b81;
        }
    </style>
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
</head>

<body>
    <header>
        <h1 style="flex: 1; text-align: center;">Mercedes Admin Dashboard</h1>
        <button class="sidebar-toggle" style="order: -1;" onclick="toggleSidebar(event)">☰</button>
    </header>

    <div class="sidebar" id="sidebar">
        <h3>Quản lý</h3>
        <ul>
            <li onclick="showTab('products')">📦 Danh mục sản phẩm</li>
            <li onclick="showTab('add-product')">➕ Thêm sản phẩm</li>
            <li onclick="showTab('users')">👥 Quản lý tài khoản</li>
            <li onclick="showTab('orders_car')">📋 Quản lí đơn hàng</li>
            <li onclick="showTab('orders')">📅 Quản lí đặt lịch</li>
            <li onclick="showTab('revenue')">📊 Doanh thu theo tháng</li>
        </ul>
    </div>

    <main onclick="hideSidebar()">
        <!-- Product List -->
        <div id="products" class="tab-content active">
            <h2>Danh sách sản phẩm</h2>
            {list_product}
        </div>

        <!-- Add Product -->
        <div id="add-product" class="tab-content">
            <h2>Thêm sản phẩm</h2>
            {add_product}
        </div>

        <!-- User Management -->
        <div id="users" class="tab-content">
            <h2>Danh sách tài khoản người dùng</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Số điện thoại</th>
                        <th>Email</th>
                        <th>Địa chỉ</th>
                        <th>Tên tài khoản</th>
                        <!-- <th>Mật khẩu</th> -->
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    {list_users}
                </tbody>
            </table>
        </div>

        <div id="revenue" class="tab-content">
            <h2>Doanh thu theo tháng</h2>
            <div class="revenue-summary">
                <div class="revenue-card total">
                    <h3>Tổng doanh thu</h3>
                    <div class="amount" id="total-revenue">0 VNĐ</div>
                </div>
                <div class="revenue-card monthly">
                    <h3>Doanh thu tháng này</h3>
                    <div class="amount" id="current-month-revenue">0 VNĐ</div>
                </div>
            </div>

            <div class="chart-container">
                <canvas id="revenueChart" style="width: 100% !important;"></canvas>
            </div>

            <div class="revenue-table-container">
                <table class="revenue-table">
                    <thead>
                        <tr>
                            <th>Tháng</th>
                            <th>Doanh thu</th>
                            <th>So với tháng trước</th>
                        </tr>
                    </thead>
                    <tbody id="revenue-table-body">
                    </tbody>
                </table>
            </div>
        </div>

        <style>
            .revenue-summary {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .revenue-card {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            .revenue-card h3 {
                margin: 0 0 10px 0;
                color: #666;
            }

            .revenue-card .amount {
                font-size: 24px;
                font-weight: bold;
                color: #2c3e50;
            }

            .chart-container {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
            }

            .revenue-table-container {
                background: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                overflow-x: auto;
            }

            .revenue-table {
                width: 100%;
                border-collapse: collapse;
            }

            .revenue-table th,
            .revenue-table td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #eee;
            }

            .revenue-table th {
                background: #f8f9fa;
                font-weight: 500;
            }

            .text-success {
                color: #28a745;
                font-weight: 500;
            }

            .text-danger {
                color: #dc3545;
                font-weight: 500;
            }

            .revenue-card {
                background: linear-gradient(145deg, #ffffff 0%, #f8f9fa 100%);
                border: 1px solid #e9ecef;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }

            .revenue-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }

            .chart-container {
                transition: all 0.3s ease;
            }

            .chart-container:hover {
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            }
        </style>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                fetchRevenueData();
            });

            function fetchRevenueData() {
                fetch('revenue.php')
                    .then(response => response.json())
                    .then(data => {
                        updateRevenueDisplay(data);
                        createRevenueChart(data.chart_data);
                        updateRevenueTable(data.monthly_revenue);
                    })
                    .catch(error => console.error('Error fetching revenue data:', error));
            }

            function updateRevenueDisplay(data) {
                document.getElementById('total-revenue').textContent =
                    formatCurrency(data.total_revenue);

                const currentMonth = new Date().getMonth();
                document.getElementById('current-month-revenue').textContent =
                    formatCurrency(data.monthly_revenue[currentMonth + 1]);
            }

            function createRevenueChart(chartData) {
                const ctx = document.getElementById('revenueChart').getContext('2d');
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: chartData.labels,
                        datasets: [{
                            label: 'Doanh thu (VNĐ)',
                            data: chartData.values,
                            backgroundColor: 'rgba(54, 162, 235, 0.2)',
                            borderColor: 'rgba(54, 162, 235, 1)',
                            borderWidth: 1
                        }]
                    },
                    options: {
                        responsive: true,
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    callback: value => formatCurrency(value)
                                }
                            }
                        },
                        plugins: {
                            tooltip: {
                                callbacks: {
                                    label: context => formatCurrency(context.raw)
                                }
                            }
                        }
                    }
                });
            }

            function formatCurrency(value) {
                return new Intl.NumberFormat('vi-VN', {
                    style: 'currency',
                    currency: 'VND'
                }).format(value);
            }
            function updateRevenueTable(monthlyData) {
                const tableBody = document.getElementById('revenue-table-body');
                let html = '';

                for (let month = 1; month <= 12; month++) {
                    const current = monthlyData[month];
                    const previous = month > 1 ? monthlyData[month - 1] : null;
                    let changeText = '-';
                    let changeClass = '';

                    if (previous) {
                        const change = ((current - previous) / previous) * 100;
                        changeText = `${change > 0 ? '+' : ''}${change.toFixed(1)}%`;
                        changeClass = change > 0 ? 'text-success' : 'text-danger';
                    }

                    html += `
            <tr>
                <td>Tháng ${month}</td>
                <td>${formatCurrency(current)}</td>
                <td class="${changeClass}">${changeText}</td>
            </tr>
        `;
                }

                tableBody.innerHTML = html;
            }
        </script>
        <!-- orders -->
        <div id="orders" class="tab-content">
            <h2>Quản lý đặt lịch</h2>
            <div class="orders-container">
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Khách hàng</th>
                            <th>Thông tin liên hệ</th>
                            <th>Sản phẩm</th>
                            <th>Thời gian hẹn</th>
                            <th>Địa điểm</th>
                            <th>Trạng thái</th>
                            <th>Ghi chú</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        {list_orders}
                    </tbody>
                </table>
            </div>
        </div>
        <!-- orders_car -->
        <div id="orders_car" class="tab-content">
            <h2>Quản lý đơn hàng</h2>
            <div class="orders-container">
                <table class="orders-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Khách hàng</th>
                            <th>Hình ảnh chuyển khoản</th>
                            <th>Số tiền đặt cọc</th>
                            <th>Ngân hàng</th>
                            <th>Số tài khoản</th>
                            <th>Tên chủ tài khoản</th>
                            <th>Ngày đặt</th>
                            <th>Thông tin liên hệ</th>
                            <!-- <th>Email</th> -->
                            <th>Sản phẩm</th>
                            <th>Địa điểm</th>
                            <th>Trạng thái</th>
                            <th>Ghi chú</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        {list_orders_car}
                    </tbody>
                </table>
            </div>


        </div>
        <div id="overlay"></div>
        <div id="popup">
            <button class="close" onclick="closePopup()">×</button>
            <h3>Gửi Email xác nhận lịch lái thử đến khách hàng</h3>
            <p style="font-size: 12px; color: #e21616; font-style: italic; text-align: center;">*Gửi email để xác nhận
                lịch lái thử*</p>
            <form action="sendmail.php" method="POST">
                <label>Đến email:</label><br>
                <input type="email" name="to_email" required placeholder="Nhập email khách hàng"><br><br>

                <label>Tiêu đề:</label><br>
                <input type="text" name="subject" required placeholder="Nhập tiêu đề email"><br><br>

                <label>Nội dung:</label><br>
                <textarea name="message" rows="4" required placeholder="Nhập nội dung email"></textarea><br><br>

                <button type="submit" name="send" onclick="updateStatus(currentTestDriveId, 'confirmed')">Gửi</button>
            </form>
        </div>
        <div id="popup_ht_laithu">
            <button class="close" onclick="closePopup_ht_laithu()">×</button>
            <h3>Gửi Email xác nhận hoàn thành lịch lái thử đến khách hàng</h3>
            <p style="font-size: 12px; color: #e21616; font-style: italic; text-align: center;">*Gửi email để hoàn thành
                xác nhận lịch lái thử*</p>
            <form action="sendmail.php" method="POST">
                <label>Đến email:</label><br>
                <input type="email" name="to_email" required placeholder="Nhập email khách hàng"><br><br>

                <label>Tiêu đề:</label><br>
                <input type="text" name="subject" required placeholder="Nhập tiêu đề email"><br><br>

                <label>Nội dung:</label><br>
                <textarea name="message" rows="4" required placeholder="Nhập nội dung email"></textarea><br><br>

                <button type="submit" name="send" onclick="updateStatus(currentTestDriveId, 'completed')">Gửi</button>
            </form>
        </div>
        <div id="popup_huy_laithu">
            <button class="close" onclick="closePopup_huy_laithu()">×</button>
            <h3>Gửi Email xác nhận hủy lịch lái thử đến khách hàng</h3>
            <p style="font-size: 12px; color: #e21616; font-style: italic; text-align: center;">*Gửi email để hủy lịch
                lái thử*</p>
            <form action="sendmail.php" method="POST">
                <label>Đến email:</label><br>
                <input type="email" name="to_email" required placeholder="Nhập email khách hàng"><br><br>

                <label>Tiêu đề:</label><br>
                <input type="text" name="subject" required placeholder="Nhập tiêu đề email"><br><br>

                <label>Nội dung:</label><br>
                <textarea name="message" rows="4" required placeholder="Nhập nội dung email"></textarea><br><br>

                <button type="submit" name="send" onclick="updateStatus(currentTestDriveId, 'cancelled')">Gửi</button>
            </form>
        </div>
        <div id="popup_xl_thanhtoan">
            <button class="close" onclick="closePopup_xl_thanhtoan()">×</button>
            <h3>Gửi Email xác nhận xử lý đơn hàng đến khách hàng</h3>
            <p style="font-size: 12px; color: #e21616; font-style: italic; text-align: center;">*Gửi email để xác nhận
                xử lý đơn hàng*</p>
            <form action="sendmail.php" method="POST">
                <label>Đến email:</label><br>
                <input type="email" name="to_email" required placeholder="Nhập email khách hàng"><br><br>

                <label>Tiêu đề:</label><br>
                <input type="text" name="subject" required placeholder="Nhập tiêu đề email"><br><br>

                <label>Nội dung:</label><br>
                <textarea name="message" rows="4" required placeholder="Nhập nội dung email"></textarea><br><br>

                <button type="submit" name="send" onclick="status_update(currentTestDriveId, 'processing')">Gửi</button>
            </form>
        </div>
        <div id="popup_ht_thanhtoan">
            <button class="close" onclick="closePopup_ht_thanhtoan()">×</button>
            <h3>Gửi Email xác nhận hoàn thành đơn hàng đến khách hàng</h3>
            <p style="font-size: 12px; color: #e21616; font-style: italic; text-align: center;">*Gửi email để hoàn thành
                xác nhận hoàn thành đơn hàng*</p>
            <form action="sendmail.php" method="POST">
                <label>Đến email:</label><br>
                <input type="email" name="to_email" required placeholder="Nhập email khách hàng"><br><br>

                <label>Tiêu đề:</label><br>
                <input type="text" name="subject" required placeholder="Nhập tiêu đề email"><br><br>

                <label>Nội dung:</label><br>
                <textarea name="message" rows="4" required placeholder="Nhập nội dung email"></textarea><br><br>

                <button type="submit" name="send" onclick="status_update(currentTestDriveId, 'completed')">Gửi</button>
            </form>
        </div>
        <div id="popup_huy_thanhtoan">
            <button class="close" onclick="closePopup_huy_thanhtoan()">×</button>
            <h3>Gửi Email xác nhận hủy đơn hàng đến khách hàng</h3>
            <p style="font-size: 12px; color: #e21616; font-style: italic; text-align: center;">*Gửi email để hủy đơn
                hàng*</p>
            <form action="sendmail.php" method="POST">
                <label>Đến email:</label><br>
                <input type="email" name="to_email" required placeholder="Nhập email khách hàng"><br><br>

                <label>Tiêu đề:</label><br>
                <input type="text" name="subject" required placeholder="Nhập tiêu đề email"><br><br>

                <label>Nội dung:</label><br>
                <textarea name="message" rows="4" required placeholder="Nhập nội dung email"></textarea><br><br>

                <button type="submit" name="send" onclick="status_update(currentTestDriveId, 'cancelled')">Gửi</button>
            </form>
        </div>
        <script>
            let currentTestDriveId = null;
            const popup = document.getElementById('popup');
            const popup_xl_thanhtoan = document.getElementById('popup_xl_thanhtoan');
            const popup_ht_thanhtoan = document.getElementById('popup_ht_thanhtoan');
            const popup_huy_thanhtoan = document.getElementById('popup_huy_thanhtoan');
            const popup_huy_laithu = document.getElementById('popup_huy_laithu');
            const popup_ht_laithu = document.getElementById('popup_ht_laithu');
            const overlay = document.getElementById('overlay');

            // Lặp qua tất cả các nút xác nhận
            document.querySelectorAll('.btn-confirm').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    currentTestDriveId = this.dataset.id;
                    console.log("Mở popup cho ID:", currentTestDriveId);
                    popup.style.display = 'block';
                    overlay.style.display = 'block';
                });
            });
            document.querySelectorAll('.btn-processing').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    currentTestDriveId = this.dataset.id;
                    console.log("Mở popup cho ID:", currentTestDriveId);
                    popup_xl_thanhtoan.style.display = 'block';
                    overlay.style.display = 'block';
                });
            });
            document.querySelectorAll('.btn-completed').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    currentTestDriveId = this.dataset.id;
                    console.log("Mở popup cho ID:", currentTestDriveId);
                    popup_ht_thanhtoan.style.display = 'block';
                    overlay.style.display = 'block';
                });
            });
            document.querySelectorAll('.btn-cancelled').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    currentTestDriveId = this.dataset.id;
                    console.log("Mở popup cho ID:", currentTestDriveId);
                    popup_huy_thanhtoan.style.display = 'block';
                    overlay.style.display = 'block';
                });
            });
            document.querySelectorAll('.btn-cancel').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    currentTestDriveId = this.dataset.id;
                    console.log("Mở popup cho ID:", currentTestDriveId);
                    popup_huy_laithu.style.display = 'block';
                    overlay.style.display = 'block';
                });
            });
            document.querySelectorAll('.btn-complete').forEach(function (btn) {
                btn.addEventListener('click', function () {
                    currentTestDriveId = this.dataset.id;
                    console.log("Mở popup cho ID:", currentTestDriveId);
                    popup_ht_laithu.style.display = 'block';
                    overlay.style.display = 'block';
                });
            });


            function closePopup() {
                popup.style.display = 'none';
                overlay.style.display = 'none';
                currentTestDriveId = null;
            }
            function closePopup_xl_thanhtoan() {
                popup_xl_thanhtoan.style.display = 'none';
                overlay.style.display = 'none';
                currentTestDriveId = null;
            }
            function closePopup_ht_thanhtoan() {
                popup_ht_thanhtoan.style.display = 'none';
                overlay.style.display = 'none';
                currentTestDriveId = null;
            }
            function closePopup_huy_thanhtoan() {
                popup_huy_thanhtoan.style.display = 'none';
                overlay.style.display = 'none';
                currentTestDriveId = null;
            }
            function closePopup_huy_laithu() {
                popup_huy_laithu.style.display = 'none';
                overlay.style.display = 'none';
                currentTestDriveId = null;
            }
            function closePopup_ht_laithu() {
                popup_ht_laithu.style.display = 'none';
                overlay.style.display = 'none';
                currentTestDriveId = null;
            }
            overlay.addEventListener('click', closePopup);
            overlay.addEventListener('click', closePopup_xl_thanhtoan);
            overlay.addEventListener('click', closePopup_ht_thanhtoan);
            overlay.addEventListener('click', closePopup_huy_thanhtoan);
            overlay.addEventListener('click', closePopup_huy_laithu);
            overlay.addEventListener('click', closePopup_ht_laithu);
        </script>

    </main>

    <script>
        function toggleSidebar(event) {
            event.stopPropagation();
            document.getElementById('sidebar').classList.toggle('active');
        }

        function hideSidebar() {
            document.getElementById('sidebar').classList.remove('active');
        }

        function showTab(tabId) {
            document.querySelectorAll('.tab-content').forEach(tab => tab.classList.remove('active'));
            document.getElementById(tabId).classList.add('active');
            window.location.hash = tabId; // Cập nhật hash trong URL
            hideSidebar();
        }

        function togglePassword(inputId, button) {
            const input = document.getElementById(inputId);
            if (input.type === 'password') {
                input.type = 'text';
                button.innerHTML = '👁';
            } else {
                input.type = 'password';
                button.innerHTML = '👁⃠';
            }
        }

        document.addEventListener('click', function (e) {
            const sidebar = document.getElementById('sidebar');
            if (!sidebar.contains(e.target) && !e.target.closest('.sidebar-toggle')) {
                sidebar.classList.remove('active');
            }
        });

        function extractRevenueFromUrl(url) {
            try {
                const chartId = url.split('/').pop();
                const apiUrl = `https://quickchart.io/chart-maker/view/${chartId}?format=json`;

                fetch(apiUrl)
                    .then(res => res.json())
                    .then(data => {
                        const datasets = data.chart?.data?.datasets || [];
                        const total = datasets.reduce((sum, ds) => {
                            const values = Array.isArray(ds.data) ? ds.data : [];
                            return sum + values.reduce((a, b) => a + b, 0);
                        }, 0);

                        document.getElementById('total-revenue').textContent = `Tổng doanh thu: ${total.toLocaleString('vi-VN')} đ`;
                    });
            } catch (e) {
                console.error('Không thể phân tích dữ liệu doanh thu:', e);
            }
        }

        window.addEventListener('load', () => {
            const chartIframe = document.getElementById('revenue-chart');
            const chartUrl = chartIframe?.src;
            if (chartUrl) {
                extractRevenueFromUrl(chartUrl);
            }

            // Kiểm tra hash trong URL để hiển thị tab tương ứng
            const hash = window.location.hash.replace('#', '');
            const validTabs = ['products', 'add-product', 'users', 'orders', 'revenue', 'orders_car'];
            if (hash && validTabs.includes(hash)) {
                showTab(hash);
            } else {
                showTab('products'); // Mặc định hiển thị tab products
            }
        });
    </script>
</body>

</html>