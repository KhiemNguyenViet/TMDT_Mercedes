<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xin chào Admin</title>
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../skin_adm/css/admin.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/skin_adm/js/process.js"></script>
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

        #popup {
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

        #popup h3 {
            color: #333;
            margin-bottom: 15px;
            font-size: 20px;
            text-align: center;
            border-bottom: 2px solid #f0f0f0;
            padding-bottom: 8px;
        }

        #popup form {
            display: flex;
            flex-direction: column;
        }

        #popup label {
            color: #555;
            font-weight: 500;
            font-size: 13px;
        }

        #popup input[type="email"],
        #popup input[type="text"],
        #popup textarea {
            width: 95%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 13px;
            transition: all 0.3s ease;
        }

        #popup input[type="email"]:focus,
        #popup input[type="text"]:focus,
        #popup textarea:focus {
            border-color: #4a90e2;
            box-shadow: 0 0 0 2px rgba(74, 144, 226, 0.2);
            outline: none;
        }

        #popup textarea {
            resize: vertical;
            min-height: 80px;
        }

        #popup button[type="submit"] {
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

        #popup button[type="submit"]:hover {
            background: #357abd;
        }

        #popup button.close {
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

        #popup button.close:hover {
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
            <li onclick="showTab('orders_car')">Quản lí đơn hàng </li>
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
            <div class="input-row">
                <input type="text" placeholder="Tên sản phẩm">
                <input type="number" placeholder="Giá">
                <input type="file" accept="image/*">
                <textarea placeholder="Mô tả sản phẩm"></textarea>
                <button class="button add">Thêm</button>
            </div>
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
                        <th>Mật khẩu</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    {list_users}
                </tbody>
            </table>
        </div>

        <!-- Revenue -->
        <div id="revenue" class="tab-content">
            <h2>Doanh thu theo tháng</h2>
            <div class="chart-container" style="display: flex; flex-wrap: wrap; gap: 20px;">
                <iframe id="revenue-chart" width="100%" height="400" style="max-width:600px;border:none"
                    src="https://quickchart.io/chart-maker/view/ckz7qtP0aUUFJx0Uld49"></iframe>
                <iframe width="100%" height="400" style="max-width:400px;border:none"
                    src="https://quickchart.io/chart-maker/view/ckz7qtSyaUUFJx0Uld4A"></iframe>
            </div>
            <div id="total-revenue" style="margin-top: 20px; font-size: 18px; font-weight: bold;"></div>
        </div>
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
                            <th>Số điện thoại</th>
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
            <h3>Gửi Email đến khách hàng</h3>
            <p style="font-size: 12px; color: #e21616; font-style: italic; text-align: center;">*Gửi email để hoàn thành xác nhận đơn hàng*</p>
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
        <script>
            let currentTestDriveId = null;
            const popup = document.getElementById('popup');
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

            function closePopup() {
                popup.style.display = 'none';
                overlay.style.display = 'none';
                currentTestDriveId = null;
            }

            overlay.addEventListener('click', closePopup);
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
            const validTabs = ['products', 'add-product', 'users', 'orders', 'revenue'];
            if (hash && validTabs.includes(hash)) {
                showTab(hash);
            } else {
                showTab('products'); // Mặc định hiển thị tab products
            }
        });
    </script>
</body>

</html>