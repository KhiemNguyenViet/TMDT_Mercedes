<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng Nhập</title>
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css"> <!-- Liên kết CSS hiện có -->
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
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
</head>
<body>
    {header}
    <div class="login-container">
        <h2>Đăng Nhập</h2>
        <form action="login-process.php" method="POST">
            <input type="text" name="username" placeholder="Tên đăng nhập" required />
            <input type="password" name="password" placeholder="Mật khẩu" required />
            <!-- <input type="text" name="email" placeholder="Email" required />
            <input type="text" name="name" placeholder="Họ tên đầy đủ" required />
            <input type="text" name="phone" placeholder="Số điện thoại" required />
            <input type="text" name="address" placeholder="Địa chỉ" required /> -->
            <button type="submit">Đăng Nhập</button>
        </form>
        <p>Chưa có tài khoản? <a href="register.html">Đăng ký ngay</a></p>
    </div>
    <style>
        body{
            background-image: url(../hinhanh/banner1.jpg);
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        .login-container h2{
            text-align: center;
        }
        form{
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }
        form input{
            width: 77%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        form button{
            color: #fff;
            background-color: #616161;
            width: 40%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: transform 0.3s ease;
        }
        form button:hover {
            transform: scale(1.05);
        }
        .login-container{
            text-align: center;
            width: 40%;
            margin: 5px auto;
            border: 2px solid #ccc;
            border-radius: 5px;
            background-color: #bebbbb;
        }
    </style>
    <div class="footer-wrapper">
    {footer}
<<<<<<< HEAD
    <script src="/skin/tpl/js/process.js"></script>
=======
>>>>>>> b474affdf50003bf164af10fb457b4a0363962bd
</body>
</html>
