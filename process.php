<?php
include('includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info=$class_member->user_info($conn,$_COOKIE['user_id']);
$action = addslashes($_REQUEST['action']);
if ($action == "datlich") {
    $fullName = addslashes(strip_tags($_REQUEST['fullName']));
    $phoneNumber = addslashes(strip_tags($_REQUEST['phoneNumber']));
    $email = addslashes(strip_tags($_REQUEST['email']));
    $testDriveDate = addslashes(strip_tags($_REQUEST['testDriveDate']));
    $testDriveTime = addslashes(strip_tags($_REQUEST['testDriveTime']));
    $notes = addslashes(strip_tags($_REQUEST['notes']));
    $productId = addslashes(strip_tags($_REQUEST['productId']));
    $location = addslashes(strip_tags($_REQUEST['location']));
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
?>
