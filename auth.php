<?php
include('./includes/tlca_world.php');

/**
 * Giải mã token từ cookie để lấy user_id
 * @param string $token Token từ cookie
 * @return int|null user_id nếu hợp lệ, null nếu không
 */
function decodeToken($conn, $token) {
    if (!$token) {
        return null;
    }

    // Giải mã token (base64)
    $decoded = base64_decode($token);
    if (!$decoded) {
        return null;
    }

    // Token có định dạng: pass_1-pass_3-pass_2user_id-pass_2-pass_4
    $parts = explode('-', $decoded);
    if (count($parts) !== 5) {
        return null;
    }

    // Lấy user_id từ phần pass_2user_id
    $user_id_part = $parts[2];
    $user_id = (int)preg_replace('/[^0-9]/', '', $user_id_part);
    if (!$user_id) {
        return null;
    }

    // Kiểm tra user_id trong cơ sở dữ liệu
    $sql = "SELECT user_id, password FROM users WHERE user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        return null;
    }

    $user = $result->fetch_assoc();
    // Tái tạo token để kiểm tra
    $pass_1 = substr($user['password'], 0, 8);
    $pass_2 = substr($user['password'], 8, 8);
    $pass_3 = substr($user['password'], 16, 8);
    $pass_4 = substr($user['password'], 24, 8);
    $expected_token = base64_encode("$pass_1-$pass_3-$pass_2$user_id-$pass_2-$pass_4");

    return ($token === $expected_token) ? $user_id : null;
}

/**
 * Lấy vai trò của người dùng
 * @param mysqli $conn Kết nối cơ sở dữ liệu
 * @param int|null $user_id ID người dùng
 * @return string Vai trò (admin, user, guest)
 */
function getUserRole($conn, $user_id) {
    if (!$user_id) {
        return 'guest';
    }

    $sql = "SELECT role FROM users WHERE user_id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 0) {
        return 'guest';
    }

    return $result->fetch_assoc()['role'] ?? 'guest';
}

/**
 * Kiểm tra quyền truy cập
 * @param mysqli $conn Kết nối cơ sở dữ liệu
 * @param int|null $user_id ID người dùng
 * @param string $permission Quyền cần kiểm tra
 * @return bool True nếu có quyền, False nếu không
 */
function hasPermission($conn, $user_id, $permission) {
    $role = getUserRole($conn, $user_id);
    $permissions = [
        'admin' => [
            'access_dashboard',
            'manage_bookings',
            'manage_users',
            'book_test_drive',
            'view_own_bookings',
        ],
        'user' => [
            'book_test_drive',
            'view_own_bookings',
        ],
        'guest' => [],
    ];

    return in_array($permission, $permissions[$role] ?? []);
}
?>