<?php
<<<<<<< HEAD
class class_index extends class_manage {
    function list_glcbanchay($conn,$limit) {
        $thongtin= mysqli_query($conn,"SELECT * FROM products WHERE category_id = 2 LIMIT $limit");
=======
class class_index extends class_manage
{
    public function __construct()
    {
        parent::__construct(); // Gọi constructor của class cha
    }

    public function getProducts()
    {
        $sql = "SELECT name, image, price, category_id FROM products WHERE featured = 1";
        $result = $this->db->query($sql);

        $products = array();
        while ($row = $result->fetch_assoc()) {
            $products[] = $row;
        }

        return $products;
    }

    public function getProductById($id)
    {
        $id = (int)$id;
        $sql = "SELECT * FROM products WHERE id = $id LIMIT 1";
        $result = mysqli_query($this->db, $sql);

        if ($result && mysqli_num_rows($result) > 0) {
            return mysqli_fetch_assoc($result);
        }
        return null;
    }
    public function getCategoryById($id)
    {
        $id = (int)$id;
        $sql = "SELECT * FROM categories WHERE id = $id LIMIT 1";
        $result = mysqli_query($this->db, $sql);

        if ($result && mysqli_num_rows($result) > 0) {
            return mysqli_fetch_assoc($result);
        }
        return ['name' => 'Không xác định'];
    }
    function list_glcbanchay($conn, $limit)
    {
        $thongtin = mysqli_query($conn, "SELECT * FROM products WHERE category_id = 2 LIMIT $limit");
>>>>>>> 1985ed7e30521a3af5659487536f2e744e55a41d
        $skin = $this->load('class_skin');
        $check = $this->load('class_check');
        $i = 0;
        $list = '';
        while ($row = mysqli_fetch_array($thongtin)) {
            $i++;
            $row['stock'] = $row['stock'];
            $row['name'] = $row['name'];
            $row['image'] = $row['image'];
            $row['price'] = $row['price'];
            $list .= $skin->skin_replace('skin/box_li/li_glcbanchay', $row);
        }
        return $list;
    }
}
