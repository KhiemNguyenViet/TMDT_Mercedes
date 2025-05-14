<?php
include('../includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$action = addslashes($_REQUEST['action']);
if ($action == "dangnhap") {
	$username = addslashes(strip_tags($_REQUEST['username']));
	$password = addslashes($_REQUEST['password']);
	$ketqua = $class_member->login($conn, $username, $password, $remember, $role);
	if ($ketqua == 200) {
		$ok = 1;
		$thongbao = "Đăng nhập thành công";
	} else if ($ketqua == 24) {
		$ok = 24;
		$thongbao = "Mercedes xin chào quý khách";
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
	);
	echo json_encode($info);
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
