<?php
include('includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info = $class_member->user_info($conn, $_COOKIE['user_id']);
$action = addslashes($_REQUEST['action']);

if (isset($user_info['user_id']) && $user_info['user_id'] > 0) {
    $thongtin_khachhang = $class_index->getThongTinKhachHang($conn, $user_info['user_id']);
    $header = $skin->skin_replace('skin_cpanel/headeruser', $thongtin_khachhang);
} else {
    $header = $skin->skin_normal('skin/header');
}
if ($action == "datlich") {
    $fullName = addslashes(strip_tags($_REQUEST['fullName']));
    $phoneNumber = addslashes(strip_tags($_REQUEST['phoneNumber']));
    $email = addslashes(strip_tags($_REQUEST['email']));
    $testDriveDate = addslashes(strip_tags($_REQUEST['testDriveDate']));
    $testDriveTime = addslashes(strip_tags($_REQUEST['testDriveTime']));
    $notes = addslashes(strip_tags($_REQUEST['notes']));
    $productId = addslashes(strip_tags($_REQUEST['productId']));
    $location = addslashes(strip_tags($_REQUEST['diadiem']));
    $hientai = date('Y-m-d H:i:s');
    $thoigiankhachdat = date('Y-m-d H:i:s', strtotime($testDriveDate . ' ' . $testDriveTime));
    // Kiểm tra trùng lịch
    $checkSql = "SELECT * FROM test_drives 
                 WHERE preferred_date = '$testDriveDate' 
                 AND preferred_time = '$testDriveTime' 
                 AND location = '$location' 
                 AND status != 'cancelled'
                 AND status != 'completed'";
    $checkResult = $conn->query($checkSql);

    if ($hientai > $thoigiankhachdat) {
        echo json_encode(array(
            'ok' => 0,
            'thongbao' => 'Thời gian này đã qua. Vui lòng chọn thời gian khác.',
            'trungLich' => true
        ));
        return;
    }

    $maxDate = date('Y-m-d', strtotime('+30 days'));
    if ($testDriveDate > $maxDate) {
        echo json_encode(array(
            'ok' => 0,
            'thongbao' => 'Vui lòng chọn ngày trong vòng 30 ngày tới.',
            'trungLich' => false
        ));
        return;
    }
    if ($checkResult->num_rows > 0) {
        echo json_encode(array(
            'ok' => 0,
            'thongbao' => 'Thời gian này đã có người đặt. Vui lòng chọn thời gian khác hoặc địa điểm khác.',
            'trungLich' => true
        ));
        return;
    }


    // Xử lý user_id
    $userId = null;
    if (isset($user_info['user_id'])) {
        $userId = $user_info['user_id'];
    }

    $sql = "INSERT INTO test_drives (user_id, full_name, phone_number, email, product_id, preferred_date, preferred_time, status, notes, location,created_at) 
            VALUES (" . ($userId ? $userId : "NULL") . ", '$fullName', '$phoneNumber', '$email', '$productId', '$testDriveDate', '$testDriveTime', 'pending', '$notes', '$location', '$hientai')";

    $result = $conn->query($sql);
    if ($result) {
        echo json_encode(array('ok' => 1, 'thongbao' => 'Đặt lịch lái thử xe thành công'));
    } else {
        echo json_encode(array('ok' => 0, 'thongbao' => 'Đặt lịch lái thử xe thất bại'));
    }
} else if ($action == "datcho") {
    $user_id = $user_info['user_id'] ?? 'NULL';
    $id = addslashes(strip_tags($_REQUEST['product_id']));
    $sql = "SELECT products.*, categories.name as category_name FROM products LEFT JOIN categories ON products.category_id = categories.id WHERE products.id = $id";
    $result = $conn->query($sql);
    $product = $result->fetch_assoc();
    $formatted_price = number_format($product['price'], 0, ',', '.') . ' VNĐ';
    $replace = array(
        'fullName' => $user_info['full_name'],
        'header' => $header,
        'footer' => $skin->skin_normal('skin/footer'),
        'product.id' => $product['id'],
        'product.name' => $product['name_car'],
        'product.price' => $formatted_price,
        'product.category_name' => $product['category_name'],
        'product.image' => $product['image_car'],
        'username' => $user_info['username'],
        'phone' => $user_info['phone'],
        'email' => $user_info['email'],
        'address' => $user_info['address'],
        'user_id' => $user_info['user_id'] ?? 'NULL'
    );
    echo $skin->skin_replace('skin/DatCho', $replace);
} else if ($action == "xacnhan_datcho") {
    error_log("Received request: " . print_r($_POST, true));
    error_log("Files: " . print_r($_FILES, true));
    if (isset($_FILES['payment_image']) && $_FILES['payment_image']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['payment_image']['tmp_name'];
        $fileName = $_FILES['payment_image']['name'];
        $fileNameCmps = explode(".", $fileName);
        $fileExtension = strtolower(end($fileNameCmps));

        // Tạo tên file mới
        $newFileName = time() . '_' . md5($fileName) . '.' . $fileExtension;
        $uploadFileDir = './uploads/';
        $dest_path = $uploadFileDir . $newFileName;

        if (move_uploaded_file($fileTmpPath, $dest_path)) {
            // Lấy các dữ liệu khác
            $pay_note = addslashes(strip_tags($_POST['pay_note']));
            $price = floatval(preg_replace('/[^0-9]/', '', $_POST['price']));
            $salutation = addslashes(strip_tags($_POST['salutation']));
            $user_id = addslashes(strip_tags($_POST['user_id']));
            $product_id = addslashes(strip_tags($_POST['product_id']));
            $username = addslashes(strip_tags($_POST['fullName']));
            $phoneNumber = addslashes(strip_tags($_POST['phoneNumber']));
            $email = addslashes(strip_tags($_POST['email']));
            $address = addslashes(strip_tags($_POST['address']));
            $bank_account_number = addslashes(strip_tags($_POST['bank_account_number']));
            $bank_account_name = addslashes(strip_tags($_POST['bank_account_name']));
            $bank_name = addslashes(strip_tags($_POST['bank_name']));
            $bank_branch = addslashes(strip_tags($_POST['bank_branch']));
            $dealer = addslashes(strip_tags($_POST['dealer']));
            $sales_person = addslashes(strip_tags($_POST['sales_person']));
            $hientai = date('Y-m-d H:i:s');

            // Insert vào database với tên file mới
            $sql = "INSERT INTO orders (
                user_id, product_id, salutation, full_name, phone_number, 
                email, contact_address, total_amount, deposit_amount, 
                bank_account_number, bank_account_name, bank_name, bank_branch, 
                dealer, sales_person, created_at, image_thanhtoan, payment_notes
            ) VALUES (
                " . ($user_id ? $user_id : "NULL") . ", 
                '$product_id', '$salutation', '$username', '$phoneNumber',
                '$email', '$address', '$price', '10000000',
                '$bank_account_number', '$bank_account_name', '$bank_name', '$bank_branch',
                '$dealer', '$sales_person', '$hientai', '$newFileName', '$pay_note'
            )";

            $result = $conn->query($sql);
            if ($result) {
                $update_stock = mysqli_query($conn, "UPDATE products SET stock = stock - 1 WHERE id = '$product_id'");
                if ($update_stock) {
                    echo json_encode(['ok' => 1, 'thongbao' => 'Đặt giữ chỗ xe thành công. Xin vui lòng quý khách kiểm tra email đợi nhận thông tin xử lý đơn hàng.']);
                } else {
                    echo json_encode(['ok' => 0, 'thongbao' => 'Đặt giữ chỗ xe thành công nhưng cập nhật lại số lượng xe thất bại: ' . $conn->error]);
                }
            } else {
                echo json_encode(['ok' => 0, 'thongbao' => 'Đặt giữ chỗ xe thất bại: ' . $conn->error]);
            }
        } else {
            echo json_encode(['ok' => 0, 'thongbao' => 'Không thể lưu file ảnh']);
        }
    } else {
        $uploadError = isset($_FILES['payment_image']) ? $_FILES['payment_image']['error'] : 'No file uploaded';
        error_log("Upload error: " . $uploadError);
        echo json_encode(['ok' => 0, 'thongbao' => 'Vui lòng chọn ảnh xác nhận chuyển khoản. Error: ' . $uploadError]);
    }
} else if ($action == "update_tk") {
    $avatarFileName = $_POST['current_avatar'] ?? null;

    if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
        $fileTmpPath = $_FILES['image']['tmp_name'];
        $fileName = $_FILES['image']['name'];
        $fileNameCmps = explode(".", $fileName);
        $fileExtension = strtolower(end($fileNameCmps));

        $uploadFileDir = $_SERVER['DOCUMENT_ROOT'] . '/uploads/';
        if (!is_dir($uploadFileDir)) {
            if (!mkdir($uploadFileDir, 0777, true)) {
                echo json_encode(['ok' => 0, 'message' => 'Không thể tạo thư mục uploads']);
                exit;
            }
        }

        $newFileName = time() . '_' . md5($fileName) . '.' . $fileExtension;
        $dest_path = $uploadFileDir . $newFileName;

        // Kiểm tra định dạng file
        $allowedTypes = array('jpg', 'jpeg', 'png', 'gif');
        if (!in_array($fileExtension, $allowedTypes)) {
            echo json_encode(['ok' => 0, 'message' => 'Chỉ chấp nhận file ảnh định dạng: ' . implode(', ', $allowedTypes)]);
            exit;
        }

        // Kiểm tra kích thước file (giới hạn 5MB)
        if ($_FILES['image']['size'] > 5 * 1024 * 1024) {
            echo json_encode(['ok' => 0, 'message' => 'Kích thước file không được vượt quá 5MB']);
            exit;
        }

        if (move_uploaded_file($fileTmpPath, $dest_path)) {
            $avatarFileName = $newFileName;
        } else {
            echo json_encode(['ok' => 0, 'message' => 'Không thể lưu file ảnh. Vui lòng kiểm tra quyền thư mục']);
            exit;
        }
    }

    $user_id = addslashes(strip_tags($_POST['user_id']));
    // Kiểm tra $user_id
    if (!isset($user_id)) {
        error_log("Debug: user_id không được định nghĩa");
        echo json_encode(['ok' => 0, 'thongbao' => 'user_id không hợp lệ']);
        exit;
    }

    // $user_info = $class_member->user_info($conn, $user_id);
    if (!$user_info || !isset($user_info['password'])) {
        error_log("Debug: Không lấy được user_info hoặc password");
        echo json_encode(['ok' => 0, 'thongbao' => 'Không lấy được thông tin người dùng']);
        exit;
    }
    $password_old = $user_info['password'];

    // Lấy và xử lý dữ liệu từ form
    
    $full_name = addslashes(strip_tags($_POST['full_name']));
    $email = addslashes(strip_tags($_POST['email']));
    $phone = addslashes(strip_tags($_POST['phone']));
    $address = addslashes(strip_tags($_POST['address']));
    $password = isset($_POST['password']) ? addslashes(strip_tags($_POST['password'])) : '';

    // Khởi tạo biến $doimk
    $doimk = false;

    // Debug: Kiểm tra giá trị $password
    error_log("Debug: password = '$password', password_old = '$password_old'");

    // Kiểm tra nếu có mật khẩu mới được nhập
    if (!empty($password)) {
        $password_hashed = md5($password);
        error_log("Debug: password_hashed = '$password_hashed'");
        if ($password_hashed != $password_old) {
            $doimk = true;
            $sql = "UPDATE users SET full_name = ?, email = ?, phone = ?, address = ?, avatar = ?, password = ? WHERE user_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssssss", $full_name, $email, $phone, $address, $avatarFileName, $password_hashed, $user_id);
        } else {
            $sql = "UPDATE users SET full_name = ?, email = ?, phone = ?, address = ?, avatar = ? WHERE user_id = ?";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("ssssss", $full_name, $email, $phone, $address, $avatarFileName, $user_id);
        }
    } else {
        $sql = "UPDATE users SET full_name = ?, email = ?, phone = ?, address = ?, avatar = ? WHERE user_id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("ssssss", $full_name, $email, $phone, $address, $avatarFileName, $user_id);
    }

    // Debug: Kiểm tra $doimk trước khi execute
    error_log("Debug: doimk = " . ($doimk ? 'true' : 'false'));

    $result = $stmt->execute();

    if ($result) {
        error_log("Debug: Cập nhật thành công, doimk = " . ($doimk ? 'true' : 'false'));
        if ($doimk) {
            echo json_encode(['ok' => 1, 'thongbao' => 'Cập nhật thông tin thành công. Vui lòng đăng nhập lại.', 'change_password' => true]);
        } else {
            echo json_encode(['ok' => 1, 'thongbao' => 'Cập nhật thông tin thành công', 'change_password' => false]);
        }
    } else {
        error_log("Debug: Cập nhật thất bại, SQL: $sql");
        echo json_encode(['ok' => 0, 'thongbao' => 'Cập nhật thông tin thất bại']);
    }
} else if ($action == "kh_cancel_lichlai") {
    $id = addslashes(strip_tags($_POST['id']));
    $status = addslashes(strip_tags($_POST['status']));
    $sql = "UPDATE test_drives SET status = '$status' WHERE id = '$id'";
    $result = $conn->query($sql);
    echo json_encode(['ok' => 1, 'thongbao' => 'Đã hủy yêu cầu hủy lịch lái thử xe. Xin vui lòng kiểm tra email đợi nhận thông tin xử lý lịch lái thử.']);
}
