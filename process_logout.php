<?php
setcookie("user_id",$_COOKIE['user_id'],time() - 3600,'/');
include('./includes/tlca_world.php');
$check=$tlca_do->load('class_check');
$skin=$tlca_do->load('class_skin');
$class_index=$tlca_do->load('class_index');
$thongbao="Đăng xuất thành công.";
$replace=array(
	'header'=>$skin->skin_normal('skin/header'),
	'title'=>'Đăng xuất thành công',
	'thongbao'=>$thongbao,
	'link'=>'/'
);
echo $skin->skin_replace('skin/chuyenhuong',$replace);
?>