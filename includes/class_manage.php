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
}
?>