<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mercedes Admin Dashboard</title>
    <link rel="stylesheet" href="../css/admin.css">
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
            <li onclick="showTab('revenue')">📊 Doanh thu theo tháng</li>
        </ul>
    </div>

    <main onclick="hideSidebar()">
        <!-- Product List -->
        <div id="products" class="tab-content active">
            <h2>Danh sách sản phẩm</h2>
            <table>
                <thead>
                    <tr>
                        <th>Ảnh</th>
                        <th>Tên</th>
                        <th>Giá</th>
                        <th>Mô tả</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><img src="../hinhanh/sanpham1.jpg" class="product-img"></td>
                        <td>Mercedes C300 AMG</td>
                        <td>2.200.000.000 đ</td>
                        <td>Sedan hạng sang, động cơ mạnh mẽ và nội thất cao cấp.</td>
                        <td><button class="button edit">Sửa</button> <button class="button delete">Xoá</button></td>
                    </tr>
                </tbody>
            </table>
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
            <div class="input-row">
                <input type="text" placeholder="ID">
                <input type="text" placeholder="Họ tên">
                <input type="tel" placeholder="Số điện thoại">
                <input type="email" placeholder="Email">
                <input type="text" placeholder="Địa chỉ">
                <input type="text" placeholder="Tên tài khoản">
                <div style="display:flex; align-items:center; flex: 1;">
                    <input type="password" placeholder="Mật khẩu" id="new-password">
                    <button class="toggle-password"
                        onclick="togglePassword('new-password', this)">&#128065;&#x20E0;</button>
                </div>
                <button class="button add">Thêm</button>
            </div>
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
                    <tr>
                        <td>1</td>
                        <td>Nguyen Van A</td>
                        <td>0901234567</td>
                        <td>a@example.com</td>
                        <td>Hà Nội</td>
                        <td>nguyenvana</td>
                        <td>
                            <div style="display:flex; align-items:center;">
                                <input type="password" value="123456" readonly id="pw1">
                                <button class="toggle-password"
                                    onclick="togglePassword('pw1', this)">&#128065;&#x20E0;</button>
                            </div>
                        </td>
                        <td><button class="button edit">Sửa</button> <button class="button delete">Xoá</button></td>
                    </tr>
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
            hideSidebar();
        }

        function togglePassword(inputId, button) {
            const input = document.getElementById(inputId);
            if (input.type === 'password') {
                input.type = 'text';
                button.innerHTML = '&#128065;';
            } else {
                input.type = 'password';
                button.innerHTML = '&#128065;&#x20E0;';
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
        });
    </script>
</body>

</html>