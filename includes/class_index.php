<?php
class class_index extends class_manage
{
    function getThongTinKhachHang($conn, $id)
    {
        $sql = "SELECT * FROM users WHERE user_id = $id";
        $result =  mysqli_query($conn, $sql);
        return mysqli_fetch_assoc($result);
    }

    function getProductById($conn, $id)
    {
        $id = (int)$id;
        $sql = "SELECT * FROM products LEFT JOIN product_details ON products.id = product_details.product_id WHERE products.id = $id LIMIT 1";
        $result =  mysqli_query($conn, $sql);

        if ($result && mysqli_num_rows($result) > 0) {
            return mysqli_fetch_assoc($result);
        }
        return null;
    }
    function getCategoryById($conn, $id)
    {
        $id = (int)$id;
        $sql = "SELECT * FROM categories WHERE id = $id LIMIT 1";
        $result =  mysqli_query($conn, $sql);

        if ($result && mysqli_num_rows($result) > 0) {
            return mysqli_fetch_assoc($result);
        }
        return ['name' => 'Không xác định'];
    }
    function getProducts($conn)
    {
        $sql = "SELECT name, image, price, category_id FROM products WHERE featured = 1";
        $result =  mysqli_query($conn, $sql);

        $products = array();
        while ($row = $result->fetch_assoc()) {
            $products[] = $row;
        }

        return $products;
    }

    function list_glcbanchay($conn, $limit)
    {
        $thongtin = mysqli_query($conn, "SELECT * FROM products WHERE category_id = 1 AND featured = 1 LIMIT $limit");
        $skin = $this->load('class_skin');
        $check = $this->load('class_check');
        $i = 0;
        $list = '';
        while ($row = mysqli_fetch_array($thongtin)) {
            $i++;
            $row['stock'] = $row['stock'];
            $row['name'] = $row['name'];
            $row['image'] = $row['image'];
            $row['price'] = number_format($row['price'], 0, ',', '.');
            $list .= $skin->skin_replace('skin/box_li/li_glcbanchay', $row);
        }
        return $list;
    }
    function list_suvbanchay($conn, $limit)
    {
        $thongtin = mysqli_query($conn, "SELECT * FROM products WHERE category_id = 2 AND featured = 1 LIMIT $limit");
        $skin = $this->load('class_skin');
        $check = $this->load('class_check');
        $i = 0;
        $list = '';
        while ($row = mysqli_fetch_array($thongtin)) {
            $i++;
            $row['stock'] = $row['stock'];
            $row['name'] = $row['name'];
            $row['image'] = $row['image'];
            $row['price'] = number_format($row['price'], 0, ',', '.');
            $list .= $skin->skin_replace('skin/box_li/li_suvbanchay', $row);
        }
        return $list;
    }
    function list_coupebanchay($conn, $limit)
    {
        $thongtin = mysqli_query($conn, "SELECT * FROM products WHERE category_id = 3 AND featured = 1 LIMIT $limit");
        $skin = $this->load('class_skin');
        $check = $this->load('class_check');
        $i = 0;
        $list = '';
        while ($row = mysqli_fetch_array($thongtin)) {
            $i++;
            $row['stock'] = $row['stock'];
            $row['name'] = $row['name'];
            $row['image'] = $row['image'];
            $row['price'] = number_format($row['price'], 0, ',', '.');
            $list .= $skin->skin_replace('skin/box_li/li_coupebanchay', $row);
        }
        return $list;
    }
    function list_lichlai($conn, $user_id)
    {
        $thongtin_laithu = mysqli_query($conn, "SELECT test_drives.*, products.name_car as car_name FROM test_drives LEFT JOIN products ON test_drives.product_id = products.id WHERE user_id = $user_id");
        $skin = $this->load('class_skin');
        $check = $this->load('class_check');
        $i = 0;
        $list = '';
        while ($row = mysqli_fetch_array($thongtin_laithu)) {
            $i++;
            $row['stt'] = $i;
            $row['fullname'] = $row['full_name'];
            $row['location'] = $row['location'];
            $row['phone_number'] = $row['phone_number'];
            $row['preferred_date'] = $row['preferred_date'];
            $row['preferred_time'] = $row['preferred_time'];
            $row['note'] = $row['notes'] ? $row['notes'] : 'Không có';
            $row['car_name'] = $row['car_name'];
            $row['status'] = $row['status'];
            $list .= $skin->skin_replace('skin/box_li/li_lichlai', $row);
        }
        return $list;
    }
    function box_index($conn, $limit = null)
    {
        $query = "SELECT p.*, c.name as category_name 
              FROM products p 
              LEFT JOIN categories c ON p.category_id = c.id";

        if ($limit !== null) {
            $query .= " LIMIT $limit";
        }

        $thongtin = mysqli_query($conn, $query);
        $skin = $this->load('class_skin');
        $check = $this->load('class_check');
        $i = 0;
        $list = '';

        while ($row = mysqli_fetch_array($thongtin)) {
            $i++;
            $row['stock'] = $row['stock'];
            $row['name'] = $row['name'];
            $row['image'] = $row['image'];
            $row['price'] = number_format($row['price'], 0, ',', '.');
            $row['description'] = $row['description'];
            $row['id'] = $row['id'];
            $row['category'] = $row['category_name'];
            $list .= $skin->skin_replace('skin/box_li/li_sanpham', $row);
        }
        return $list; 
    }
}
