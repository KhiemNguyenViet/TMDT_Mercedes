<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Kiểm tra file đã được upload chưa
    if (isset($_FILES['payment_image']) && $_FILES['payment_image']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['payment_image']['tmp_name'];
        $fileName = $_FILES['payment_image']['name'];
        $fileSize = $_FILES['payment_image']['size'];
        $fileType = $_FILES['payment_image']['type'];
        $fileNameCmps = explode(".", $fileName);
        $fileExtension = strtolower(end($fileNameCmps));

        // Danh sách định dạng hợp lệ
        $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
        if (in_array($fileExtension, $allowedExtensions)) {
            // Tạo tên mới để tránh trùng
            $newFileName = time() . '_' . md5($fileName) . '.' . $fileExtension;

            // Đường dẫn thư mục lưu ảnh (đảm bảo thư mục này tồn tại và có quyền ghi)
            $uploadFileDir = './uploads/';
            $dest_path = $uploadFileDir . $newFileName;

            // Di chuyển file từ tmp vào thư mục uploads
            if (move_uploaded_file($fileTmpPath, $dest_path)) {
                echo "Upload thành công!<br>";
                echo "Tên ảnh: " . htmlspecialchars($newFileName);
            } else {
                echo "Lỗi: Không thể lưu file.";
            }
        } else {
            echo "Chỉ chấp nhận file ảnh có đuôi JPG, JPEG, PNG, GIF.";
        }
    } else {
        echo "Vui lòng chọn ảnh xác nhận chuyển khoản.";
    }

    // Bạn có thể xử lý thêm các dữ liệu form khác tại đây, ví dụ:
    // $_POST['fullName'], $_POST['email'], $_POST['dealer'], ...
}
?>
