<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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

        .tk-dropdown {
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
            width: 100px;
        }

        .tk-dropdown:hover .dropdown-content {
            display: block;
        }

        .navbar .navbar-right .tk-dropdown {
            display: none;
        }

        .navbar .navbar-right .user-dropdown {
            display: block;
        }

        .navbar .user-dropdown {
            display: block;
        }

        .navbar .navbar-right .tk-dropdown {
            display: none;
        }

        .navbar .navbar-right .user-dropdown {
            display: block;
        }

        #google_translate_element {
            display: none;
            width: 90px;
        }

        select.goog-te-combo {
            width: 90px;
        }

        .navbar {
            position: sticky;
            top: 0;
            z-index: 1000;
        }
    </style>
    <!-- MenuBar -->
    <nav class="navbar">
        <div class="navbar-left">
            <a href="/">Trang chủ</a>
            <a href="/cacmauxe.html">Các mẫu xe</a>
            <a href="/lichsu_thanhtoan.html">Lịch Sử Thanh Toán</a>
            <a href="/#dichvu-section">Thông tin dịch vụ</a>
            <a href="/thuonghieu.html">Thương hiệu</a>
        </div>
        <div class="navbar-center">
            <a href="/">
                <img src="../hinhanh/logo.jpg" alt="Mercedes Logo" class="logo" />
            </a>


        </div>
        <div class="navbar-right">
            <div class="login-message" style="color: deepskyblue;">Mời quý khách đăng nhập để có trải nghiệm tốt hơn !
            </div>
            <div class="user-dropdown">
                <img src="../hinhanh/user-icon.png" alt="User" class="icon" style="width: 35px; height: 20px;" />
                <div class="dropdown-content">
                    <ul class="icon-menu-bar">
                        <li><a class="login" href="/login.html">Đăng nhập</a></li>
                        <li><a class="register" href="/register.html">Đăng ký</a></li>
                    </ul>
                </div>
            </div>
            <a href="/lich_laithu.html">
                <img style="background-color: rgb(255, 255, 255); border-radius: 50%;" src="../hinhanh/files.png"
                    alt="Cart" class="icon" style="width: 30px; height: 30px;" />
            </a>
            <img id="languageIcon" src="../hinhanh/eath.jpg" alt="Language" class="icon"
                style="width: 20px; height: 20px; cursor: pointer;" />
            <div id="google_translate_element"></div>

    </nav>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../skin/tpl/js/process.js?t=<?php echo time();?>">
    </script>
</body>

<script type="text/javascript" src="../skin/tpl/js/process.js?t=<?php echo time();?>"></script>
<script>
    $(document).ready(function () {
        if (localStorage.getItem('loginStatus') === 'loggedInAsUser24') {
            $('.navbar .user-dropdown').css('display', 'none');
            $('.navbar .tk-dropdown').css('display', 'block');
        } else {
            // Đảm bảo trạng thái mặc định nếu không có loginStatus hoặc giá trị khác
            $('.navbar .user-dropdown').css('display', 'block');
            $('.navbar .tk-dropdown').css('display', 'none');
        }

        // Xử lý ngôn ngữ
        $('#languageIcon').click(function () {
            $('#languageIcon').hide();
            $('#google_translate_element').show();
        });

        // Theo dõi sự thay đổi của Google Translate
        var observer = new MutationObserver(function (mutations) {
            mutations.forEach(function (mutation) {
                if (mutation.type === 'childList' && mutation.addedNodes.length > 0) {
                    // Kiểm tra nếu đã chọn ngôn ngữ
                    if ($('.goog-te-combo').val()) {
                        $('#google_translate_element').hide();
                        $('#languageIcon').show();
                    }
                }
            });
        });

        // Bắt đầu quan sát
        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    });
</script>
<script type="text/javascript" src="../skin/tpl/js/jquery-3.2.1.min.js?t=<?php echo time();?>"></script>
</script>
<script type="text/javascript" src="../skin/tpl/js/process.js?t=<?php echo time();?>"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</body>