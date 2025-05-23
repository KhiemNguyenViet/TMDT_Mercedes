<?php
    include('./includes/tlca_world.php');

    // Xử lý request
    $check = $tlca_do->load('class_check');
    $class_index = $tlca_do->load('class_index');
    $skin = $tlca_do->load('class_skin');
    $class_member = $tlca_do->load('class_member');
    $user_info=$class_member->user_info($conn,$_COOKIE['user_id']);

    $user_info = $class_member->user_info($conn, $_COOKIE['user_id']);
    $user_id = $user_info['user_id'];

    // Lấy danh sách đơn hàng của user
    $sql = "SELECT o.*, p.name as product_name, p.image as product_image 
            FROM orders o 
            LEFT JOIN products p ON o.product_id = p.id 
            WHERE o.user_id = '$user_id' 
            ORDER BY o.created_at DESC";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $orders = array();
        while ($row = $result->fetch_assoc()) {
            // Format số tiền
            $row['total_amount'] = number_format($row['total_amount'], 0, ',', '.');
            $row['deposit_amount'] = number_format($row['deposit_amount'], 0, ',', '.');
            
            // Format ngày tháng
            $row['created_at'] = date('d/m/Y H:i', strtotime($row['created_at']));
            
            $orders[] = $row;
        }
        
        $replace = array(
            'header' => $skin->skin_normal('skin_cpanel/headeruser'),
            'footer' => $skin->skin_normal('skin/footer')
        );
        
        foreach ($orders as $order) {
            $replace['orders'][] = array(
                'id' => $order['id'],
                'product_id' => $order['product_id'],
                'product_name' => $order['product_name'],
                'product_image' => $order['product_image'],
                'total_amount' => $order['total_amount'],
                'deposit_amount' => $order['deposit_amount'],
                'bank_name' => $order['bank_name'],
                'bank_branch' => $order['bank_branch'],
                'bank_account_number' => $order['bank_account_number'],
                'bank_account_name' => $order['bank_account_name'],
                'created_at' => $order['created_at'],
                'status' => $order['status'],
                'salutation' => $order['salutation'],
                'full_name' => $order['full_name'],
                'phone_number' => $order['phone_number'],
                'email' => $order['email'],
                'contact_address' => $order['contact_address'],
                'dealer' => $order['dealer'],
                'sales_person' => $order['sales_person'],
                'image_thanhtoan' => $order['image_thanhtoan'],
                'payment_notes' => $order['payment_notes'],
                'status_' . $order['status'] => true
            );
        }
    } else {
        $replace = array(
            'header' => $skin->skin_normal('skin_cpanel/headeruser'),
            'footer' => $skin->skin_normal('skin/footer'),
            'no_orders' => true
        );
    }

    echo $skin->skin_replace('skin/lichsu_thanhtoan', $replace);
?>