<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Main Menu</title>
    <!-- Link tới CSS -->
    <link rel="stylesheet" href="../skin/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/css/Banner.css">
    <link rel="stylesheet" href="../skin/css/Timhieuthem.css">
    <link rel="stylesheet" href="../skin/css/DichVu.css">
    <link rel="stylesheet" href="../skin/css/SanPhamBanChay.css">
    <link rel="stylesheet" href="../skin/css/Footer.css">
    <!-- Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
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
    </style>
</head>

<body>

    <!-- MenuBar -->
    <nav class="navbar">
        <div class="navbar-left">
            <a href="CacMauXe.html">Các mẫu xe</a>
            <a href="#">Mua</a>
            <a href="#">Dịch vụ</a>
            <a href="#">Thương hiệu</a>
        </div>
        <div class="navbar-center">
            <img src="../hinhanh/logo.jpg" alt="Mercedes Logo" class="logo"
                onclick="window.location.href='CacMauXe.html'" />
        </div>
        <div class="navbar-right">
            <img src="../hinhanh/glass.png" alt="Search" class="icon" style="width: 23px; height: 23px;" />
            <img src="../hinhanh/cart5.png" alt="Cart" class="icon" style="width: 30px; height: 30px; background-color: black;" />
            <img src="../hinhanh/user-icon.png" alt="User" class="icon" style="width: 35px; height: 20px;" />
            <img src="../hinhanh/eath.jpg" alt="Language" class="icon" style="width: 20px; height: 20px;" />
            <!-- <a href=""><i class="fa fa-user icon" style="width: 20px; height: 20px;color: white;"></i></a> -->
        </div>
    </nav>