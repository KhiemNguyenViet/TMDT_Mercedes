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
	} else if ($ketqua == 0) {
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
if ($action == 'delete_product') {
	$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;

	mysqli_begin_transaction($conn);

	try {
		$check_stmt = mysqli_prepare($conn, "SELECT COUNT(*) as total FROM products WHERE id = ?");
		mysqli_stmt_bind_param($check_stmt, "i", $id);
		mysqli_stmt_execute($check_stmt);
		$result = mysqli_stmt_get_result($check_stmt);
		$row = mysqli_fetch_assoc($result);

		if ($row['total'] == 0) {
			$ok = 0;
			$message = 'Không tìm thấy sản phẩm';
		} else {
			$delete_details_stmt = mysqli_prepare($conn, "DELETE FROM product_details WHERE product_id = ?");
			mysqli_stmt_bind_param($delete_details_stmt, "i", $id);
			mysqli_stmt_execute($delete_details_stmt);

			$delete_product_stmt = mysqli_prepare($conn, "DELETE FROM products WHERE id = ?");
			mysqli_stmt_bind_param($delete_product_stmt, "i", $id);
			mysqli_stmt_execute($delete_product_stmt);

			$ok = 1;
			$message = 'Xóa sản phẩm thành công';
		}

		mysqli_commit($conn);
	} catch (Exception $e) {
		mysqli_rollback($conn);
		$ok = 0;
		$message = 'Lỗi: ' . $e->getMessage();
	}

	ob_end_clean();
	echo json_encode(['ok' => $ok, 'message' => $message]);
	exit;
}
if ($action == 'delete_user') {
	$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;

	$check_query = mysqli_query($conn, "SELECT COUNT(*) as total FROM users WHERE user_id='$id' AND role='user'");
	$result = mysqli_fetch_assoc($check_query);

	if ($result['total'] == 0) {
		$ok = 0;
		$message = 'Không tìm thấy người dùng hoặc không có quyền xóa';
	} else {
		if (mysqli_query($conn, "DELETE FROM users WHERE user_id='$id' AND role='user'")) {
			$ok = 1;
			$message = 'Xóa người dùng thành công';
		} else {
			$ok = 0;
			$message = 'Lỗi khi xóa người dùng';
		}
	}

	ob_end_clean();
	echo json_encode([
		'ok' => $ok,
		'message' => $message
	]);
	exit;
}
