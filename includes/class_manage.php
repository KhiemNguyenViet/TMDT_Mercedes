<?php
class class_manage
{
	/*========================================/*
			*| construcs function
			*| Xay dung doi tuong can thiet
			*| Dinh nghia $data va $skin
			/*========================================*/
	public $data;
	public $skin;
	public $userid;
	public function __construct()
	{
		$this->db = mysqli_connect('localhost', 'root', '', 'mercedes_shop');

		if (!$this->db) {
			die('Kết nối database thất bại: ' . mysqli_connect_error());
		}

		mysqli_set_charset($this->db, "utf8");
	}
	/*========================================/*
			*|
			*| Class load
			*| Chi input class name , ko .php
			/*========================================*/
	public function load($class_name)
	{
		if (file_exists(__DIR__ . '/' . $class_name . '.php')) {
			require_once(__DIR__ . '/' . $class_name . '.php');
			return new $class_name();
		}
		return null;
	}
}
