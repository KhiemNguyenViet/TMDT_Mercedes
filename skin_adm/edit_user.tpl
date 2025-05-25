<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <title>Chỉnh sửa người dùng</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .edit-form {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #2c3e50;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        input:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .btn {
            padding: 10px 24px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-cancel {
            background-color: #fff;
            border: 1px solid #ddd;
            color: #666;
        }

        .btn-save {
            background-color: #3498db;
            color: white;
        }

        .btn-save:hover {
            background-color: #2980b9;
        }

        .btn-cancel:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="edit-form">
            <h2>Chỉnh sửa thông tin người dùng</h2>

            <form id="editUserForm">
                <input type="hidden" name="user_id" value="{user_id}">
                
                <div class="form-grid">
                    <div class="form-left">
                        <div class="form-group">
                            <label>Họ và tên</label>
                            <input type="text" name="full_name" value="{full_name}" required>
                        </div>

                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input type="text" name="phone" value="{phone}">
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" name="email" value="{email}" required>
                        </div>
                    </div>

                    <div class="form-right">
                        <div class="form-group">
                            <label>Tên đăng nhập</label>
                            <input type="text" name="username" value="{username}" required>
                        </div>

                        <div class="form-group">
                            <label>Địa chỉ</label>
                            <input type="text" name="address" value="{address}">
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="button" class="btn btn-cancel" onclick="history.back()">Quay lại</button>
                    <button type="button" class="btn btn-save">Lưu thay đổi</button>
                </div>
            </form>
        </div>
    </div>

    <script>
    $(document).ready(function() {
        $('.btn-save').click(function() {
            const $btn = $(this);
            const $form = $('#editUserForm');
            
            // Disable button and show loading state
            $btn.prop('disabled', true).text('Lưu thay đổi');

            // Get form data
            const formData = {
                action: 'update_user',
                id: $('input[name="user_id"]').val(),
                full_name: $('input[name="full_name"]').val(),
                phone: $('input[name="phone"]').val(),
                email: $('input[name="email"]').val(),
                username: $('input[name="username"]').val(),
                password: $('input[name="new_password"]').val(),
                address: $('input[name="address"]').val()
            };

            $.ajax({
                url: '../admin/process.php',
                type: 'POST',
                data: formData,
                dataType: 'json',
                success: function(response) {
                    if (response.ok === 1) {
                        toastr.success(response.message);
                        setTimeout(() => {
                            window.location.href = 'dashboard#users';
                        }, 1000);
                    } else {
                        toastr.error(response.message || 'Có lỗi xảy ra');
                        $btn.prop('disabled', false).text('Lưu thay đổi');
                    }
                },
                error: function() {
                    toastr.error('Có lỗi kết nối đến máy chủ');
                    $btn.prop('disabled', false).text('Lưu thay đổi');
                }
            });
        });
    });
    </script>
</body>
</html>