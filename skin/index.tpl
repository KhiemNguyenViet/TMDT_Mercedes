<!DOCTYPE html>
<html lang="vi">
<style>
    body {
        opacity: 0;
        transition: opacity 0.1s ease-in-out;
        font-family: Arial, Helvetica, sans-serif;
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.body.style.opacity = "1";
    });

</script>

<head>
    <meta charset="UTF-8" />
    <meta name="description"
        content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords"
        content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
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
    <!-- <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script> -->
</head>
<script>
    function scrollDichVu(direction) {
        const slider = document.getElementById("dichvuSlider");
        const scrollAmount = 320;
        slider.scrollBy({ left: direction * scrollAmount, behavior: 'smooth' });
    }
</script>

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
            setTimeout(callback, 500);
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
    <!-- mũi tên chỉ xuống (css nằm trong TimHieuThem.css)-->
    <div class="scroll-down" id="scrollDown" onclick="scrollDown()">
        <span class="arrow">🢃</span>
    </div>
    <script>
        function scrollDown() {
            window.scrollBy({ top: 900, behavior: 'smooth' });
        }

        window.addEventListener('scroll', function () {
            const scrollDown = document.getElementById('scrollDown');
            if (window.scrollY > 100) {
                scrollDown.classList.add('hidden');
            } else {
                scrollDown.classList.remove('hidden');
            }
        });
    </script>


    <!-- Tìm Hiểu Thêm -->
    <div class="allcard">
        <h1 class="text1">Tìm hiểu thêm</h1>
        <div class="card-container">
            <div class="card">
                <a href="../product/17.html"><img src="../uploads/1748054887_427702539c18b4ace4b3223d6587dfec.png"
                        alt="Mercedes" class="card-img" /></a>
                <div class="card-content">
                    <p style="line-height: 1.5;">
                        Chỉ vài bước để chạm đến chiếc Mercedes-Benz của bạn.<br />
                        <strong>Mercedes-AMG GLE 53 4MATIC+ Coupé</strong> của riêng bạn đang chờ
                    </p>
                    <a href="../product/17.html" class="btn-view">Xem thêm</a>
                </div>
            </div>

            <div class="card-small">
                <a href="/tonghopthongtin.html"><img src="../hinhanh/chuy2.jpg" alt="Mercedes" class="card1-img" /></a>
                <div class="card-content">
                    <p style="line-height: 1.5;">
                        Tổng hợp thông tin khuyến mại từ Mercedes-Benz Việt Nam cùng hệ thống Nhà phân phối.<br />
                        <strong>Thông tin khuyến mại mới nhất từ Mercedes-Benz</strong>
                    </p>
                    <a class="btn-view" href="/tonghopthongtin.html">Xem thêm</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Dịch Vụ -->
    <div class="dichvu-container" id="dichvu-section">
        <h1 class="dichvu-title">Thông tin dịch vụ</h1>
        <div class="dichvu-wrapper">
            <button class="dichvu-nav left" onclick="scrollDichVu(-1)">&#10094;</button>
            <div class="dichvu-slider" id="dichvuSlider">
                <div class="dichvu-card">
                    <a href="/huongdansudung.html">
                        <img src="../hinhanh/cclass.jpg" alt="Mercedes GLC" class="dichvu-image" />
                    </a>
                    <div class="dichvu-card-content">
                        <h4 class="dichvu-card-title">Hướng dẫn sử dụng cho chủ xe</h4>
                        <p class="dichvu-card-text">Bảng thông tin tính năng và cẩm nang sử dụng cho chủ xe.</p>
                        <a href="/huongdansudung.html" id="dichvu-huongdansudung" class="dichvu-button">Tìm hiểu
                            thêm</a>
                    </div>
                </div>
                <div class="dichvu-card">
                    <a href="/baoduongdinhky.html">
                        <img src="../hinhanh/baoduongdinhki.jpg" alt="Bảo dưỡng định kỳ" class="dichvu-image" />
                    </a>
                    <div class="dichvu-card-content">
                        <h4 class="dichvu-card-title">Bảo dưỡng định kỳ</h4>
                        <p class="dichvu-card-text">Lịch trình và chi phí bảo dưỡng chính hãng Mercedes-Benz.</p>
                        <a href="/baoduongdinhky.html" id="dichvu-baoduongdinhky" class="dichvu-button">Tìm hiểu
                            thêm</a>
                    </div>
                </div>
                <div class="dichvu-card">
                    <a href="/dichvucuuhoc.html">
                        <img src="../hinhanh/dichvucuuho.jpg" alt="Dịch vụ cứu hộ" class="dichvu-image" />
                    </a>
                    <div class="dichvu-card-content">
                        <h4 class="dichvu-card-title">Dịch vụ cứu hộ</h4>
                        <p class="dichvu-card-text">Hỗ trợ 24/7 khi xe gặp sự cố trên đường.</p>
                        <a href="/dichvucuuhoc.html" id="dichvu-cuchuho" class="dichvu-button">Tìm hiểu thêm</a>
                    </div>
                </div>
                <div class="dichvu-card">
                    <a href="/tuvanmienphi.html">
                        <img src="../hinhanh/tuvanmienphi.jpg" alt="Tư vấn miễn phí" class="dichvu-image" />
                    </a>
                    <div class="dichvu-card-content">
                        <h4 class="dichvu-card-title">Tư vấn miễn phí</h4>
                        <p class="dichvu-card-text">Dịch vụ đặt lịch tư vấn các dòng xe yêu thích hoàn toàn miễn phí</p>
                        <a href="/tuvanmienphi.html" id="dichvu-tuvan" class="dichvu-button">Tìm hiểu thêm</a>
                    </div>
                </div>
                <div class="dichvu-card">
                    <a href="/giaoxe.html">
                        <img src="../hinhanh/giaoxe.jpg" alt="Giao xe" class="dichvu-image" />
                    </a>
                    <div class="dichvu-card-content">
                        <h4 class="dichvu-card-title">Giao xe trên toàn quốc</h4>
                        <p class="dichvu-card-text">Hỗ trợ vận chuyển xe tới tận nhà</p>
                        <a href="/giaoxe.html" id="dichvu-giaoxe" class="dichvu-button">Tìm hiểu thêm</a>
                    </div>
                </div>
                <div class="dichvu-card">
                    <a href="/doitra.html">
                        <img src="../hinhanh/doitra.png" alt="đổi trả" class="dichvu-image" />
                    </a>
                    <div class="dichvu-card-content">
                        <h4 class="dichvu-card-title">Đổi trả xe</h4>
                        <p class="dichvu-card-text">Hỗ trợ hỗ trợ đổi trả xe khi có bất kì lỗi nào từ thương hiệu</p>
                        <a href="/doitra.html" id="dichvu-doitra" class="dichvu-button">Tìm hiểu thêm</a>
                    </div>
                </div>


                <!-- Add more dịch vụ-card here as needed -->
            </div>
            <button class="dichvu-nav right" onclick="scrollDichVu(1)">&#10095;</button>
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
                    <form action="../admin/sendmail.php" method="POST" class="testdrive-form">
                        <h2 class="form-title" style="margin: 0 0 0 0;">Đăng ký tư vấn</h2>
                        <input type="hidden" name="subject" value="Yêu cầu tư vấn xe" required />
                        <input type="text" name="name" value="{name_khachhang}" placeholder="Họ và tên" required />
                        <input type="tel" name="phone" value="{phone_khachhang}" placeholder="Số điện thoại" required />
                        <input type="email" name="from_email" value="{email_khachhang}" placeholder="Email" required />
                        <select name="carModel" required>
                            <option value="">Dòng xe cần tư vấn</option>
                            {car_models}
                        </select>
                        <textarea name="message" placeholder="Ghi chú" style="border-radius: 5px;"></textarea>
                        <button type="submit" name="tuvansend" class="submit-button">Gửi thông tin</button>
                    </form>
                </div>
            </div>
            {footer}
        </div>
    </div>
    <script>
        $(document).ready(function () {
            // Cấu hình toastr
            toastr.options = {
                closeButton: true,
                progressBar: true,
                positionClass: 'toast-top-right', // Vị trí: top-right
                timeOut: 3000, // Thời gian hiển thị (3 giây)
                showMethod: 'fadeIn',
                hideMethod: 'fadeOut'
            };

            $('.testdrive-form').on('submit', function (event) {
                event.preventDefault(); // Ngăn chặn hành động mặc định của biểu mẫu

                // Lấy nút submit
                var $submitButton = $('button[name="tuvansend"]', this);
                var originalButtonText = $submitButton.text(); // Lưu văn bản gốc của nút

                // Thu thập dữ liệu từ các trường biểu mẫu
                var subject = $('input[name="subject"]', this).val();
                var name = $('input[name="name"]', this).val();
                var phone = $('input[name="phone"]', this).val();
                var from_email = $('input[name="from_email"]', this).val();
                var carModel = $('select[name="carModel"]', this).val();
                var message = $('textarea[name="message"]', this).val();

                // Kiểm tra các trường bắt buộc
                if (!subject || !name || !phone || !from_email || !carModel) {
                    toastr.error('Vui lòng điền đầy đủ các trường bắt buộc.');
                    return;
                }

                // Cập nhật trạng thái nút: "Đang chờ xử lý" và vô hiệu hóa
                $submitButton.text('Xin quý khách vui lòng chờ xử lý...').prop('disabled', true);

                // Tạo đối tượng dữ liệu để gửi
                var data = {
                    tuvansend: '1', // Giá trị cho tuvansend
                    subject: subject,
                    name: name,
                    phone: phone,
                    from_email: from_email,
                    carModel: carModel,
                    message: message
                };

                // Gửi yêu cầu AJAX
                $.ajax({
                    url: '../admin/sendmail.php',
                    type: 'POST',
                    data: data, // Dữ liệu gửi dưới dạng application/x-www-form-urlencoded
                    dataType: 'json', // Mong đợi phản hồi JSON
                    success: function (response) {
                        // Hiển thị thông báo bằng toastr
                        if (response.success) {
                            toastr.success(response.message);
                        } else {
                            toastr.error(response.message);
                        }
                        // Khôi phục trạng thái nút
                        $submitButton.text(originalButtonText).prop('disabled', false);
                    },
                    error: function (xhr, status, error) {
                        console.error('Lỗi:', error);
                        toastr.error('Có lỗi xảy ra. Vui lòng thử lại.');
                        // Khôi phục trạng thái nút
                        $submitButton.text(originalButtonText).prop('disabled', false);
                    }
                });
            });
        });
    </script>

</body>

</html>