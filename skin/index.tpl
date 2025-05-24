<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="description" content="Mercedes-Benz Việt Nam - Chi tiết sản phẩm">
    <meta name="keywords" content="Mercedes-Benz, xe Mercedes-Benz, thông số kỹ thuật">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mercedes - Chi tiết sản phẩm</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            color: #333;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Product Images Section */
        .product-images {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
        }

        .main-image-container {
            position: relative;
            margin-bottom: 20px;
        }

        .main-image {
            width: 100%;
            height: 500px;
            object-fit: cover;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .nav-arrows {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0, 0, 0, 0.6);
            color: white;
            border: none;
            width: 50px;
            height: 50px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .nav-arrows:hover {
            background: rgba(0, 0, 0, 0.8);
            transform: translateY(-50%) scale(1.1);
        }

        .prev-arrow {
            left: 20px;
        }

        .next-arrow {
            right: 20px;
        }

        .thumbnail-container {
            display: flex;
            gap: 15px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .thumbnail {
            width: 120px;
            height: 80px;
            object-fit: cover;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
            border: 3px solid transparent;
        }

        .thumbnail:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .thumbnail.active {
            border-color: #0066cc;
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(0, 102, 204, 0.3);
        }

        /* Product Info Section */
        .product-info {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
        }

        .product-title {
            font-size: 2.5rem;
            font-weight: bold;
            color: #1a1a1a;
            margin-bottom: 15px;
            text-align: center;
        }

        .product-price {
            font-size: 2rem;
            color: #0066cc;
            font-weight: bold;
            text-align: center;
            margin-bottom: 20px;
        }

        .product-description {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #555;
            text-align: justify;
            margin-bottom: 30px;
        }

        /* Technical Specifications Table */
        .specs-section {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 2rem;
            color: #1a1a1a;
            margin-bottom: 25px;
            text-align: center;
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, #0066cc, #004499);
            border-radius: 2px;
        }

        .specs-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .specs-table th {
            background: linear-gradient(135deg, #0066cc, #004499);
            color: white;
            padding: 15px 20px;
            text-align: left;
            font-weight: 600;
            font-size: 1.1rem;
        }

        .specs-table td {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            transition: background-color 0.2s ease;
        }

        .specs-table tr:hover td {
            background-color: #f8f9ff;
        }

        .specs-table tr:last-child td {
            border-bottom: none;
        }

        .spec-category {
            font-weight: 600;
            color: #333;
            min-width: 200px;
        }

        .spec-value {
            color: #555;
            font-weight: 500;
        }

        /* Performance Section */
        .performance-section {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 30px;
        }

        .performance-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .performance-card {
            background: linear-gradient(135deg, #f8f9ff, #ffffff);
            border: 1px solid #e0e6ff;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .performance-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 102, 204, 0.15);
        }

        .performance-icon {
            font-size: 2.5rem;
            color: #0066cc;
            margin-bottom: 15px;
        }

        .performance-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 10px;
        }

        .performance-value {
            font-size: 1.5rem;
            font-weight: bold;
            color: #0066cc;
        }

        /* Test Drive Section */
        .testdrive-section {
            background: linear-gradient(135deg, #0066cc, #004499);
            border-radius: 12px;
            padding: 40px;
            text-align: center;
            color: white;
            margin-bottom: 30px;
        }

        .testdrive-form {
            max-width: 600px;
            margin: 0 auto;
        }

        .form-title {
            font-size: 2rem;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .form-row {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-input,
        .form-select {
            padding: 15px 20px;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-input:focus,
        .form-select:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.3);
        }

        .submit-button {
            background: white;
            color: #0066cc;
            padding: 15px 40px;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 20px;
        }

        .submit-button:hover {
            background: #f0f0f0;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }

            .product-title {
                font-size: 2rem;
            }

            .product-price {
                font-size: 1.5rem;
            }

            .main-image {
                height: 300px;
            }

            .thumbnail {
                width: 80px;
                height: 60px;
            }

            .nav-arrows {
                width: 40px;
                height: 40px;
                font-size: 14px;
            }

            .specs-table th,
            .specs-table td {
                padding: 10px 15px;
                font-size: 0.9rem;
            }

            .performance-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>
    {header}

    <div class="container">
        <!-- Product Images -->
        <div class="product-images">
            <div class="main-image-container">
                <img id="mainImage" src="../hinhanh/sanpham1.jpg" alt="Mercedes-Benz" class="main-image">
                <button class="nav-arrows prev-arrow" onclick="changeImage(-1)">‹</button>
                <button class="nav-arrows next-arrow" onclick="changeImage(1)">›</button>
            </div>

            <div class="thumbnail-container">
                <img src="../hinhanh/sanpham1.jpg" alt="View 1" class="thumbnail active" onclick="setMainImage(0)">
                <img src="../hinhanh/sanpham2.jpg" alt="View 2" class="thumbnail" onclick="setMainImage(1)">
                <img src="../hinhanh/sanpham3.jpg" alt="View 3" class="thumbnail" onclick="setMainImage(2)">
                <img src="../hinhanh/sanpham4.jpg" alt="View 4" class="thumbnail" onclick="setMainImage(3)">
                <img src="../hinhanh/sanpham5.jpg" alt="View 5" class="thumbnail" onclick="setMainImage(4)">
            </div>
        </div>

        <!-- Product Information -->
        <div class="product-info">
            <h1 class="product-title">{ten_sanpham}</h1>
            <div class="product-price">{gia_sanpham}</div>
            <p class="product-description">{mota_sanpham}</p>
        </div>

        <!-- Technical Specifications -->
        <div class="specs-section">
            <h2 class="section-title">Thông Số Kỹ Thuật</h2>
            <table class="specs-table">
                <thead>
                    <tr>
                        <th>Thông số</th>
                        <th>Chi tiết</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="spec-category">Động cơ</td>
                        <td class="spec-value">{dong_co}</td>
                    </tr>
                    <tr>
                        <td class="spec-category">Công suất</td>
                        <td class="spec-value">{cong_suat}</td>
                    </tr>
                    <tr>
                        <td class="spec-category">Mô-men xoắn</td>
                        <td class="spec-value">{mo_men_xoan}</td>
                    </tr>
                    <tr>
                        <td class="spec-category">Hộp số</td>
                        <td class="spec-value">{hop_so}</td>
                    </tr>
                    <tr>
                        <td class="spec-category">Dẫn động</td>
                        <td class="spec-value">{dan_dong}</td>
                    </tr>
                    <tr>
                        <td class="spec-category">Kích thước (DxRxC)</td>
                        <td class="spec-value">{kich_thuoc}</td>
                    </tr>
                    <tr>
                        <td class="spec-category">Chiều dài cơ sở</td>
                        <td class="spec-value">{chieu_dai_co_so}</td>
                    </tr>
                    <tr>
                        <td class="spec-category">Khoảng sáng gầm xe</td>
                        <td class="spec-value">{khoang_sang_gam}</td>
                    </tr>
                    <tr>
                        <td class="spec-category">Dung tích bình nhiên liệu</td>
                        <td class="spec-value">{dung_tich_binh_nhien_lieu}</td>
                    </tr>
                    <tr>
                        <td class="spec-category">Mức tiêu thụ nhiên liệu</td>
                        <td class="spec-value">{tieu_thu_nhien_lieu}</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Performance -->
        <div class="performance-section">
            <h2 class="section-title">Khả Năng Vận Hành</h2>
            <div class="performance-grid">
                <div class="performance-card">
                    <div class="performance-icon">🚀</div>
                    <div class="performance-title">Tăng tốc 0-100km/h</div>
                    <div class="performance-value">{tang_toc}</div>
                </div>
                <div class="performance-card">
                    <div class="performance-icon">⚡</div>
                    <div class="performance-title">Tốc độ tối đa</div>
                    <div class="performance-value">{toc_do_toi_da}</div>
                </div>
                <div class="performance-card">
                    <div class="performance-icon">⛽</div>
                    <div class="performance-title">Tiêu thụ nhiên liệu</div>
                    <div class="performance-value">{tieu_thu_nhien_lieu}</div>
                </div>
                <div class="performance-card">
                    <div class="performance-icon">🔧</div>
                    <div class="performance-title">Công suất tối đa</div>
                    <div class="performance-value">{cong_suat}</div>
                </div>
            </div>
        </div>

        <!-- Test Drive Registration -->
        <div class="testdrive-section">
            <form class="testdrive-form" onsubmit="handleSubmit(event)">
                <h2 class="form-title">Đăng ký lái thử</h2>
                <div class="form-row">
                    <input type="text" name="name" placeholder="Họ và tên" class="form-input" required />
                    <input type="tel" name="phone" placeholder="Số điện thoại" class="form-input" required />
                </div>
                <div class="form-row">
                    <input type="email" name="email" placeholder="Email" class="form-input" required />
                    <select name="carModel" class="form-select" required>
                        <option value="">Dòng xe cần tư vấn</option>
                        {car_models}
                    </select>
                </div>
                <button type="submit" class="submit-button">Gửi thông tin</button>
            </form>
        </div>
    </div>

    {footer}

    <script>
        // Image gallery functionality
        const images = [
            '../hinhanh/sanpham1.jpg',
            '../hinhanh/sanpham2.jpg',
            '../hinhanh/sanpham3.jpg',
            '../hinhanh/sanpham4.jpg',
            '../hinhanh/sanpham5.jpg'
        ];

        let currentImageIndex = 0;
        const mainImage = document.getElementById('mainImage');
        const thumbnails = document.querySelectorAll('.thumbnail');

        function updateActiveThumb() {
            thumbnails.forEach((thumb, index) => {
                if (index === currentImageIndex) {
                    thumb.classList.add('active');
                } else {
                    thumb.classList.remove('active');
                }
            });
        }

        function setMainImage(index) {
            currentImageIndex = index;
            mainImage.src = images[index];
            updateActiveThumb();
        }

        function changeImage(direction) {
            currentImageIndex += direction;

            if (currentImageIndex >= images.length) {
                currentImageIndex = 0;
            } else if (currentImageIndex < 0) {
                currentImageIndex = images.length - 1;
            }

            mainImage.src = images[currentImageIndex];
            updateActiveThumb();
        }

        // Form submission
        function handleSubmit(event) {
            event.preventDefault();
            const formData = new FormData(event.target);
            const data = Object.fromEntries(formData);

            alert(`Cảm ơn ${data.name}! Thông tin lái thử của bạn đã được gửi thành công. Chúng tôi sẽ liên hệ trong thời gian sớm nhất.`);
            event.target.reset();
        }

        // Keyboard navigation for images
        document.addEventListener('keydown', function (event) {
            if (event.key === 'ArrowLeft') {
                changeImage(-1);
            } else if (event.key === 'ArrowRight') {
                changeImage(1);
            }
        });
    </script>
</body>

</html>