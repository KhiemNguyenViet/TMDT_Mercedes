<?php
class class_index extends class_manage {
    function getThongTinKhachHang($conn,$id)
    {
        $sql = "SELECT * FROM users WHERE user_id = $id";
        $result =  mysqli_query($conn,$sql);
        return mysqli_fetch_assoc($result);
    }

    function getProductById($conn,$id)
    {
        $id = (int)$id;
        $sql = "SELECT * FROM products LEFT JOIN product_details ON products.id = product_details.product_id WHERE products.id = $id LIMIT 1";
        $result =  mysqli_query($conn,$sql);

        if ($result && mysqli_num_rows($result) > 0) {
            return mysqli_fetch_assoc($result);
        }
        return null;
    }
    function getCategoryById($conn,$id)
    {
        $id = (int)$id;
        $sql = "SELECT * FROM categories WHERE id = $id LIMIT 1";
        $result =  mysqli_query($conn,$sql);

        if ($result && mysqli_num_rows($result) > 0) {
            return mysqli_fetch_assoc($result);
        }
        return ['name' => 'Không xác định'];
    }
    function getProducts($conn) {
        $sql = "SELECT name, image, price, category_id FROM products WHERE featured = 1";
        $result =  mysqli_query($conn,$sql);
        
        $products = array();
        while($row = $result->fetch_assoc()) {
            $products[] = $row;
        }
        
        return $products;
    }

    function list_glcbanchay($conn,$limit) {
        $thongtin= mysqli_query($conn,"SELECT * FROM products WHERE category_id = 1 LIMIT $limit");
        $skin = $this->load('class_skin');
		$check = $this->load('class_check');
        $i=0;
        $list = '';
        while($row = mysqli_fetch_array($thongtin)) {
            $i++;
            $row['stock'] = $row['stock'];
            $row['name'] = $row['name'];
            $row['image'] = $row['image'];
            $row['price'] = $row['price'];
            $list.=$skin->skin_replace('skin/box_li/li_glcbanchay',$row);
        }
        return $list;
    }
    function list_suvbanchay($conn,$limit) {
        $thongtin= mysqli_query($conn,"SELECT * FROM products WHERE category_id = 2 LIMIT $limit");
        $skin = $this->load('class_skin');
		$check = $this->load('class_check');
        $i=0;
        $list = '';
        while($row = mysqli_fetch_array($thongtin)) {
            $i++;
            $row['stock'] = $row['stock'];
            $row['name'] = $row['name'];
            $row['image'] = $row['image'];
            $row['price'] = $row['price'];
            $list.=$skin->skin_replace('skin/box_li/li_suvbanchay',$row);
        }
        return $list;
    }
    function list_coupebanchay($conn,$limit) {
        $thongtin= mysqli_query($conn,"SELECT * FROM products WHERE category_id = 3 LIMIT $limit");
        $skin = $this->load('class_skin');
		$check = $this->load('class_check');
        $i=0;
        $list = '';
        while($row = mysqli_fetch_array($thongtin)) {
            $i++;
            $row['stock'] = $row['stock'];
            $row['name'] = $row['name'];
            $row['image'] = $row['image'];
            $row['price'] = $row['price'];
            $list.=$skin->skin_replace('skin/box_li/li_coupebanchay',$row);
        }
        return $list;
    }

}
?>