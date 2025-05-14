<?php
include('../includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index=$tlca_do->load('class_cpanel');
$skin=$tlca_do->load('class_skin_cpanel');
$action = addslashes($_REQUEST['action']);

$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;
if (!$user_id && isset($_COOKIE['user_id'])) {
    $user_id = decodeToken($conn, $_COOKIE['user_id']);
    if ($user_id) {
        $_SESSION['user_id'] = $user_id;
    }
}

if ($action == "dashboard") {
    $replace = array(
        'header' => $skin->skin_normal('skin/header'),
        'footer' => $skin->skin_normal('skin/footer'),
    );
    echo $skin->skin_replace('skin_adm/index', $replace);
}

?>