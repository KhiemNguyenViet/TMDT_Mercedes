<?php
include('../includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$action = addslashes($_REQUEST['action']);

if ($action == "dangnhap") {
	$username = addslashes(strip_tags($_REQUEST['username']));
	$password = addslashes($_REQUEST['password']);
	$ketqua = $class_member->login($conn, $username, $password, $remember);
	if (is_array($ketqua) && $ketqua['status'] == 200) {
		$ok = 1;
		$thongbao = "Đăng nhập thành công";
	}else if ($ketqua == 0) {
		$ok = 0;
		$thongbao = "Vui lòng nhập username";
	} else if ($ketqua == 1) {
		$ok = 0;
		$thongbao = "Tài khoản không tồn tại";
	} else if ($ketqua == 2) {
		$ok = 0;
		$thongbao = "Mật khẩu không chính xác";
	} else {
		$ok = 0;
		$thongbao = "Gặp lỗi khi xử lý";
	}
	$info = array(
		'ok' => $ok,
		'thongbao' => $thongbao,
		'role' => $role ?? null
	);
	echo json_encode($info);
}
if ($action == "update_test_drive_status") {
	// Validate input
	$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;
	$status = isset($_POST['status']) ? $_POST['status'] : '';

	// Validate id
	if ($id <= 0) {
		echo json_encode([
			'success' => false,
			'message' => 'ID không hợp lệ'
		]);
		exit;
	}

	// Only allow completed or cancelled
	$allowed_statuses = ['confirmed','completed', 'cancelled'];
	if (!in_array($status, $allowed_statuses)) {
		echo json_encode([
			'success' => false,
			'message' => 'Trạng thái không hợp lệ'
		]);
		exit;
	}

	// Update status in database
	$query = "UPDATE test_drives 
             SET status = '$status'
             WHERE id = $id";

	if (mysqli_query($conn, $query)) {
		echo json_encode([
			'success' => true,
			'message' => 'Cập nhật trạng thái thành công'
		]);
	} else {
		echo json_encode([
			'success' => false,
			'message' => 'Lỗi cập nhật: ' . mysqli_error($conn)
		]);
	}
	exit;
}else if ($action == "update_order_status") {
	// Validate input
	$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;
	$status = isset($_POST['status']) ? $_POST['status'] : '';

	// Validate id
	if ($id <= 0) {
		echo json_encode([
			'success' => false,
			'message' => 'ID không hợp lệ'
		]);
		exit;
	}

	// Only allow completed or cancelled
	$allowed_statuses = ['processing','completed', 'cancelled'];
	if (!in_array($status, $allowed_statuses)) {
		echo json_encode([
			'success' => false,
			'message' => 'Trạng thái không hợp lệ'
		]);
		exit;
	}

	// Update status in database
	$query = "UPDATE orders 
             SET status = '$status'
             WHERE id = $id";

	if (mysqli_query($conn, $query)) {
		echo json_encode([
			'success' => true,
			'message' => 'Cập nhật trạng thái thành công'
		]);
	} else {
		echo json_encode([
			'success' => false,
			'message' => 'Lỗi cập nhật: ' . mysqli_error($conn)
		]);
	}
	exit;
}
switch ($action) {
	case 'edit_product':
		$id = (int)$_POST['id'];
		echo $cpanel->edit_product($conn, $id);
		break;

	case 'update_product':
		echo $cpanel->update_product($conn, $_POST);
		break;

	default:
		echo "Invalid action";
}
