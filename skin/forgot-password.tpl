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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

        /* Popup styles */
        .popup-overlay {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.6);
            z-index: 10000;
            display: none;
            justify-content: center;
            align-items: center;
        }

        .popup {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            max-width: 400px;
            width: 90%;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .popup.success {
            border: 2px solid #4a90e2;
        }

        .popup.error {
            border: 2px solid #e74c3c;
        }

        .popup h3 {
            margin: 0 0 10px;
            font-size: 20px;
            color: #333;
        }

        .popup p {
            margin: 0 0 20px;
            font-size: 16px;
            color: #666;
        }

        .popup button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background: linear-gradient(90deg, #4a90e2, #63b3ed);
            color: #fff;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .popup button:hover {
            background: linear-gradient(90deg, #357abd, #4dabf7);
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

            .popup {
                width: 95%;
            }
        }
    </style>
</head>
<body>
    {header}
    <div class="container">
        <h1>Quên mật khẩu</h1>
        <p>Vui lòng nhập email để lấy lại mật khẩu</p>
        <form id="forgot-password-form">
            <input type="email" name="to_email" placeholder="Email" required autocomplete="off">
            <input type="hidden" name="subject" value="Yêu cầu lấy lại mật khẩu">
            <input type="hidden" name="message" value="Vui lòng nhập email để lấy lại mật khẩu">
            <input type="hidden" name="from_email" value="khiemnguyenviet.2004@gmail.com">
            <input type="hidden" name="forgot-password" value="1">
            <button type="submit">Lấy lại mật khẩu</button>
        </form>
    </div>
    <!-- Popup -->
    <div class="popup-overlay" id="popupOverlay">
        <div class="popup" id="popup">
            <h3 id="popupTitle"></h3>
            <p id="popupMessage"></p>
            <button onclick="closePopup()">OK</button>
        </div>
    </div>
    <div class="footer-wrapper">
        {footer}
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.body.style.opacity = "1";

            // Xử lý form quên mật khẩu qua AJAX
            $('#forgot-password-form').on('submit', function (e) {
                e.preventDefault();
                var formData = new FormData(this);

                $.ajax({
                    url: 'admin/sendmail.php',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        try {
                            const data = JSON.parse(response);
                            showPopup(data.success, data.message, data.redirect);
                        } catch (e) {
                            showPopup(false, 'Lỗi xử lý phản hồi từ server', '../forgot-password.html');
                        }
                    },
                    error: function (xhr, status, error) {
                        showPopup(false, 'Lỗi kết nối server: ' + error, '../forgot-password.html');
                    }
                });
            });

            // Hàm hiển thị popup
            function showPopup(success, message, redirect) {
                const popupOverlay = document.getElementById('popupOverlay');
                const popup = document.getElementById('popup');
                const popupTitle = document.getElementById('popupTitle');
                const popupMessage = document.getElementById('popupMessage');

                popup.className = 'popup ' + (success ? 'success' : 'error');
                popupTitle.textContent = success ? 'Thành công' : 'Lỗi';
                popupMessage.textContent = message;
                popupOverlay.style.display = 'flex';

                // Tự động đóng popup và chuyển hướng sau 3 giây
                setTimeout(function () {
                    popupOverlay.style.display = 'none';
                    window.location.href = redirect;
                }, 3000);
            }

            // Hàm đóng popup thủ công
            function closePopup() {
                const popupOverlay = document.getElementById('popupOverlay');
                popupOverlay.style.display = 'none';
            }
        });
    </script>
</body>
</html>