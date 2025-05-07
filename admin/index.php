<?php
include('../includes/tlca_world.php');
$check = $tlca_do->load('class_check');
$class_index=$tlca_do->load('class_cpanel');
$skin=$tlca_do->load('class_skin_cpanel');
$action = addslashes($_REQUEST['action']);
if ($action == "dashboard") {
    $replace = array(
        'header' => $skin->skin_normal('skin/header'),
        'footer' => $skin->skin_normal('skin/footer'),
    );
    echo $skin->skin_replace('skin_adm/index', $replace);
}

?>