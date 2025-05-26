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
                'list_users' => $class_cpanel->list_users($conn),
                'list_orders_car' => $class_cpanel->list_orders_car($conn),
                'add_product' => $skin->skin_normal('skin_adm/add_product'),
                'list_category' => $class_cpanel->list_category($conn)
        );
        // var_dump($replace['list_orders_car']);
        // die();
        echo $skin->skin_replace('skin_adm/index', $replace);
}
// Hiển thị template tương ứng

if ($action == "edit_product") {
        $id = (int)$_REQUEST['id'];
        $list_category = $class_cpanel->list_category($conn);
        $query = mysqli_query($conn, "SELECT products.*, categories.name as category_name, categories.id as category_id, product_details.id as product_detail_id, product_details.engine_type, product_details.displacement_cc, product_details.horsepower_hp, product_details.torque_nm, product_details.transmission_type, product_details.drive_type, product_details.fuel_consumption_l_100km, product_details.acceleration_0_100_s, product_details.length_mm, product_details.width_mm, product_details.height_mm, product_details.top_speed_kmh, product_details.interior_features, product_details.safety_features, product_details.color_options FROM products 
        LEFT JOIN categories ON products.category_id = categories.id 
        LEFT JOIN product_details ON products.id = product_details.product_id WHERE products.id = '$id'");
        $row = mysqli_fetch_assoc($query);
        $row['list_category'] = $list_category;
        $row['id'] = $row['id'];
        $row['name_featured'] = $row['featured'] == 1 ? 'Có' : 'Không';
        $row['price'] = number_format($row['price'], 0, ',', '.');
        echo $skin->skin_replace('skin_adm/edit_product', $row);
}
if ($action == "edit_user") {
        $id = (int)$_REQUEST['id'];
        $query = mysqli_query($conn, "SELECT * FROM users WHERE user_id = '$id' LIMIT 1");
        $user = mysqli_fetch_assoc($query);

        if (!$user) {
                $thongbao = "Không tìm thấy người dùng";
                $replace = array(
                        'title' => 'Không tìm thấy người dùng',
                        'description' => $index_setting['description'],
                        'thongbao' => $thongbao,
                        'link_chuyen' => '/admin/dashboard'
                );
                echo $skin->skin_replace('skin_cpanel/chuyenhuong', $replace);
                exit();
        }

        echo $skin->skin_replace('skin_adm/edit_user', $user);
}
