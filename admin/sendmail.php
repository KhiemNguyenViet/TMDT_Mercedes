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
            $mail->addAddress($to,'Admin Mercedes');
    
            // Nội dung
            $mail->isHTML(true);
            $mail->Subject = $subject;
            $mail->Body    = nl2br("Email khách hàng: " . $from_email . "\n" . $message);  // Giữ xuống dòng
            $mail->AltBody = strip_tags($message);
    
            $mail->send();
            echo json_encode([
                'success' => true,
                'message' => 'Gửi email hủy lịch lái thử xe thành công. Vui lòng kiểm tra email để nhận thông tin phản hổi của chúng tôi!'
            ]);
        } catch (Exception $e) {
            echo json_encode([
                'success' => false,
                'message' => 'Gửi email thất bại: ' . $mail->ErrorInfo
            ]);
        }
} else if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['tuvansend'])) {
    $to = 'khiemnguyenviet.2004@gmail.com';
    $subject = $_POST['subject'] ?? '';
    $from_email = $_POST['from_email'] ?? '';
    $name_khachhang = $_POST['name'] ?? '';
    $phone_khachhang = $_POST['phone'] ?? '';
    $carModel = $_POST['carModel'] ?? '';
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
        $mail->setFrom($from_email, 'Khách hàng');
        $mail->addAddress($to,'Admin Mercedes');

        // Nội dung
        $mail->isHTML(true);
        $mail->Subject = $subject;
        $mail->Body    = nl2br("Tên khách hàng: " . $name_khachhang . "\n" . "Số điện thoại: " . $phone_khachhang . "\n" . "Dòng xe: " . $carModel . "\n" . "Email khách hàng: " . $from_email . "\n" . $message);  // Giữ xuống dòng
        $mail->AltBody = strip_tags($message);

        $mail->send();
        echo json_encode([
            'success' => true,
            'message' => 'Gửi email tư vấn xe thành công. Vui lòng kiểm tra email để nhận thông tin phản hổi của chúng tôi!'
        ]);
    } catch (Exception $e) {
        echo json_encode([
            'success' => false,
            'message' => 'Gửi email thất bại: ' . $mail->ErrorInfo
        ]);
    }
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Không nhận được dữ liệu hợp lệ.'
    ]);
}
?>
