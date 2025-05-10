<?php
    include('./includes/tlca_world.php');

    // Xử lý request
    $check = $tlca_do->load('class_check');
    $class_index = $tlca_do->load('class_index');
    $skin = $tlca_do->load('class_skin');

    // Parse URL
    $param_url = parse_url($_SERVER['REQUEST_URI']);
    parse_str($param_url['query'] ?? '', $url_query);

    // Xử lý và hiển thị nội dung
    $replace = array(
        'header' => $skin->skin_normal('skin/header'),
        'footer' => $skin->skin_normal('skin/footer'),
    );

    echo $skin->skin_replace('skin/ThuongHieu', $replace);
?>