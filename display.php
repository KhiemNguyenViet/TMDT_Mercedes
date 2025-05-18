<?php
if (isset($_GET['file'])) {
    $file = 'uploads/' . basename($_GET['file']);
    if (file_exists($file)) {
        echo "<h2>Hình ảnh đã upload:</h2>";
        echo "<img src='$file' alt='Uploaded Image' style='max-width:500px;'>";
    } else {
        echo "File không tồn tại.";
    }
} else {
    echo "Không có file được chỉ định.";
}
?>
