<?php
class class_member extends class_manage {
    function check_login(){
        if(!isset($_COOKIE['user_id'])){
            return 0;
        }else{
            //setcookie('user_id',$_COOKIE['user_id'],time()+3600);
            return $_COOKIE['user_id'];
        }
    }
    // Thêm các phương thức cần thiết ở đây
}
?> 