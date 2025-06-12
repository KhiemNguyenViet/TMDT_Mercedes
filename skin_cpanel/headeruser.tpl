<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script type="text/javascript" src="../skin/tpl/js/process.js?t=<?php echo time();?>"></script>
    <style>
        .body {
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif
        }

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
        }

        .tk-dropdown:hover .dropdown-content {
            display: block;
        }

        .navbar .navbar-right .tk-dropdown {
            display: block;
        }

        .navbar .navbar-right .user-dropdown {
            display: none;
        }
        #google_translate_element {
            display: none;
            width: 90px;
        }

        .VIpgJd-ZVi9od-l4eHX-hSRGPd {
            display: none;
        }
        select.goog-te-combo {
            width: 90px;
        }
        .navbar{
        position: sticky;
        top: 0;
        z-index: 1000;
    }
    </style>
    <!-- MenuBar -->
    <nav class="navbar">
        <div class="navbar-left">
            <span class="hamburger" aria-label="Toggle navigation">☰</span>
            <div class="nav-links">
                <a href="/">Trang chủ</a>
                <a href="/cacmauxe.html">Các mẫu xe</a>
                <a href="/lichsu_thanhtoan.html">Lịch Sử Thanh Toán</a>
                <a href="/#dichvu-section">Thông tin dịch vụ</a>
                <a href="/thuonghieu.html">Thương hiệu</a>
            </div>
        </div>
        <div class="navbar-center">
            <a href="/">
                <img src="../hinhanh/logo.jpg" alt="Mercedes Logo" class="logo" />
            </a>
        </div>
        <div class="navbar-right">
            <p class="login-message" style=" font-size: 14px">Mercedes xin chào, {full_name}!</p>
            <div class="tk-dropdown">
                <img src="../hinhanh/user-icon.png" alt="User" class="icon" style="width: 35px; height: 20px;" />
                <div class="dropdown-content">
                  <ul>
                        <li><a href="/account.html">Tài khoản</a></li>
                        <li><a href="/logout">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
            <!-- <img src="../hinhanh/glass.png" alt="Search" class="icon" style="width: 23px; height: 23px;" /> -->
            <a href="/lich_laithu.html">
                <img style="background-color: rgb(255, 255, 255); border-radius: 50%;" src="../hinhanh/files.png"
                    alt="Cart" class="icon" style="width: 30px; height: 30px;" />
            </a>
            <img id="languageIcon" src="../hinhanh/eath.jpg" alt="Language" class="icon" style="width: 20px; height: 20px; cursor: pointer;" />
            <div id="google_translate_element"></div>
            <!-- <a href=""><i class="fa fa-user icon" style="width: 20px; height: 20px;color: white;"></i></a> -->
        </div>
    </nav>
    <script>
        $(document).ready(function () {
            $('.hamburger').click(function () {
                $('.nav-links').toggleClass('active');
            });
            
    
            // Xử lý ngôn ngữ
            $('#languageIcon').click(function() {
                $('#languageIcon').hide();
                $('#google_translate_element').show();
            });
    
            // Theo dõi sự thay đổi của Google Translate
            var observer = new MutationObserver(function(mutations) {
                mutations.forEach(function(mutation) {
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="../skin/tpl/js/process.js?t=<?php echo time();?>"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</body>