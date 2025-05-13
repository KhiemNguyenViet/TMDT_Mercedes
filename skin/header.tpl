<body>
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
        }

        .tk-dropdown:hover .dropdown-content {
            display: block;
        }

        .navbar .tk-dropdown {
            display: none;
        }

        .navbar .user-dropdown {
            display: block;
        }
    </style>
    <!-- MenuBar -->
    <nav class="navbar">
        <div class="navbar-left">
            <a href="cacmauxe.html">Các mẫu xe</a>
            <a href="#">Mua</a>
            <a href="#">Dịch vụ</a>
            <a href="thuonghieu.html">Thương hiệu</a>
        </div>
        <div class="navbar-center">
            <img src="../hinhanh/logo.jpg" alt="Mercedes Logo" class="logo"
                onclick="window.location.href='/'" />
        </div>
        <div class="navbar-right">
            <img src="../hinhanh/glass.png" alt="Search" class="icon" style="width: 23px; height: 23px;" />
            <img src="../hinhanh/cart5.png" alt="Cart" class="icon"
                style="width: 30px; height: 30px; background-color: black;" />
            <div class="user-dropdown">
                <img src="../hinhanh/user-icon.png" alt="User" class="icon" style="width: 35px; height: 20px;" />
                <div class="dropdown-content">
                    <ul>
                        <li><a href="login.html">Đăng nhập</a></li>
                        <li><a href="register.html">Đăng ký</a></li>
                    </ul>
                </div>
            </div>
            <div class="tk-dropdown">
                <img src="../hinhanh/user-icon.png" alt="User" class="icon" style="width: 35px; height: 20px;" />
                <div class="dropdown-content">
                    <ul>
                        <li><a href="account.html">Tài khoản</a></li>
                        <li><a name="logout">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
            <img src="../hinhanh/eath.jpg" alt="Language" class="icon" style="width: 20px; height: 20px;" />
            <!-- <a href=""><i class="fa fa-user icon" style="width: 20px; height: 20px;color: white;"></i></a> -->
        </div>
    </nav>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        });
    </script>
</body>