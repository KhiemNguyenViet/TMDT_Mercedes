<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Nạp các file cần thiết
require '../vendor/PHPMailer/src/PHPMailer.php';
require '../vendor/PHPMailer/src/SMTP.php';
require '../vendor/PHPMailer/src/Exception.php';

// Sửa đường dẫn include
include('../includes/tlca_world.php');

// Kiểm tra xem $tlca_do đã được khởi tạo chưa
if (!isset($tlca_do)) {
    die("Không thể khởi tạo hệ thống. Vui lòng kiểm tra lại cấu hình.");
}

// Xử lý request
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');

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
} else if($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['forgot-password'])) {
    $email = $_POST['to_email'];
    
    // Kiểm tra email có tồn tại trong database không
    $sql = "SELECT * FROM users WHERE email = '$email'";
    $result = mysqli_query($conn, $sql);
    
    if ($result && mysqli_num_rows($result) > 0) {
        // Tạo mật khẩu ngẫu nhiên
        $new_password = generateRandomPassword();
        
        // Mã hóa mật khẩu mới bằng MD5
        $hashed_password = md5($new_password);
        
        // Mã hóa mật khẩu mới
        $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);
        
        // Cập nhật mật khẩu mới vào database
        $update_sql = "UPDATE users SET password = '$hashed_password' WHERE email = '$email'";
        $update_result = mysqli_query($conn, $update_sql);
        
        if ($update_result) {
            // Gửi email với mật khẩu mới sử dụng PHPMailer
            $mail = new PHPMailer(true);
            try {
                // Cấu hình SMTP
                $mail->isSMTP();
                $mail->Host = 'smtp.gmail.com';
                $mail->SMTPAuth = true;
                $mail->Username = 'khiemnguyenviet.2004@gmail.com'; // Email của bạn
                $mail->Password = 'jjvdhaylgzytplsl'; // Mật khẩu ứng dụng Gmail
                $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;
                $mail->Port = 587;
                $mail->CharSet = 'UTF-8';

                // Người gửi và người nhận
                $mail->setFrom('khiemnguyenviet.2004@gmail.com', 'Mercedes-Benz');
                $mail->addAddress($email);

                // Nội dung email
                $mail->isHTML(true);
                $mail->Subject = 'Yêu cầu lấy lại mật khẩu';
                $mail->Body = "
                    <h2>Yêu cầu lấy lại mật khẩu</h2>
                    <p>Xin chào,</p>
                    <p>Mật khẩu mới của bạn là: <strong>{$new_password}</strong></p>
                    <p>Vui lòng đăng nhập và thay đổi mật khẩu mới để đảm bảo an toàn.</p>
                    <p>Trân trọng,<br>Mercedes-Benz</p>
                ";

                $mail->send();
                echo json_encode([
                    'success' => true,
                    'message' => 'Mật khẩu mới đã được gửi đến email của bạn!',
                    'redirect' => '../login.html'
                ]);
            } catch (Exception $e) {
                echo json_encode([
                    'success' => false,
                    'message' => 'Có lỗi xảy ra khi gửi email: ' . $mail->ErrorInfo,
                    'redirect' => '../forgot-password.html'
                ]);
            }
        } else {
            echo json_encode([
                'success' => false,
                'message' => 'Có lỗi xảy ra khi cập nhật mật khẩu!',
                'redirect' => '../forgot-password.html'
            ]);
        }
    } else {
        echo json_encode([
            'success' => false,
            'message' => 'Email không tồn tại trong hệ thống!',
            'redirect' => '../forgot-password.html'
        ]);
    }
} else {
    echo json_encode([
        'success' => false,
        'message' => 'Không nhận được dữ liệu hợp lệ.'
    ]);
}

// Hàm tạo mật khẩu ngẫu nhiên
function generateRandomPassword($length = 8) {
    $chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+';
    $password = '';
    for ($i = 0; $i < $length; $i++) {
        $password .= $chars[rand(0, strlen($chars) - 1)];
    }
    return $password;
}
?>
