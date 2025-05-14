<?php
include('../includes/tlca_world.php');

$tlca_do = new class_manage();
$check = $tlca_do->load('class_check');
$cpanel = $tlca_do->load('class_cpanel');
$skin = $tlca_do->load('class_skin_cpanel');
$class_cpanel = $tlca_do->load('class_cpanel');
$skin = $tlca_do->load('class_skin_cpanel');

$action = isset($_GET['action']) ? $_GET['action'] : 'dashboard';
$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;

if ($action == "dashboard") {
    $replace = array(
        'header' => $skin->skin_normal('skin/header'),
        'footer' => $skin->skin_normal('skin/footer'),
        'list_product' => $class_cpanel->list_product($conn),
    );
    echo $skin->skin_replace('skin_adm/index', $replace);
}
// Hiển thị template tương ứng
echo $skin->skin_replace($template, $thaythe);
