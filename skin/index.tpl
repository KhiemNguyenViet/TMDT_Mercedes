<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Mercedes</title>
    <!-- Link tới CSS -->
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Banner.css">
    <link rel="stylesheet" href="../skin/tpl/css/Timhieuthem.css">
    <link rel="stylesheet" href="../skin/tpl/css/DichVu.css">
    <link rel="stylesheet" href="../skin/tpl/css/SanPhamBanChay.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>

<body>
    {header}
    <!-- Banner -->
    <div class="banner-container">
        <img id="banner-img" src="../hinhanh/banner1.jpg" alt="Slideshow" class="banner" />
    </div>

    <script>
        const bannerImages = [
            '../hinhanh/banner1.jpg',
            '../hinhanh/banner2.jpg',
            '../hinhanh/banner3.jpg',
            '../hinhanh/banner4.png',
            '../hinhanh/glbclass.jpg',
        ];
        let bannerIndex = 0;
        const bannerImg = document.getElementById('banner-img');

        function fadeOut(element, callback) {
            element.style.transition = 'opacity 1s';
            element.style.opacity = 0;
            setTimeout(callback, 500); // Wait for the fade-out transition to complete
        }

        function fadeIn(element) {
            element.style.transition = 'opacity 1s';
            element.style.opacity = 1;
        }

        setInterval(() => {
            fadeOut(bannerImg, () => {
                bannerIndex = (bannerIndex + 1) % bannerImages.length;
                bannerImg.src = bannerImages[bannerIndex];
                fadeIn(bannerImg);
            });
        }, 5000);
    </script>

    <!-- Tìm Hiểu Thêm -->
    <div class="allcard">
        <h1 class="text1">Tìm Hiểu Thêm</h1>
        <div class="card-container">
            <div class="card">
                <img src="../hinhanh/sanpham12.png" alt="Mercedes" class="card-img" />
                <div class="card-content">
                    <p>
                        Chỉ vài bước để chạm đến chiếc Mercedes-Benz của bạn.<br />
                        <strong>Mercedes-AMG GLE 53 4MATIC+ Coupé</strong> của riêng bạn đang chờ
                    </p>
                    <button class="btn-view">View</button>
                </div>
            </div>

            <div class="card-small">
                <img src="../hinhanh/chuy2.jpg" alt="Mercedes" class="card1-img" />
                <div class="card-content">
                    <p>
                        Tổng hợp thông tin khuyến mại từ Mercedes-Benz Việt Nam cùng hệ thống Nhà phân phối.<br />
                        <strong>Thông tin khuyến mại mới nhất từ Mercedes-Benz</strong>
                    </p>
                    <button class="btn-view">View</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Dịch Vụ -->
    <div class="dichvu-container" id="dichvu-section">
        <h1 class="dichvu-title">Dịch vụ</h1>
        <div class="dichvu-slider" id="dichvuSlider">
            <div class="dichvu-card">
                <img src="../hinhanh/cclass.jpg" alt="Mercedes GLC" class="dichvu-image" />
                <div class="dichvu-card-content">
                    <h4 class="dichvu-card-title">Hướng dẫn sử dụng cho chủ xe</h4>
                    <p class="dichvu-card-text">Bảng thông tin tính năng và cẩm nang sử dụng cho chủ xe.</p>
                    <button class="dichvu-button">Tìm hiểu thêm</button>
                </div>
            </div>
            <div class="dichvu-card">
                <img src="../hinhanh/baoduongdinhki.jpg" alt="Bảo dưỡng định kỳ" class="dichvu-image" />
                <div class="dichvu-card-content">
                    <h4 class="dichvu-card-title">Bảo dưỡng định kỳ</h4>
                    <p class="dichvu-card-text">Lịch trình và chi phí bảo dưỡng chính hãng Mercedes-Benz.</p>
                    <button class="dichvu-button">Tìm hiểu thêm</button>
                </div>
            </div>
            <div class="dichvu-card">
                <img src="../hinhanh/dichvucuuho.jpg" alt="Dịch vụ cứu hộ" class="dichvu-image" />
                <div class="dichvu-card-content">
                    <h4 class="dichvu-card-title">Dịch vụ cứu hộ</h4>
                    <p class="dichvu-card-text">Hỗ trợ 24/7 khi xe gặp sự cố trên đường.</p>
                    <button class="dichvu-button">Tìm hiểu thêm</button>
                </div>
            </div>
            <div class="dichvu-card">
                <img src="../hinhanh/tuvanmienphi.jpg" alt="Tư vấn miễn phí" class="dichvu-image" />
                <div class="dichvu-card-content">
                    <h4 class="dichvu-card-title">Tư vấn miễn phí</h4>
                    <p class="dichvu-card-text">Dịch vụ đặt lịch tư vấn các dòng xe yêu thích hoàn toàn miễn phí</p>
                    <button class="dichvu-button">Tìm hiểu thêm</button>
                </div>
            </div>
            <div class="dichvu-card">
                <img src="../hinhanh/giaoxe.jpg" alt="Giao xe" class="dichvu-image" />
                <div class="dichvu-card-content">
                    <h4 class="dichvu-card-title">Giao xe trên toàn quốc</h4>
                    <p class="dichvu-card-text">Hỗ trợ vận chuyển xe tới tận nhà</p>
                    <button class="dichvu-button">Tìm hiểu thêm</button>
                </div>
            </div>
            <div class="dichvu-card">
                <img src="../hinhanh/doitra.png" alt="đổi trả" class="dichvu-image" />
                <div class="dichvu-card-content">
                    <h4 class="dichvu-card-title">Đổi trả xe</h4>
                    <p class="dichvu-card-text">Hỗ trợ hỗ trợ đổi trả xe khi có bất kì lỗi nào từ thương hiệu</p>
                    <button class="dichvu-button">Tìm hiểu thêm</button>
                </div>
            </div>


            <!-- Add more dịch vụ-card here as needed -->
        </div>
    </div>
    <!-- Sản phẩm bán chạy -->
    <div class="sanpham-container">
        <h1 class="title">Sản phẩm bán chạy</h1>

        <div class="danh-muc">
            <h3>Sedan</h3>
            <div class="sanpham-list">
                {spsedan_banchay}
            </div>
        </div>

        <div class="danh-muc">
            <h3>SUV</h3>
            <div class="sanpham-list">
                {spsuv_banchay}
            </div>
        </div>

        <div class="danh-muc">
            <h3>Coupe</h3>
            <div class="sanpham-list">
                {spcoupe_banchay}
            </div>
        </div>

        <div class="footer-wrapper">
            <div class="testdrive-section">
                <div class="testdrive-overlay">
                    <form class="testdrive-form" onsubmit="handleSubmit(event)">
                        <h2 class="form-title">Đăng ký lái thử</h2>
                        <input type="text" name="name" placeholder="Họ và tên" required />
                        <input type="tel" name="phone" placeholder="Số điện thoại" required />
                        <select name="carModel" required>
                            <option value="">Dòng xe cần tư vấn</option>
                            <option value="A-Class">A-Class</option>
                            <option value="C-Class">C-Class</option>
                            <option value="E-Class">E-Class</option>
                            <option value="G-Class">G-Class</option>
                            <option value="S-Class">S-Class</option>
                            <option value="V-Class">V-Class</option>
                            <option value="AMG">AMG</option>
                            <option value="GT">GT</option>
                            <option value="Maybach">Maybach</option>
                            <option value="EQ">Mercedes-EQ</option>
                            <option value="GLA">GLA</option>
                            <option value="GLB">GLB</option>
                            <option value="GLC">GLC</option>
                            <option value="GLE">GLE</option>
                            <option value="GLS">GLS</option>
                        </select>
                        <button type="submit" class="submit-button">Gửi thông tin</button>
                    </form>
                </div>
            </div>
            {footer}
            <script>
                function handleSubmit(event) {
                    event.preventDefault();
                    alert("Thông tin của bạn đã được gửi!");
                }

            </script>

</body>

</html>