<?php
include('./includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index = $tlca_do->load('class_index');
$skin = $tlca_do->load('class_skin');
$class_member = $tlca_do->load('class_member');
$user_info=$class_member->user_info($conn,$_COOKIE['user_id']);

if (isset($user_info['user_id']) && $user_info['user_id'] > 0) {
    $header = $skin->skin_normal('skin_cpanel/headeruser');
} else {
    $header = $skin->skin_normal('skin/header');
    echo '<script>alert("Hãy đăng nhập để xem lịch lái thử");</script>';
    echo '<script>window.location.href = "/login.php";</script>';
    exit();
}

$list_lichlai = $class_index->list_lichlai($conn,$user_info['user_id']);
$replace = array(
    'header' => $header,
    'footer' => $skin->skin_normal('skin/footer'),
    'li_lichlai' => $list_lichlai,
);

echo $skin->skin_replace('skin/danhsach_laithu', $replace);
?>