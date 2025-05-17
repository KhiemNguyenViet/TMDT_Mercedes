<?php
include('../includes/tlca_world.php');

$tlca_do = new class_manage();
$check = $tlca_do->load('class_check');
$class_cpanel = $tlca_do->load('class_cpanel');
$skin = $tlca_do->load('class_skin_cpanel');
$action = addslashes($_REQUEST['action']);


if ($action == "dashboard") {
    $replace = array(
        'header' => $skin->skin_normal('skin/header'),
        'footer' => $skin->skin_normal('skin/footer'),
        'list_product' => $class_cpanel->list_product($conn),
        'list_orders' => $class_cpanel->list_orders($conn),
        'list_orders_car' => $class_cpanel->list_orders_car($conn)
    );
    // var_dump($replace['list_orders_car']);
    // die();
    echo $skin->skin_replace('skin_adm/index', $replace);
}
// Hiển thị template tương ứng
