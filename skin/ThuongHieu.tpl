<!DOCTYPE html>
<html lang="vi">

<head>
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thông Tin Dòng Xe Mercedes-Benz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        header {
            background-color: #111;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            padding: 30px;
        }

        .brand-description {
            margin-bottom: 40px;
            font-size: 1.1rem;
        }

        .model {
            display: flex;
            flex-wrap: wrap;
            background-color: white;
            margin-bottom: 30px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        .model img {
            width: 300px;
            max-width: 100%;
            border-radius: 10px;
            margin-right: 20px;
        }

        .model-info {
            flex: 1;
        }

        .model-info h2 {
            margin-top: 0;
            color: #1a1a1a;
        }

        footer {
            background-color: #111;
            color: white;
            text-align: center;
            padding: 15px;
        }

        .model {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .model:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }


        @media (max-width: 768px) {
            .model {
                flex-direction: column;
                text-align: center;
            }

            .model img {
                margin-bottom: 20px;
            }

            .model-info {
                text-align: left;
            }
        }
    </style>
</head>

<body>
    {header}
    <header>
        <h1>Mercedes-Benz & Các Dòng Xe</h1>
    </header>

    <div class="container">
        <div class="brand-description">
            <p><strong>Mercedes-Benz</strong> là thương hiệu xe sang nổi tiếng đến từ Đức, được biết đến với sự kết hợp
                hoàn hảo giữa công nghệ, thiết kế và hiệu suất vận hành.</p>
        </div>

        <!-- A-Class -->
        <div class="model">
            <img src="../hinhanh/aclass.jpg" alt="A-Class">
            <div class="model-info">
                <h2>A-Class</h2>
                <p>Thiết kế trẻ trung, nhỏ gọn, tích hợp công nghệ MBUX – hoàn hảo cho đô thị hiện đại.</p>
            </div>
        </div>

        <!-- C-Class -->
        <div class="model">
            <img src="../hinhanh/cclass.jpg" alt="C-Class">
            <div class="model-info">
                <h2>C-Class</h2>
                <p>Phong cách thể thao, nội thất hiện đại – sự lựa chọn hàng đầu trong phân khúc sedan hạng sang cỡ nhỏ.
                </p>
            </div>
        </div>

        <!-- E-Class -->
        <div class="model">
            <img src="../hinhanh/eclass.jpg" alt="E-Class">
            <div class="model-info">
                <h2>E-Class</h2>
                <p>Thiết kế sang trọng, khả năng vận hành ổn định, công nghệ an toàn hàng đầu.</p>
            </div>
        </div>

        <!-- S-Class -->
        <div class="model">
            <img src="../hinhanh/sclass.jpg" alt="S-Class">
            <div class="model-info">
                <h2>S-Class</h2>
                <p>Biểu tượng của đẳng cấp – xe dành cho giới doanh nhân, giới thượng lưu với tiện nghi tối thượng.</p>
            </div>
        </div>

        <!-- AMG -->
        <div class="model">
            <img src="../hinhanh/amgclass.jpg" alt="AMG">
            <div class="model-info">
                <h2>AMG</h2>
                <p>Dòng hiệu suất cao của Mercedes – động cơ mạnh mẽ, thiết kế thể thao, âm thanh động cơ đặc trưng.</p>
            </div>
        </div>

        <!-- V-Class -->
        <div class="model">
            <img src="../hinhanh/vclass.png" alt="V-Class">
            <div class="model-info">
                <h2>V-Class</h2>
                <p>MPV hạng sang rộng rãi, phù hợp cho gia đình hoặc doanh nghiệp cần chuyên chở cao cấp.</p>
            </div>
        </div>

        <!-- GLA -->
        <div class="model">
            <img src="../hinhanh/glaclass.jpg" alt="GLA">
            <div class="model-info">
                <h2>GLA</h2>
                <p>Chiếc SUV nhỏ gọn của Mercedes – thời trang, năng động và linh hoạt.</p>
            </div>
        </div>

        <!-- GLB -->
        <div class="model">
            <img src="../hinhanh/glbclass.jpg" alt="GLB">
            <div class="model-info">
                <h2>GLB</h2>
                <p>Thiết kế vuông vức mạnh mẽ, nội thất 7 chỗ – SUV linh hoạt cho mọi hành trình.</p>
            </div>
        </div>

        <!-- GLC -->
        <div class="model">
            <img src="../hinhanh/glcclass.jpg" alt="GLC-Class">
            <div class="model-info">
                <h2>GLC</h2>
                <p>GLC là mẫu SUV bán chạy nhất của Mercedes, cung cấp không gian rộng rãi, khả năng vận hành ổn định và
                    các tính năng an toàn tiên tiến.</p>
            </div>
        </div>

        <!-- GLE -->
        <div class="model">
            <img src="../hinhanh/gleclass.jpg" alt="GLE">
            <div class="model-info">
                <h2>GLE</h2>
                <p>SUV hạng sang tầm trung, trang bị mạnh mẽ, nội thất rộng rãi và hiện đại.</p>
            </div>
        </div>

        <!-- GLS -->
        <div class="model">
            <img src="../hinhanh/glsclass.jpg" alt="GLS">
            <div class="model-info">
                <h2>GLS</h2>
                <p>“S-Class của SUV” – kích thước lớn, tiện nghi cao cấp, phù hợp cho gia đình thượng lưu.</p>
            </div>
        </div>

        <!-- Maybach -->
        <div class="model">
            <img src="../hinhanh/maybachclass.jpg" alt="Maybach">
            <div class="model-info">
                <h2>Maybach</h2>
                <p>Thương hiệu siêu sang trực thuộc Mercedes-Benz – nội thất đỉnh cao, phục vụ hành khách tối ưu.</p>
            </div>
        </div>

        <!-- GT -->
        <div class="model">
            <img src="../hinhanh/gtclass.jpg" alt="GT">
            <div class="model-info">
                <h2>GT</h2>
                <p>Xe thể thao hiệu suất cao, thiết kế khí động học, mang lại trải nghiệm lái đầy cảm xúc.</p>
            </div>
        </div>

        <!-- Mercedes-EQ -->
        <div class="model">
            <img src="../hinhanh/eqclass.jpg" alt="EQ">
            <div class="model-info">
                <h2>Mercedes-EQ</h2>
                <p>Dòng xe điện cao cấp – EQS, EQE, EQB... với thiết kế hiện đại và công nghệ xanh tiên tiến.</p>
            </div>
        </div>

        <!-- Mercedes-Benz tổng quát -->
        <div class="model">
            <img src="../hinhanh/benzclass.jpg" alt="Mercedes-Benz">
            <div class="model-info">
                <h2>Mercedes-Benz</h2>
                <p>Mercedes-Benz – biểu tượng toàn cầu của sự sang trọng, sáng tạo và chất lượng vượt trội.</p>
            </div>
        </div>
    </div>
    <footer>
        <p>&copy; 2023 Mercedes-Benz. Bản quyền thuộc về Mercedes-Benz Việt Nam.</p>
</body>

</html>