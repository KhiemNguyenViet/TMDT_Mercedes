<?php
class class_manage {
    protected $db;
    
    public function __construct() {
        $this->db = new mysqli('localhost', 'root', '', 'mercedes_shop');
        
        if ($this->db->connect_error) {
            die('Kết nối database thất bại: ' . $this->db->connect_error);
        }
        
        $this->db->set_charset("utf8");
    }

    public function load($class_name) {
        // Kiểm tra file tồn tại
        $file_path = __DIR__ . '/' . $class_name . '.php';
        if (file_exists($file_path)) {
            // Include file class
            require_once($file_path);
            // Tạo instance mới của class
            return new $class_name();
        }
        return null;
    }
}
?>