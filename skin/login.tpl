<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="../skin/css/MenuBar.css"> <!-- Liên kết CSS hiện có -->
    <link rel="stylesheet" href="../skin/css/Footer.css">
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

        .user-dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 90px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
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
    </style>
    <style>
        body {
            font-family: 'Arial', sans-serif; /* Sử dụng font sạch sẽ */
            background-color: #1a1a1a; /* Màu đen đậm cho phong cách sang trọng */
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #ffffff; /* Văn bản màu trắng để nổi bật */
        }
        .login-container {
            background-color: #333333; /* Màu xám đậm như bạc Mercedes */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5); /* Bóng đổ mạnh mẽ hơn */
            width: 300px;
        }
        .login-container h2 {
            text-align: center;
            color: #ffffff; /* Văn bản trắng */
        }
        .login-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #666666; /* Viền xám */
            border-radius: 4px;
            background-color: #2a2a2a; /* Nền tối cho input */
            color: #ffffff; /* Văn bản trắng */
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            background-color: #c00; /* Màu đỏ đặc trưng của Mercedes */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .login-container button:hover {
            background-color: #a00; /* Tối hơn khi hover */
        }
    </style>
</head>
<body>
    {header}
    <div class="login-container">
        <h2>Đăng Nhập</h2>
        <form action="login-process.php" method="POST">
            <input type="text" placeholder="Tên đăng nhập" required />
            <input type="password" placeholder="Mật khẩu" required />
            <input type="text" placeholder="Email" required />
            <input type="text" placeholder="Họ tên đầy đủ" required />
            <input type="text" placeholder="Số điện thoại" required />
            <input type="text" placeholder="Địa chỉ" required />
            <button type="submit">Đăng Nhập</button>
        </form>
        <p>Chưa có tài khoản? <a href="register.tpl">Đăng ký ngay</a></p>
    </div>
    {footer}
</body>
</html>
