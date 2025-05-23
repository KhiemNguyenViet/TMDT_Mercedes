<?php
    include('./includes/tlca_world.php');

    // Xử lý request
    $check = $tlca_do->load('class_check');
    $class_index = $tlca_do->load('class_index');
    $skin = $tlca_do->load('class_skin');
    $class_member = $tlca_do->load('class_member');
    $user_info=$class_member->user_info($conn,$_COOKIE['user_id']);
    $user_id = $user_info['user_id'];

    if($user_id == '' || $user_id == null){
        echo '<script>alert("Vui lòng đăng nhập để có lịch sử thanh toán"); window.location.href = "./login.php";</script>';
        exit();
    }

    $lichsu_thanhtoan = $class_index->list_lichsu_thanhtoan($conn, $user_id);
    // Lấy danh sách đơn hàng của user
    $sql = "SELECT o.*, p.name_car as product_name, p.image_car as product_image 
            FROM orders o 
            LEFT JOIN products p ON o.product_id = p.id 
            WHERE o.user_id = '$user_id' 
            ORDER BY o.created_at DESC";
    $result = $conn->query($sql);
    $orders = $result->fetch_assoc();

    if ($result->num_rows > 0) {
        $replace = array(
            'orders.id' => $orders['id'],
            'orders.salutation' => $orders['salutation'],
            'orders.full_name' => $orders['full_name'],
            'orders.phone_number' => $orders['phone_number'],
            'orders.email' => $orders['email'],
            'orders.contact_address' => $orders['contact_address'],
            'orders.dealer' => $orders['dealer'],
            'orders.sales_person' => $orders['sales_person'],
            'orders.image_thanhtoan' => $orders['image_thanhtoan'],
            'orders.payment_notes' => $orders['payment_notes'],
            'header' => $skin->skin_normal('skin_cpanel/headeruser'),
            'footer' => $skin->skin_normal('skin/footer'),
            'list_lichsu_thanhtoan' => $lichsu_thanhtoan
        );
    } else {
        echo '<script>alert("Vui lòng đăng nhập để có lịch sử thanh toán"); window.location.href = "./cacmauxe.html";</script>';
        exit();
    }

    echo $skin->skin_replace('skin/lichsu_thanhtoan', $replace);
?>