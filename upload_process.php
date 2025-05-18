<?php
if (isset($_POST['submit'])) {
    $target_dir = "uploads/";
    $file_name = basename($_FILES["image"]["name"]);
    $target_file = $target_dir . $file_name;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

    // Kiểm tra có phải là file hình không
    $check = getimagesize($_FILES["image"]["tmp_name"]);
    if ($check === false) {
        die("File không phải hình ảnh.");
    }

    // Giới hạn định dạng file
    $allowed = ['jpg', 'jpeg', 'png', 'gif'];
    if (!in_array($imageFileType, $allowed)) {
        die("Chỉ cho phép JPG, JPEG, PNG, GIF.");
    }

    // Di chuyển file upload vào thư mục "uploads"
    if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
        echo "Upload thành công.<br>";
        echo "<a href='display.php?file=" . urlencode($file_name) . "'>Xem hình ảnh</a>";
    } else {
        echo "Có lỗi xảy ra khi upload.";
    }
}
?>
