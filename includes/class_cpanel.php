<?php

class class_cpanel extends class_manage
{
    ///////////////////////////////////
    function list_product($conn)
    {
        $skin = $this->load('class_skin_cpanel');

        $query = mysqli_query($conn, "SELECT p.id, p.name, p.price, p.description, p.image, p.stock 
                                 FROM products p 
                                 ORDER BY p.id DESC");
        $list = '';

        while ($row = mysqli_fetch_assoc($query)) {
            // Format giá tiền
            $row['price'] = number_format($row['price'], 0, ',', '.') . ' VNĐ';

            $list .= $skin->skin_replace('skin_adm/box_li/li_product', array(
                'id' => $row['id'],
                'name' => $row['name'],
                'price' => $row['price'],
                'description' => $row['description'],
                'stock' => $row['stock'],
                'image' => $row['image']
            ));
        }

        return $skin->skin_replace('skin_adm/box_li/list_product', array(
            'list_product_item' => $list
        ));
    }


    function list_orders($conn)
    {
        $skin = $this->load('class_skin_cpanel');

        $query = mysqli_query($conn, "SELECT td.*, p.name as product_name 
                                FROM test_drives td
                                LEFT JOIN products p ON td.product_id = p.id 
                                ORDER BY td.created_at DESC");

        $list = '';
        while ($row = mysqli_fetch_assoc($query)) {
            $row['id_testdrivess'] = $row['id'];
            // Format dates
            $row['preferred_date'] = date('d/m/Y', strtotime($row['preferred_date']));
            $row['preferred_time'] = date('H:i', strtotime($row['preferred_time']));

            // Set action buttons based on current status
            switch ($row['status']) {
                case 'pending':
                    $row['status_text'] = 'Chờ xác nhận';
                    $row['action_buttons'] = '
                    <button type="button" class="btn-confirm" data-id="' . $row['id'] . '">
                        Xác nhận
                    </button>
                    <button type="button" onclick="updateStatus(' . $row['id'] . ', \'cancelled\')" class="btn-cancel">
                        Hủy
                    </button>';
                    break;
                case 'confirmed':
                    $row['status_text'] = 'Đã xác nhận';
                    $row['action_buttons'] = '
                    <button type="button" onclick="updateStatus(' . $row['id'] . ', \'completed\')" class="btn-complete" data-id="' . $row['id'] . '">
                        Hoàn thành
                    </button>   
                    <button type="button" onclick="updateStatus(' . $row['id'] . ', \'cancelled\')" class="btn-cancel">
                        Hủy
                    </button>';
                    break;
                case 'completed':
                    $row['status_text'] = 'Đã hoàn thành';
                    $row['action_buttons'] = '<span class="badge badge-success">Đã hoàn thành</span>';
                    break;
                case 'cancelled':
                    $row['status_text'] = 'Đã hủy';
                    $row['action_buttons'] = '<span class="badge badge-danger">Đã hủy</span>';
                    break;
            }

            $list .= $skin->skin_replace('skin_adm/box_li/li_order', $row);
        }

        return $list;
    }
    ///////////////////////////////////
    function list_orders_car($conn){
        $skin = $this->load('class_skin_cpanel');
        $list = '';
        $i = 0;
        $query = mysqli_query($conn, "SELECT o.*, p.name as product_name FROM orders o LEFT JOIN products p ON o.product_id = p.id ");
        while ($row = mysqli_fetch_assoc($query)) {
            $i++;
            $row['stt'] = $i;
            $row['image'] =  $row['image_thanhtoan'] ?? 'Không có';
            $row['product_name'] =  $row['product_name'];
            $row['address'] =  $row['contact_address'];
            $row['phone'] =  $row['phone_number'];
            $row['email'] =  $row['email'];
            $row['amount'] =  $row['deposit_amount'];
            $row['bank_name'] =  $row['bank_name'];
            $row['account_number'] =  $row['bank_account_number'];
            $row['account_name'] =  $row['bank_account_name'];
            $row['created_at'] = date('d/m/Y', strtotime($row['created_at']));
            switch ($row['status']) {
                case 'pending':
                    $row['status_text'] = 'Chờ xử lý';
                    $row['action_buttons'] = '
                    <button type="button" onclick="status_update(' . $row['id'] . ', \'processing\')" class="btn-processing" data-id="' . $row['id'] . '">
                        Xử lý
                    </button>
                    <button type="button" onclick="status_update(' . $row['id'] . ', \'cancelled\')" class="btn-cancel">
                        Hủy
                    </button>';
                    break;
                case 'processing':
                    $row['status_text'] = 'Đang xử lý';
                    $row['action_buttons'] = '
                    <button type="button" onclick="status_update(' . $row['id'] . ', \'completed\')" class="btn-complete" data-id="' . $row['id'] . '">
                        Hoàn thành
                    </button>   
                    <button type="button" onclick="status_update(' . $row['id'] . ', \'cancelled\')" class="btn-cancel">
                        Hủy
                    </button>';
                    break;
                case 'completed':
                    $row['status_text'] = 'Đã hoàn thành';
                    $row['action_buttons'] = '<span class="badge badge-success">Đã hoàn thành</span>';
                    break;
                case 'cancelled':
                    $row['status_text'] = 'Đã hủy';
                    $row['action_buttons'] = '<span class="badge badge-danger">Đã hủy</span>';
                    break;
            }
            $row['note'] =  $row['payment_notes'] ?? 'Không có';
            $list .= $skin->skin_replace('skin_adm/box_li/li_oders_car', $row);
        }
        // var_dump($list);
        // die();
        return $list;

    }
    ///////////////////////////////////
    function get_product($conn, $id)
    {
        $id = (int)$id;
        $sql = "SELECT * FROM products WHERE id = $id";
        return mysqli_fetch_array(mysqli_query($conn, $sql));
    }
    ///////////////////////////////////
    // Thêm sản phẩm mới
    function add_product($conn, $data)
    {
        $name = mysqli_real_escape_string($conn, $data['name']);
        $price = (float)$data['price'];
        $description = mysqli_real_escape_string($conn, $data['description']);
        $image = mysqli_real_escape_string($conn, $data['image']);

        $sql = "INSERT INTO products (name, price, description, image) 
                VALUES ('$name', $price, '$description', '$image')";

        return mysqli_query($conn, $sql);
    }
    ///////////////////////////////////
    // Cập nhật sản phẩm
    function edit_product($conn, $id)
    {
        $skin = $this->load('class_skin_cpanel');

        // Lấy thông tin sản phẩm
        $id = (int)$id;
        $query = mysqli_query($conn, "SELECT * FROM products WHERE id = '$id' LIMIT 1");

        if (!$query) {
            return "Lỗi truy vấn: " . mysqli_error($conn);
        }

        $product = mysqli_fetch_assoc($query);
        if (!$product) {
            return "Không tìm thấy sản phẩm";
        }

        // Lưu giá gốc để edit
        $product['price_raw'] = $product['price'];
        // Format giá hiển thị
        $product['price'] = number_format($product['price'], 0, ',', '.') . ' VNĐ';

        // Return form edit với dữ liệu sản phẩm
        return $skin->skin_replace('skin_adm/box_li/edit_product', $product);
    }

    function update_product($conn, $data)
    {
        // Validate dữ liệu
        $id = (int)$data['id'];
        $name = mysqli_real_escape_string($conn, $data['name']);
        $price = (float)$data['price'];
        $description = mysqli_real_escape_string($conn, $data['description']);
        $stock = (int)$data['stock'];

        // Xử lý upload ảnh mới nếu có
        if (!empty($_FILES['new_image'])) {
            $image = $this->upload_image($_FILES['new_image']);
            if ($image) {
                $image_sql = ", image = '$image'";
            }
        }

        // Update database
        $sql = "UPDATE products SET 
            name = '$name',
            price = $price,
            description = '$description',
            stock = $stock
            $image_sql
            WHERE id = $id";

        $result = mysqli_query($conn, $sql);

        return $result ? "Cập nhật thành công" : "Lỗi: " . mysqli_error($conn);
    }

    private function upload_image($file)
    {
        $target_dir = "../hinhanh/";
        $target_file = $target_dir . basename($file["name"]);
        $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));

        // Check if file is an image
        if (!getimagesize($file["tmp_name"])) {
            return false;
        }

        // Check file size
        if ($file["size"] > 500000) {
            return false;
        }

        // Allow certain file formats
        if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg") {
            return false;
        }

        if (move_uploaded_file($file["tmp_name"], $target_file)) {
            return basename($file["name"]);
        }

        return false;
    }
    ///////////////////////////////////
    // Xóa sản phẩm
    function delete_product($conn, $id)
    {
        $id = (int)$id;
        $sql = "DELETE FROM products WHERE id = $id";
        return mysqli_query($conn, $sql);
    }
    ///////////////////////////////////                 
    function list_users($conn)
    {
        $skin = $this->load('class_skin_cpanel');

        $query = mysqli_query($conn, "SELECT * FROM users WHERE role = 'user' ORDER BY created_at DESC");

        if (!$query) {
            return "Lỗi truy vấn: " . mysqli_error($conn);
        }

        $list = '';
        while ($row = mysqli_fetch_assoc($query)) {
            // Format created date
            $row['created_at'] = date('d/m/Y H:i', strtotime($row['created_at']));

            // Replace empty values with '-'
            $row['phone'] = $row['phone'] ?: '-';
            $row['address'] = $row['address'] ?: '-';

            $list .= $skin->skin_replace('skin_adm/box_li/li_user', $row);
        }

        return $list;
    }
}
