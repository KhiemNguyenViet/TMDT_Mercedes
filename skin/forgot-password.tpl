<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="description" content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords" content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<style>
    body {
        opacity: 0;
        transition: opacity 0.1s ease-in-out;
        background-image: url(../hinhanh/banner1.jpg);
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        background-attachment: fixed;
        margin: 0;
        padding: 0;
        font-family: 'Arial', sans-serif;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }

    .container {
        text-align: center;
        width: 400px;
        margin: 50px auto;
        padding: 30px;
        border-radius: 15px;
        background: rgba(255, 255, 255, 0.95);
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(5px);
        border: 1px solid rgba(255, 255, 255, 0.2);
    }

    .container h1 {
        margin: 0 0 20px;
        color: #333;
        font-size: 28px;
        font-weight: 600;
    }

    .container p {
        margin: 0 0 20px;
        color: #666;
        font-size: 16px;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
        width: 100%;
    }

    form input {
        width: 95%;
        padding: 12px;
        border: none;
        border-radius: 8px;
        background: #f8f9fa;
        font-size: 14px;
        transition: all 0.3s ease;
        outline: none;
        box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.05);
    }

    form input:focus {
        background: #fff;
        box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    form button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 8px;
        background: linear-gradient(90deg, #4a90e2, #63b3ed);
        color: #fff;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(74, 144, 226, 0.3);
    }

    form button:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(74, 144, 226, 0.4);
        background: linear-gradient(90deg, #357abd, #4dabf7);
    }

    form button:active {
        transform: translateY(0);
    }

    .load_overlay {
        position: fixed;
        background: #000;
        opacity: 0.8;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 9999;
        display: none;
    }

    .load_process {
        position: fixed;
        margin: auto;
        z-index: 99999;
        background: #fff;
        width: 400px;
        max-width: calc(90% - 10px);
        height: 120px;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        border-radius: 8px;
        text-align: center;
        padding: 10px 5px;
        overflow: hidden;
        display: none;
    }

    .load_content {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100%;
    }

    .load_content img {
        width: 60px;
        height: 60px;
    }

    .load_note {
        margin-top: 10px;
        color: #333;
        font-size: 16px;
    }

    @media (max-width: 768px) {
        .container {
            width: 90%;
            margin: 20px auto;
            padding: 20px;
        }

        form button {
            width: 60%;
        }
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.body.style.opacity = "1";
    });
</script>
<body>
    {header}
    <div class="container">
        <h1>Quên mật khẩu</h1>
        <p>Vui lòng nhập email để lấy lại mật khẩu</p>
        <form action="admin/sendmail.php" method="post">
            <input type="email" name="to_email" placeholder="Email" required>
            <input type="hidden" name="subject" value="Yêu cầu lấy lại mật khẩu">
            <input type="hidden" name="message" value="Vui lòng nhập email để lấy lại mật khẩu">
            <input type="hidden" name="from_email" value="khiemnguyenviet.2004@gmail.com">
            <button type="submit" name="forgot-password">Lấy lại mật khẩu</button>
        </form>
    </div>
    <div class="load_overlay" style="display: none;"></div>
    <div class="load_process" style="display: none;">
        <div class="load_content">
            <img src="/hinhanh/load.gif" alt="loading" width="70">
            <div class="load_note">Hệ thống đang xử lý</div>
        </div>
    </div>
    <div class="footer-wrapper">
        {footer}
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../skin/tpl/js/process.js"></script>
</body>
</html>