<!-- <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body> -->
    <div class="min-h-screen bg-black text-white">
        <nav class="navbar">
            <div class="navbar-left"><a href="#">Các mẫu xe</a><a href="#">Mua</a><a href="#">Dịch vụ</a><a
                    href="#">Thương hiệu</a></div>
            <div class="navbar-center"><img alt="Mercedes Logo" class="logo" src="/images/logo.jpg"></div>
            <div class="navbar-right"><svg stroke="currentColor" fill="currentColor" stroke-width="0"
                    viewBox="0 0 512 512" class="icon" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M505 442.7L405.3 343c-4.5-4.5-10.6-7-17-7H372c27.6-35.3 44-79.7 44-128C416 93.1 322.9 0 208 0S0 93.1 0 208s93.1 208 208 208c48.3 0 92.7-16.4 128-44v16.3c0 6.4 2.5 12.5 7 17l99.7 99.7c9.4 9.4 24.6 9.4 33.9 0l28.3-28.3c9.4-9.4 9.4-24.6.1-34zM208 336c-70.7 0-128-57.2-128-128 0-70.7 57.2-128 128-128 70.7 0 128 57.2 128 128 0 70.7-57.2 128-128 128z">
                    </path>
                </svg><svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 496 512" class="icon"
                    height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M336.5 160C322 70.7 287.8 8 248 8s-74 62.7-88.5 152h177zM152 256c0 22.2 1.2 43.5 3.3 64h185.3c2.1-20.5 3.3-41.8 3.3-64s-1.2-43.5-3.3-64H155.3c-2.1 20.5-3.3 41.8-3.3 64zm324.7-96c-28.6-67.9-86.5-120.4-158-141.6 24.4 33.8 41.2 84.7 50 141.6h108zM177.2 18.4C105.8 39.6 47.8 92.1 19.3 160h108c8.7-56.9 25.5-107.8 49.9-141.6zM487.4 192H372.7c2.1 21 3.3 42.5 3.3 64s-1.2 43-3.3 64h114.6c5.5-20.5 8.6-41.8 8.6-64s-3.1-43.5-8.5-64zM120 256c0-21.5 1.2-43 3.3-64H8.6C3.2 212.5 0 233.8 0 256s3.2 43.5 8.6 64h114.6c-2-21-3.2-42.5-3.2-64zm39.5 96c14.5 89.3 48.7 152 88.5 152s74-62.7 88.5-152h-177zm159.3 141.6c71.4-21.2 129.4-73.7 158-141.6h-108c-8.8 56.9-25.6 107.8-50 141.6zM19.3 352c28.6 67.9 86.5 120.4 158 141.6-24.4-33.8-41.2-84.7-50-141.6h-108z">
                    </path>
                </svg></div>
        </nav>
        <div class="banner-container"><img alt="Slideshow" class="banner" src="/images/banner4.jpg"></div>
        <div class="allcard">
            <h1 class="text1">Tìm Hiểu Thêm</h1>
            <div class="card-container">
                <div class="card"><img alt="Mercedes" class="card-img" src="../images/sanpham12.png">
                    <div class="card-content">
                        <p>Chỉ vài bước để chạm đến chiếc Mercedes-Benz của bạn.<br><strong>Mercedes-AMG GLE 53 4MATIC+
                                Coupé</strong> của riêng bạn đang chờ</p><button class="btn-view">View</button>
                    </div>
                </div>
                <div class="card"><img alt="Mercedes" class="card1-img" src="../images/chuy2.jpg">
                    <div class="card-content">
                        <p>Tổng hợp thông tin khuyến mại từ Mercedes-Benz Việt Nam cùng hệ thống Nhà phân
                            phối.<br><strong>Thông tin khuyến mại mới nhất từ Mercedes-Benz</strong></p><button
                            class="btn-view">View</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style>
        .banner {
    width: 100%;
    height: 85vh;
    margin: 0 auto;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: black;

}
.navbar {
    background-color: #000;
    /* Use hex for consistency */
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    position: relative;
    color: #fff;
    font-family: 'Arial', sans-serif;
    /* Specify a fallback font */
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    /* Add a subtle shadow */
    z-index: 1000;
    /* Ensure it stays on top */
    width: 100%;
}

.navbar-left,
.navbar-right {
    display: flex;
    align-items: center;
    gap: 20px;
    padding: 0 20px;
}

.navbar-left a,
.navbar-right a {
    color: #fff;
    text-decoration: none;
    font-size: 14px;
    transition: color 0.3s ease;
    /* Smooth hover effect */
}

.navbar-left a:hover,
.navbar-right a:hover {
    color: #1e90ff;
    /* Add a hover color for better UX */
    text-decoration: underline;
}

.navbar-center {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    text-align: center;
}

.logo {
    height: 40px;
    object-fit: contain;
    cursor: pointer;
    transition: transform 0.3s ease;
    /* Add hover animation */
}

.logo:hover {
    transform: scale(1.1);
    /* Slight zoom on hover */
}

.icon {
    width: 18px;
    height: 18px;
    cursor: pointer;
    transition: transform 0.3s ease, opacity 0.3s ease;
    /* Smooth animations */
}

.icon:hover {
    transform: scale(1.2);
    /* Slight zoom on hover */
    opacity: 0.8;
    /* Dim the icon slightly */
}

/* Add responsiveness */
@media (max-width: 768px) {
    .navbar {
        padding: 0 10px;
    }

    .navbar-left,
    .navbar-right {
        gap: 10px;
    }

    .navbar-left a,
    .navbar-right a {
        font-size: 12px;
    }

    .logo {
        height: 30px;
    }

    .icon {
        width: 16px;
        height: 16px;
    }
}
body {
    font-family: Arial, sans-serif;
    margin: 0;
    background-color: #fff;
}

.section .title {
    font-size: 32px;
    font-weight: bold;
    margin-bottom: 30px;
}

.card-container {
    display: flex;
    gap: 20px;
    flex-wrap: wrap;
}

.card {
    width: 47%;
    position: relative;
    overflow: hidden;
    border-radius: 4px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.card-img {
    width: 60%;
    display: block;
}

.card-img img {
    width: 100%;
    height: auto;
    border-radius: 4px 4px 0 0;
    transition: transform 0.3s ease;
}

.card-content {
    position: absolute;
    bottom: 0;
    color: white;
    padding: 20px;
    background: linear-gradient(to top, rgba(0, 0, 0, 0.9), rgba(0, 0, 0, 0));
    width: 100%;
}

.card-content p {
    margin: 0 0 15px;
    font-size: 14px;
}

.btn-view {
    background-color: #4a5cff;
    color: white;
    border: none;
    padding: 8px 16px;
    font-weight: bold;
    border-radius: 4px;
    cursor: pointer;
}
    </style>
<!-- </body>

</html> -->