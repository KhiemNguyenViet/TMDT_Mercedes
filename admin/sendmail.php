<?php
// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Nạp các file cần thiết
require '../vendor/PHPMailer/src/PHPMailer.php';
require '../vendor/PHPMailer/src/SMTP.php';
require '../vendor/PHPMailer/src/Exception.php';

// Khởi tạo đối tượng
// $mail = new PHPMailer(true);

// try {
//     // Cấu hình SMTP
//     $mail->isSMTP();
//     $mail->Host       = 'smtp.gmail.com';
//     $mail->SMTPAuth   = true;
//     $mail->Username   = 'khiemnguyenviet.2004@gmail.com';        // Gmail của bạn
//     $mail->Password   = 'jjvdhaylgzytplsl';           // Mật khẩu ứng dụng (không phải mật khẩu Gmail)
    // $mail->SMTPSecure = 'tls';
    // $mail->Port       = 587;

//     // Thiết lập người gửi và người nhận
//     $mail->setFrom('tmdt.mercedes@gmail.com', 'CEO Mercedes');
//     $mail->addAddress('uyenn0754@gmail.com','UyenNguyen');

//     // Nội dung email
//     $mail->isHTML(true);
//     $mail->Subject = 'Test';
//     $mail->Body    = nl2br('Test');
//     $mail->AltBody = strip_tags('Test');

//     // Gửi
//     $mail->send();
//     echo 'Email đã được gửi thành công!';
// } catch (Exception $e) {
//     echo "Không thể gửi email. Lỗi: {$mail->ErrorInfo}";
// }
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['send'])) {
    $to = $_POST['to_email'] ?? '';
    $subject = $_POST['subject'] ?? '';
    $message = $_POST['message'] ?? '';

    $mail = new PHPMailer(true);

    try {
        // Cấu hình SMTP Gmail
        $mail->isSMTP();
        $mail->Host       = 'smtp.gmail.com';
        $mail->SMTPAuth   = true;
        $mail->Username   = 'khiemnguyenviet.2004@gmail.com'; // Gmail bạn
        $mail->Password   = 'jjvdhaylgzytplsl';    // Mật khẩu ứng dụng Gmail
        $mail->SMTPSecure = 'tls';
        $mail->Port       = 587;
        $mail->CharSet = 'UTF-8'; 

        // Người gửi và người nhận
        $mail->setFrom('khiemnguyenviet.2004@gmail.com', 'Mercedes');
        $mail->addAddress($to);

        // Nội dung
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body    = nl2br($message);  // Giữ xuống dòng
        $mail->AltBody = strip_tags($message);

        $mail->send();
        
    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'message' => 'Gửi email thất bại: ' . $mail->ErrorInfo
        ]);
    }
} else {
    echo 'Không nhận được dữ liệu hợp lệ.';
}
?>
