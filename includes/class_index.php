<?php
class class_index extends class_manage {
    public function __construct() {
        parent::__construct(); // Gọi constructor của class cha để khởi tạo kết nối DB
    }
    
    public function getProducts() {
        $sql = "SELECT name, image, price, category_id FROM products WHERE featured = 1";
        $result = $this->db->query($sql);
        
        $products = array();
        while($row = $result->fetch_assoc()) {
            $products[] = $row;
        }
        
        return $products;
    }
}
?>