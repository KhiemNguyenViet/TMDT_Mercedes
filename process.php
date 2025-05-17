<?php
include('includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info=$class_member->user_info($conn,$_COOKIE['user_id']);
$action = addslashes($_REQUEST['action']);

if(isset($user_info['user_id']) && $user_info['user_id']>0){
    $header = $skin->skin_normal('skin_cpanel/headeruser');
}else{
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
                 AND status != 'cancelled'";
    $checkResult = $conn->query($checkSql);

    if($hientai > $thoigiankhachdat){
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
}

if ($action == "datcho") {
    $user_id=$user_info['user_id'] ?? 'NULL';
    $id = addslashes(strip_tags($_REQUEST['product_id']));
    $sql = "SELECT products.*, categories.name as category_name FROM products LEFT JOIN categories ON products.category_id = categories.id WHERE products.id = $id";
    $result = $conn->query($sql);
    $product = $result->fetch_assoc();
    $formatted_price = number_format($product['price'], 0, ',', '.') . ' VNĐ';
    $replace = array(
        'header' => $header,
        'footer' => $skin->skin_normal('skin/footer'),
        'product.id' => $product['id'],
        'product.name' => $product['name'],
        'product.price' => $formatted_price,
        'product.category_name' => $product['category_name'],
        'product.image' => $product['image'],
        'username' => $user_info['username'],
        'phone' => $user_info['phone'],
        'email' => $user_info['email'],
        'address' => $user_info['address'],
        'user_id' => $user_info['user_id'] ?? 'NULL'
    );
    echo $skin->skin_replace('skin/DatCho', $replace);
}

if ($action == "xacnhan_datcho") {
    $pay_note = addslashes(strip_tags($_REQUEST['pay_note']));
    $image_thanhtoan = addslashes(strip_tags($_REQUEST['image_thanhtoan']));
    $price = addslashes(strip_tags($_REQUEST['price']));
    $price = floatval(preg_replace('/[^0-9]/', '', $price));
    $salutation = addslashes(strip_tags($_REQUEST['salutation']));
    $user_id = addslashes(strip_tags($_REQUEST['user_id']));
    $product_id = addslashes(strip_tags($_REQUEST['product_id']));
    $username = addslashes(strip_tags($_REQUEST['username']));
    $phoneNumber = addslashes(strip_tags($_REQUEST['phoneNumber']));
    $email = addslashes(strip_tags($_REQUEST['email']));
    $address = addslashes(strip_tags($_REQUEST['address']));
    $bank_account_number = addslashes(strip_tags($_REQUEST['bank_account_number']));
    $bank_account_name = addslashes(strip_tags($_REQUEST['bank_account_name']));
    $bank_name = addslashes(strip_tags($_REQUEST['bank_name']));
    $bank_branch = addslashes(strip_tags($_REQUEST['bank_branch']));
    $dealer = addslashes(strip_tags($_REQUEST['dealer']));
    $sales_person = addslashes(strip_tags($_REQUEST['sales_person']));
    $hientai = date('Y-m-d H:i:s');
    $sql = "INSERT INTO orders (user_id, product_id, salutation, full_name, phone_number, email, contact_address, total_amount, deposit_amount, bank_account_number, bank_account_name, bank_name, bank_branch, dealer, sales_person, created_at, image_thanhtoan, payment_notes) 
            VALUES (" . ($user_id ? $user_id : "NULL") . ", '$product_id', '$salutation', '$username', '$phoneNumber', '$email', '$address', '$price', '10000000', '$bank_account_number', '$bank_account_name', '$bank_name', '$bank_branch', '$dealer', '$sales_person', '$hientai', '$image_thanhtoan', '$pay_note')";
    $result = $conn->query($sql);
    if ($result) {
        echo json_encode(array('ok' => 1, 'thongbao' => 'Đặt giữ chỗ xe thành công'));
    } else {
        echo json_encode(array('ok' => 0, 'thongbao' => 'Đặt giữ chỗ xe thất bại'));
    }
    
}
?>
