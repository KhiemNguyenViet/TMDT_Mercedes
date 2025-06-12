<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script type="text/javascript" src="../skin/tpl/js/process.js?t=<?php echo time();?>"></script>

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

        .VIpgJd-ZVi9od-l4eHX-hSRGPd {
            display: none;
        }
        select.goog-te-combo {
            width: 90px;
        }

        .navbar {
            position: sticky;
            top: 0;
            z-index: 1000;
        }
        .login-message a{
            font-size: 16px;
        }
        .login-message a:hover{
            color: deepskyblue;
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
            <div class="login-message">Mời quý khách <a href="/login.html">đăng nhập</a> để có trải nghiệm tốt hơn !</div>
            <div class="user-dropdown">
                <img src="../hinhanh/user-icon.png" alt="User" class="icon user-icon" />
                <div class="dropdown-content">
                    <ul class="icon-menu-bar">
                        <li><a class="login" href="/login.html">Đăng nhập</a></li>
                        <li><a class="register" href="/register.html">Đăng ký</a></li>
                    </ul>
                </div>
            </div>
            <div class="tk-dropdown">
                <img src="../hinhanh/user-icon.png" alt="User" class="icon user-icon" />
                <div class="dropdown-content">
                    <ul class="icon-menu-bar">
                        <li><a href="/profile.html">Hồ sơ</a></li>
                        <li><a href="/logout.html">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
            <a href="/lich_laithu.html" class="cart-link">
                <img src="../hinhanh/files.png" alt="Cart" class="icon cart-icon" />
            </a>
            <div class="language-toggle">
                <img id="languageIcon" src="../hinhanh/eath.jpg" alt="Language" class="icon language-icon" />
                <div id="google_translate_element"></div>
            </div>
        </div>
    </nav>

    <script>
        $(document).ready(function () {
            // Hamburger menu toggle
            $('.hamburger').click(function () {
                $('.nav-links').toggleClass('active');
            });

            // Login status handling
            if (localStorage.getItem('loginStatus') === 'loggedInAsUser24') {
                $('.navbar .user-dropdown').hide();
                $('.navbar .tk-dropdown').show();
            } else {
                $('.navbar .user-dropdown').show();
                $('.navbar .tk-dropdown').hide();
            }

            // Language toggle
            $('#languageIcon').click(function () {
                $('#languageIcon').hide();
                $('#google_translate_element').show();
            });

            // Google Translate observer
            var observer = new MutationObserver(function (mutations) {
                mutations.forEach(function (mutation) {
                    if (mutation.type === 'childList' && mutation.addedNodes.length > 0) {
                        if ($('.goog-te-combo').val()) {
                            $('#google_translate_element').hide();
                            $('#languageIcon').show();
                        }
                    }
                });
            });

            observer.observe(document.body, {
                childList: true,
                subtree: true
            });
        });
    </script>
</body>