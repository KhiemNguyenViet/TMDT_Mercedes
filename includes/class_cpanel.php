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
}
