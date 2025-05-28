<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Nạp các file cần thiết
require '../vendor/PHPMailer/src/PHPMailer.php';
require '../vendor/PHPMailer/src/SMTP.php';
require '../vendor/PHPMailer/src/Exception.php';

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
} else if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['khachhangsend'])) {
        $to = $_POST['to_email'] ?? '';
        $subject = $_POST['subject'] ?? '';
        $message = $_POST['message'] ?? '';
        $from_email = $_POST['from_email'] ?? '';
    
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
            $mail->setFrom($from_email, 'Khách hàng');
            $mail->addAddress($to);
    
            // Nội dung
            $mail->isHTML(true);
            $mail->Subject = $subject;
            $mail->Body    = nl2br($message);  // Giữ xuống dòng
            $mail->AltBody = strip_tags($message);
    
            $mail->send();
            echo json_encode([
                'success' => true,
                'message' => 'Gửi email thành công'
            ]);
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
