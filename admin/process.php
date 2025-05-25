<?php
include('../includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$action = addslashes($_REQUEST['action']);

// Thêm hàm uploadImage ở đầu file, sau phần include
// function uploadImage($file)
// {
// 	$target_dir = "../uploads/";
// 	$file_extension = strtolower(pathinfo($file['name'], PATHINFO_EXTENSION));
// 	$new_filename = uniqid() . '.' . $file_extension; // Tạo tên file ngẫu nhiên
// 	$target_file = $target_dir . $new_filename;

// 	// Kiểm tra loại file
// 	$allowed_types = array('jpg', 'jpeg', 'png', 'gif');
// 	if (!in_array($file_extension, $allowed_types)) {
// 		die("Chỉ chấp nhận file ảnh JPG, JPEG, PNG và GIF.");
// 	}

// 	// Kiểm tra kích thước file (giới hạn 5MB)
// 	if ($file['size'] > 5000000) {
// 		die("File quá lớn. Vui lòng chọn file nhỏ hơn 5MB.");
// 	}

// 	// Upload file
// 	if (move_uploaded_file($file['tmp_name'], $target_file)) {
// 		return $new_filename;
// 	} else {
// 		die("Có lỗi xảy ra khi upload file.");
// 	}
// }

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
} else if ($action == "update_test_drive_status") {
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
	$allowed_statuses = ['confirmed', 'completed', 'cancelled'];
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
} else if ($action == "update_order_status") {
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
	$allowed_statuses = ['processing', 'completed', 'cancelled'];
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
		// Nếu status là cancelled thì cập nhật lại stock
		if ($status == 'cancelled') {
			// Lấy thông tin product_id từ order
			$get_order = mysqli_query($conn, "SELECT product_id FROM orders WHERE id = $id");
			if ($order = mysqli_fetch_assoc($get_order)) {
				$product_id = $order['product_id'];
				// Cập nhật lại stock
				$update_stock = mysqli_query($conn, "UPDATE products SET stock = stock + 1 WHERE id = $product_id");
				if (!$update_stock) {
					echo json_encode([
						'success' => false,
						'message' => 'Lỗi cập nhật số lượng tồn kho: ' . mysqli_error($conn)
					]);
					exit;
				}
			}
		}

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
} else if ($action == 'delete_product') {
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
} else if ($action == 'delete_user') {
	// Get and validate ID
	$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;
	if ($id <= 0) {
		ob_end_clean();
		echo json_encode([
			'ok' => 0,
			'message' => 'ID người dùng không hợp lệ'
		]);
		exit;
	}

	// Ensure database connection
	if (!$conn) {
		ob_end_clean();
		echo json_encode([
			'ok' => 0,
			'message' => 'Lỗi kết nối cơ sở dữ liệu'
		]);
		exit;
	}

	// Check if user exists
	$stmt = $conn->prepare("SELECT COUNT(*) as total FROM users WHERE user_id = ?");
	$stmt->bind_param("i", $id);
	if (!$stmt->execute()) {
		$stmt->close();
		$conn->close();
		ob_end_clean();
		echo json_encode([
			'ok' => 0,
			'message' => 'Lỗi truy vấn kiểm tra: ' . $conn->error
		]);
		exit;
	}
	$result = $stmt->get_result()->fetch_assoc();
	error_log("User ID: $id, Total: " . $result['total']);

	if ($result['total'] == 0) {
		$stmt->close();
		$conn->close();
		ob_end_clean();
		echo json_encode([
			'ok' => 0,
			'message' => 'Không tìm thấy người dùng'
		]);
		exit;
	}

	$stmt = $conn->prepare("DELETE FROM users WHERE user_id = ?");
	$stmt->bind_param("i", $id);
	if ($stmt->execute()) {
		$affected_rows = $stmt->affected_rows;
		$stmt->close();
		$conn->close();
		ob_end_clean();
		echo json_encode([
			'ok' => $affected_rows > 0 ? 1 : 0,
			'message' => $affected_rows > 0 ? 'Xóa người dùng thành công' : 'Không có người dùng nào bị xóa'
		]);
		exit;
	} else {
		$error = $conn->error;
		$stmt->close();
		$conn->close();
		ob_end_clean();
		echo json_encode([
			'ok' => 0,
			'message' => 'Lỗi khi xóa người dùng: ' . $error
		]);
		exit;
	}
} else if ($action == 'update_product') {
	if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
		$fileTmpPath = $_FILES['image']['tmp_name'];
		$fileName = $_FILES['image']['name'];
		$fileNameCmps = explode(".", $fileName);
		$fileExtension = strtolower(end($fileNameCmps));

		// Tạo tên file mới
		// Kiểm tra và tạo thư mục nếu chưa tồn tại		
		$uploadFileDir = '../uploads/';
		if (!file_exists($uploadFileDir)) {
			mkdir($uploadFileDir, 0777, true);
		}
		// Tạo tên file mới và đường dẫn đầy đủ		
		$newFileName = time() . '_' . md5($fileName) . '.' . $fileExtension;
		$dest_path = $uploadFileDir . $newFileName;
		// Kiểm tra định dạng file		
		$allowedTypes = array('jpg', 'jpeg', 'png', 'gif', 'avif');
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
			$id = isset($_POST['id']) ? (int)$_POST['id'] : 0;
			$name_product = addslashes(strip_tags($_REQUEST['name_product'])) ?? 'Đang cập nhật...';
			$category_id = addslashes(strip_tags($_REQUEST['category_id'])) ?? 0;
			$price = str_replace([',', '.'], '', $_REQUEST['price']);
			$price = (float)$price;
			$stock = addslashes(strip_tags($_REQUEST['stock'])) ?? 0;
			$description = addslashes(strip_tags($_REQUEST['description'])) ?? 'Đang cập nhật...';
			$featured = addslashes(strip_tags($_REQUEST['featured'])) ?? 0;
			$engine_type = addslashes(strip_tags($_REQUEST['engine_type'])) ?? 'Đang cập nhật...';
			$displacement_cc = addslashes(strip_tags($_REQUEST['displacement_cc'])) ?? 0;
			$horsepower_hp = addslashes(strip_tags($_REQUEST['horsepower_hp'])) ?? 0;
			$torque_nm = addslashes(strip_tags($_REQUEST['torque_nm'])) ?? 0;
			$transmission_type = addslashes(strip_tags($_REQUEST['transmission_type'])) ?? 'Đang cập nhật...';
			$drive_type = addslashes(strip_tags($_REQUEST['drive_type'])) ?? 'Đang cập nhật...';
			$fuel_consumption_l_100km = addslashes(strip_tags($_REQUEST['fuel_consumption_l_100km'])) ?? 0;
			$acceleration_0_100_s = addslashes(strip_tags($_REQUEST['acceleration_0_100_s'])) ?? 0;
			$length_mm = addslashes(strip_tags($_REQUEST['length_mm'])) ?? 0;
			$width_mm = addslashes(strip_tags($_REQUEST['width_mm'])) ?? 0;
			$height_mm = addslashes(strip_tags($_REQUEST['height_mm'])) ?? 0;
			$top_speed_kmh = addslashes(strip_tags($_REQUEST['top_speed_kmh'])) ?? 0;
			$interior_features = addslashes(strip_tags($_REQUEST['interior_features'])) ?? 'Đang cập nhật...';
			$safety_features = addslashes(strip_tags($_REQUEST['safety_features'])) ?? 'Đang cập nhật...';
			$color_options = addslashes(strip_tags($_REQUEST['color_options'])) ?? 'Đang cập nhật...';

			$query_product = "UPDATE products
    SET name_car = '$name_product',         
    category_id = '$category_id',         
    price = '$price',         
    stock = '$stock',         
    description_car = '$description',         
    image_car = '$newFileName',
    featured = '$featured'
    WHERE id = '$id'";
			$result_product = mysqli_query($conn, $query_product);
			if ($result_product) {
				$query_detail = "UPDATE product_details 
             SET engine_type = '$engine_type',
                 displacement_cc = '$displacement_cc',
                 horsepower_hp = '$horsepower_hp',
                 torque_nm = '$torque_nm',
                 transmission_type = '$transmission_type',
                 drive_type = '$drive_type',
                 fuel_consumption_l_100km = '$fuel_consumption_l_100km',
                 acceleration_0_100_s = '$acceleration_0_100_s',
                 length_mm = '$length_mm',
                 width_mm = '$width_mm',
                 height_mm = '$height_mm',
                 top_speed_kmh = '$top_speed_kmh',
                 interior_features = '$interior_features',
                 safety_features = '$safety_features',
                 color_options = '$color_options'
             WHERE id = '$id'";
				$result_detail = mysqli_query($conn, $query_detail);
				if ($result_detail) {
					$ok = 1;
					$message = 'Cập nhật sản phẩm thành công';
				} else {
					$ok = 0;
					$message = 'Lỗi cập nhật chi tiết sản phẩm';
				}
			} else {
				$ok = 0;
				$message = 'Lỗi cập nhật sản phẩm';
			}
			echo json_encode([
				'ok' => $ok,
				'message' => $message
			]);
		} else {
			echo json_encode(['ok' => 0, 'message' => 'Không thể lưu file ảnh']);
		}
	} else {
		$uploadError = isset($_FILES['image']) ? $_FILES['image']['error'] : 'No file uploaded';
		error_log("Upload error: " . $uploadError);
		echo json_encode(['ok' => 0, 'message' => 'Vui lòng chọn ảnh sản phẩm. Error: ' . $uploadError]);
	}
} else if ($action === 'update_user') {
	$user_id = isset($_POST['id']) ? (int)$_POST['id'] : 0;
	$full_name = mysqli_real_escape_string($conn, $_POST['full_name']);
	$phone = mysqli_real_escape_string($conn, $_POST['phone']);
	$email = mysqli_real_escape_string($conn, $_POST['email']);
	$username = mysqli_real_escape_string($conn, $_POST['username']);
	$address = mysqli_real_escape_string($conn, $_POST['address']);

	// Validate inputs
	if (empty($full_name) || empty($email) || empty($username)) {
		echo json_encode([
			'ok' => 0,
			'message' => 'Vui lòng điền đầy đủ thông tin bắt buộc'
		]);
		exit;
	}

	// Check if user exists
	$check = mysqli_query($conn, "SELECT user_id FROM users WHERE user_id = '$user_id'");
	if (mysqli_num_rows($check) == 0) {
		echo json_encode([
			'ok' => 0,
			'message' => 'Không tìm thấy người dùng'
		]);
		exit;
	}

	// Update user information
	$query = "UPDATE users SET 
        full_name = '$full_name',
        phone = '$phone',
        email = '$email',
        username = '$username',
        address = '$address'
        WHERE user_id = '$user_id'";

	if (mysqli_query($conn, $query)) {
		echo json_encode([
			'ok' => 1,
			'message' => 'Cập nhật thành công'
		]);
	} else {
		echo json_encode([
			'ok' => 0,
			'message' => 'Lỗi cập nhật: ' . mysqli_error($conn)
		]);
	}
	exit;
} else if ($action == 'add_product') {
	if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
		$fileTmpPath = $_FILES['image']['tmp_name'];
		$fileName = $_FILES['image']['name'];
		$fileNameCmps = explode(".", $fileName);
		$fileExtension = strtolower(end($fileNameCmps));

		// Tạo tên file mới
		$uploadFileDir = '../uploads/';
		if (!file_exists($uploadFileDir)) {
			mkdir($uploadFileDir, 0777, true);
		}

		// Tạo tên file mới và đường dẫn đầy đủ		
		$newFileName = time() . '_' . md5($fileName) . '.' . $fileExtension;
		$dest_path = $uploadFileDir . $newFileName;

		// Kiểm tra định dạng file		
		$allowedTypes = array('jpg', 'jpeg', 'png', 'gif', 'avif');
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
			// Lấy và xử lý các giá trị đầu vào
			$name_product = addslashes(strip_tags($_REQUEST['name_product'])) ?? 'Đang cập nhật...';
			$category_id = intval($_REQUEST['category_id']) ?? 0; // Chuyển thành số nguyên
			$price = floatval(preg_replace('/[^\d.]/', '', $_REQUEST['price'])) ?? 0; // Lấy giá trị price
			$stock = intval($_REQUEST['stock']) ?? 0; // Chuyển thành số nguyên
			$description = addslashes(strip_tags($_REQUEST['description'])) ?? 'Đang cập nhật...';
			$featured = intval($_REQUEST['featured']) ?? 0; // Chuyển thành số nguyên
			$engine_type = addslashes(strip_tags($_REQUEST['engine_type'])) ?? 'Đang cập nhật...';
			$displacement_cc = intval($_REQUEST['displacement_cc']) ?? 0; // Chuyển thành số nguyên
			$horsepower_hp = intval($_REQUEST['horsepower_hp']) ?? 0; // Chuyển thành số nguyên
			$torque_nm = intval($_REQUEST['torque_nm']) ?? 0; // Chuyển thành số nguyên
			$transmission_type = addslashes(strip_tags($_REQUEST['transmission_type'])) ?? 'Đang cập nhật...';
			$drive_type = addslashes(strip_tags($_REQUEST['drive_type'])) ?? 'Đang cập nhật...';
			$fuel_consumption_l_100km = floatval($_REQUEST['fuel_consumption_l_100km']) ?? 0; // Lấy giá trị
			$acceleration_0_100_s = floatval($_REQUEST['acceleration_0_100_s']) ?? 0; // Lấy giá trị
			$length_mm = intval($_REQUEST['length_mm']) ?? 0; // Chuyển thành số nguyên
			$width_mm = intval($_REQUEST['width_mm']) ?? 0; // Chuyển thành số nguyên
			$height_mm = intval($_REQUEST['height_mm']) ?? 0; // Chuyển thành số nguyên
			$top_speed_kmh = intval($_REQUEST['top_speed_kmh']) ?? 0; // Chuyển thành số nguyên
			$interior_features = addslashes(strip_tags($_REQUEST['interior_features'])) ?? 'Đang cập nhật...';
			$safety_features = addslashes(strip_tags($_REQUEST['safety_features'])) ?? 'Đang cập nhật...';
			$color_options = addslashes(strip_tags($_REQUEST['color_options'])) ?? 'Đang cập nhật...';

			// var_dump($name_product, $category_id, $price, $stock, $description, $newFileName, $featured, $engine_type, $displacement_cc, $horsepower_hp, $torque_nm, $transmission_type, $drive_type, $fuel_consumption_l_100km, $acceleration_0_100_s, $length_mm, $width_mm, $height_mm, $top_speed_kmh, $interior_features, $safety_features, $color_options);
			// die();
			// Câu lệnh SQL để thêm sản phẩm
			$query_product = "INSERT INTO products (name_car, category_id, price, stock, description_car, image_car, featured)
				VALUES ('$name_product', '$category_id', '$price', '$stock', '$description', '$newFileName', '$featured')";

			$result_product = mysqli_query($conn, $query_product);
			if ($result_product) {
				// Lấy ID sản phẩm vừa thêm
				$product_id = mysqli_insert_id($conn);

				// Câu lệnh SQL để thêm chi tiết sản phẩm
				$query_detail = "INSERT INTO product_details (product_id, engine_type, displacement_cc, horsepower_hp, torque_nm, transmission_type, drive_type, fuel_consumption_l_100km, acceleration_0_100_s, length_mm, width_mm, height_mm, top_speed_kmh, interior_features, safety_features, color_options)
					VALUES ('$product_id', '$engine_type', '$displacement_cc', '$horsepower_hp', '$torque_nm', '$transmission_type', '$drive_type', '$fuel_consumption_l_100km', '$acceleration_0_100_s', '$length_mm', '$width_mm', '$height_mm', '$top_speed_kmh', '$interior_features', '$safety_features', '$color_options')";

				$result_detail = mysqli_query($conn, $query_detail);
				if ($result_detail) {
					echo json_encode(['ok' => 1, 'message' => 'Thêm sản phẩm thành công']);
				} else {
					echo json_encode(['ok' => 0, 'message' => 'Lỗi thêm chi tiết sản phẩm']);
				}
			} else {
				echo json_encode(['ok' => 0, 'message' => 'Lỗi thêm sản phẩm']);
			}
		} else {
			echo json_encode(['ok' => 0, 'message' => 'Không thể lưu file ảnh']);
		}
	} else {
		$uploadError = isset($_FILES['image']) ? $_FILES['image']['error'] : 'No file uploaded';
		error_log("Upload error: " . $uploadError);
		echo json_encode(['ok' => 0, 'message' => 'Vui lòng chọn ảnh sản phẩm. Error: ' . $uploadError]);
	}
}
