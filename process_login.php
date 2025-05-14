<?php
include('./includes/config.php');
if(isset($_COOKIE['user_id'])){
    $ok = 0;
    $thongbao = 'Thất bại! Bạn đã đăng nhập';
} else {
    function token_login($user_id,$password){
        $pass_1 = substr($password, 0,8);
        $pass_2 = substr($password, 8,8);
        $pass_3 = substr($password, 16,8);
        $pass_4 = substr($password, 24,8);
        $string = $pass_1.'-'.$pass_3.'-'.$pass_2.''.$user_id.'-'.$pass_2.'-'.$pass_4;
        $token_login = base64_encode($string);
        return $token_login;
    }

    $username = addslashes(strip_tags($_REQUEST['username']));
    $password = addslashes(strip_tags($_REQUEST['password']));
    $remember = addslashes($_REQUEST['remember']);

    // Kiểm tra độ dài username
    if(strlen($username) < 4) {
        $ok = 0;
        $thongbao = 'Tên đăng nhập phải từ 4 ký tự trở lên';
    } else {
        $thongtin = mysqli_query($conn,"SELECT *,count(*) AS total FROM users WHERE username='$username' ORDER BY user_id LIMIT 1");
        $r_tt = mysqli_fetch_assoc($thongtin);

        if($r_tt['total'] > 0) {
            $pass = md5($password);
            if($pass != $r_tt['password']) {
                $ok = 0;
                $thongbao = 'Mật khẩu không đúng';
            } else {
                // Đăng nhập thành công
                $hientai = time();
                if($remember == 'on') {
                    setcookie("user_id", token_login($r_tt['user_id'], $r_tt['password']), time() + 2593000, '/');
                } else {
                    setcookie("user_id", token_login($r_tt['user_id'], $r_tt['password']), time() + 3600, '/');
                }

                // Phân biệt role để trả về thông báo phù hợp
                if($r_tt['role'] == 'admin') {
                    $ok = 1;
                    $thongbao = 'Đăng nhập thành công';
                } else {
                    $ok = 2;
                    $thongbao = 'Mercedes xin chào quý khách';
                }
            }
        } else {
            $ok = 0;
            $thongbao = 'Tài khoản không tồn tại';
        }
    }
}

$info = array(
    'ok' => $ok,
    'thongbao' => $thongbao,
    'role' => isset($r_tt['role']) ? $r_tt['role'] : null
);

echo json_encode($info);
exit; 
?>