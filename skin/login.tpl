<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="description" content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords" content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css"> <!-- Liên kết CSS hiện có -->
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <!-- <style>
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
    </style> -->
</head>
<style>
	body {
		opacity: 0;
		transition: opacity 0.1s ease-in-out;
	}
</style>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		document.body.style.opacity = "1";
	});

</script>
<body>
    {header}
    <div class="login-container">
        <h2>Đăng Nhập</h2>
        <form id="login-form" method="post">
            <input type="text" name="username" placeholder="Tên đăng nhập" required />
            <input type="password" name="password" placeholder="Mật khẩu" required />
            <div class="remember" value="on" style="display: none;">
                <i class="fa fa-check-circle-o" style="color: #000;"></i> Remember
            </div>
            <button type="submit" class="login-button">Đăng Nhập</button>
        </form>
        <p>Chưa có tài khoản? <a href="register.html">Đăng ký ngay</a></p>
    </div>
    <div class="load_overlay" style="display: none;"></div>
    <div class="load_process" style="display: none;">
        <div class="load_content">
            <img src="/hinhanh/load.gif" alt="loading" width="70">
            <div class="load_note">Hệ thống đang xử lý</div>
        </div>
    </div>
    <style>
        body {
            background-image: url(../hinhanh/banner1.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .login-container {
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

        .login-container h2 {
            margin: 0 0 20px;
            color: #333;
            font-size: 28px;
            font-weight: 600;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
            width: 100%;
        }

        form input {
            width: 100%;
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

        .remember {
            display: flex;
            align-items: center;
            justify-content: center;
            color: #555;
            font-size: 14px;
            gap: 5px;
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

        p {
            margin: 15px 0 0;
            color: #666;
            font-size: 14px;
        }

        p a {
            color: #4a90e2;
            text-decoration: none;
            font-weight: 500;
        }

        p a:hover {
            text-decoration: underline;
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
            -webkit-border-radius: 8px;
            -moz-border-radius: 8px;
            -ms-border-radius: 8px;
            -o-border-radius: 8px;
            border-radius: 8px;
            text-align: center;
            padding-top: 10px;
            padding-bottom: 10px;
            padding-left: 5px;
            padding-right: 5px;
            overflow: hidden;
            display: none;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
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

        .dichvu-slider {
            display: flex;
            overflow-x: auto;
            scroll-behavior: smooth;
            gap: 1.5rem;
            padding: 20px 10px;
            background: #fff;
            border-radius: 10px;
            margin: 20px 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .dichvu-slider::-webkit-scrollbar {
            height: 6px;
            background: #f1f1f1;
        }

        .dichvu-slider::-webkit-scrollbar-thumb {
            background: #4a90e2;
            border-radius: 10px;
        }

        .dichvu-slider:hover {
            cursor: grab;
        }

        .user-dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            min-width: 100px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
            border-radius: 8px;
            overflow: hidden;
        }

        .dropdown-content ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .dropdown-content ul li {
            text-align: center;
            padding: 8px;
            transition: background 0.3s ease;
        }

        .dropdown-content ul li:hover {
            background-color: #f1f1f1;
        }

        .dropdown-content ul li a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
        }

        .user-dropdown:hover .dropdown-content {
            display: block;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .login-container {
                width: 90%;
                margin: 20px auto;
                padding: 20px;
            }

            form button {
                width: 60%;
            }

            .dichvu-slider {
                gap: 1rem;
                padding: 15px 5px;
            }
        }
    </style>
    <div class="footer-wrapper">
        {footer}
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../skin/tpl/js/process.js"></script>
</body>

</html>