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

            display: none;
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
    </style>
    <!-- MenuBar -->
    <nav class="navbar">
        <div class="navbar-left">
            <a href="/">Trang chủ</a>
            <a href="cacmauxe.html">Các mẫu xe</a>
<<<<<<< HEAD
            <a href="/lichsu_thanhtoan.html">Lịch Sử Thanh Toán</a>
=======
            <!-- <a href="/">Trang chủ</a> -->
>>>>>>> fdcd77106a258a670111c0fecdc38d4aa91d446e
            <a href="/#dichvu-section">Dịch vụ</a>
            <a href="thuonghieu.html">Thương hiệu</a>
        </div>
        <div class="navbar-center">

            <a href="/">
                <img src="../hinhanh/logo.jpg" alt="Mercedes Logo" class="logo" />
            </a>


        </div>
        <div class="navbar-right">
            <!-- <img src="../hinhanh/glass.png" alt="Search" class="icon" style="width: 23px; height: 23px;" /> -->
            <a href="/lich_laithu.html">
                <img style="background-color: rgb(255, 255, 255); border-radius: 50%;" src="../hinhanh/files.png"
                    alt="Cart" class="icon" style="width: 30px; height: 30px;" />
            </a>
            <div class="user-dropdown">
                <img src="../hinhanh/user-icon.png" alt="User" class="icon" style="width: 35px; height: 20px;" />
                <div class="dropdown-content">
                    <ul>
                        <li><a href="/login.html">Đăng nhập</a></li>
                        <li><a href="/register.html">Đăng ký</a></li>
                    </ul>
                </div>
            </div>
            <img src="../hinhanh/eath.jpg" alt="Language" class="icon" style="width: 20px; height: 20px;" />
            <!-- <a href=""><i class="fa fa-user icon" style="width: 20px; height: 20px;color: white;"></i></a> -->
        </div>
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
    });
</script>
<script type="text/javascript" src="../skin/tpl/js/jquery-3.2.1.min.js?t=<?php echo time();?>"></script>
</script>
<script type="text/javascript" src="../skin/tpl/js/process.js?t=<?php echo time();?>"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</body>