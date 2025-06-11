<?php
setcookie("user_id",$_COOKIE['user_id'],time() - 3600,'/');
include('./includes/tlca_world.php');
$check=$tlca_do->load('class_check');
$skin=$tlca_do->load('class_skin');
$class_index=$tlca_do->load('class_index');
$thongbao="Đăng xuất thành công.";

// Kiểm tra nếu có tham số redirect
$redirect = isset($_GET['redirect']) ? $_GET['redirect'] : '';

if($redirect == 'login') {
    $replace=array(
        'header'=>$skin->skin_normal('skin/header'),
        'title'=>'Đăng xuất thành công',
        'thongbao'=>$thongbao,
        'link'=>'login.html'
    );
    echo $skin->skin_replace('skin/chuyenhuong',$replace);
} else if($redirect == 'capnhat') {
    $replace=array(
        'header'=>$skin->skin_normal('skin/header'),
        'title'=>'Cập nhật thông tin thành công',
        'thongbao'=>$thongbao,
        'link'=>'account.html'
    );
    echo $skin->skin_replace('skin/chuyenhuong',$replace);
} else {
    $replace=array(
        'header'=>$skin->skin_normal('skin/header'),
        'title'=>'Đăng xuất thành công',
        'thongbao'=>$thongbao,
        'link'=>'/'
    );
    echo $skin->skin_replace('skin/chuyenhuong',$replace);
}
?>