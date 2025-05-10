<!DOCTYPE html>
<html lang="vi">
<head>
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">
    <meta charset="UTF-8">
    <title>Hồ sơ người dùng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" href="../skin/tpl/css/HoSo.css">
</head>

<body>
    {header}
    <div class="profile-container">
        <h2>Hồ sơ người dùng</h2>
        <form class="profile-form">
            <div class="avatar-section">
                <img src="https://via.placeholder.com/150" alt="Ảnh đại diện" class="avatar-preview" id="avatarPreview">
                <label class="upload-btn">
                    <input type="file" id="avatarInput" accept="image/*" hidden>
                    Thay đổi ảnh
                </label>
            </div>

            <div class="form-group">
                <label>Họ tên <i class="fas fa-pen edit-icon"></i></label>
                <input type="text" value="Nguyễn Văn A">
            </div>

            <div class="form-group">
                <label>Địa chỉ <i class="fas fa-pen edit-icon"></i></label>
                <input type="text" value="123 Đường ABC, Quận 1, TP.HCM">
            </div>

            <div class="form-group">
                <label>Số điện thoại <i class="fas fa-pen edit-icon"></i></label>
                <input type="text" value="0909123456">
            </div>

            <div class="form-group">
                <label>Số CCCD <i class="fas fa-pen edit-icon"></i></label>
                <input type="text" value="012345678901">
            </div>

            <div class="form-group">
                <label>Email <i class="fas fa-pen edit-icon"></i></label>
                <input type="email" value="user@email.com">
            </div>

            <div class="form-group">
                <label>Tài khoản</label>
                <input type="text" id="username" class="readonly-field" value="username123" readonly>
            </div>

            <div class="form-group password-group">
                <label>Mật khẩu <i class="fas fa-pen edit-icon"></i></label>
                <input type="password" value="12345678" id="passwordInput">
                <i class="fas fa-eye toggle-password" onclick="togglePassword()"></i>
            </div>

            <button type="submit" class="save-btn">Lưu thay đổi</button>
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