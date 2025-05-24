<!DOCTYPE html>
<html lang="vi">
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
<head>
    <meta name="description"
        content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords"
        content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <meta charset="UTF-8">
    <title>Hồ sơ người dùng</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- Thêm CSS của Toastr -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

    <!-- Thêm JS của Toastr -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="../skin/tpl/css/HoSo.css">
    <!-- <script src="../skin/tpl/js/process.js"></script> -->
</head>

<body>
    {header}
    <div class="profile-container">
        <h2>Hồ sơ người dùng</h2>
        <form class="profile-form">
            <div class="avatar-section">
                <img src="../uploads/{user_avatar}" alt="Ảnh đại diện" class="avatar-preview" id="avatarPreview">
                <label class="upload-btn">
                    <input type="file" id="avatarInput" accept="image/*" hidden>
                    Thay đổi ảnh
                </label>
            </div>

            <div class="form-group">
                <label>Họ tên <i class="fas fa-pen edit-icon"></i></label>
                <input type="text" value="{full_name}" name="full_name">
            </div>

            <div class="form-group">
                <label>Địa chỉ <i class="fas fa-pen edit-icon"></i></label>
                <input type="text" value="{user_address}" name="address">
            </div>

            <div class="form-group">
                <label>Số điện thoại <i class="fas fa-pen edit-icon"></i></label>
                <input type="text" value="{user_phone}" name="phone">
            </div>

            <!-- <div class="form-group">
                <label>Số CCCD <i class="fas fa-pen edit-icon"></i></label>
                <input type="text" value="012345678901">
            </div> -->

            <div class="form-group">
                <label>Email <i class="fas fa-pen edit-icon"></i></label>
                <input type="email" value="{user_email}" name="email">
            </div>

            <div class="form-group">
                <label>Tài khoản <i class="fas fa-pen edit-icon"></i></label>
                <input type="text" id="username" class="readonly-field" value="{user_name}" readonly>
            </div>

            <div class="form-group password-group">
                <label>Mật khẩu <i class="fas fa-pen edit-icon"></i></label>
                <input type="password" value="{password}" id="passwordInput" class="readonly-field">
                <!-- <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i> -->
            </div>

            <button type="button" id_user="{user_id}" id="savetk-btn" class="savetk-btn">Lưu thay đổi</button>
        </form>
    </div>

    <script>
        // Avatar upload preview
        document.getElementById("avatarInput").addEventListener("change", function () {
            const file = this.files[0];
            if (file) {
                document.getElementById("avatarPreview").src = URL.createObjectURL(file);
            }
        });

        // Toggle password visibility
        function togglePassword() {
            const pw = document.getElementById("passwordInput");
            pw.type = pw.type === "password" ? "text" : "password";
        }
    </script>
    {footer}
</body>

</html>