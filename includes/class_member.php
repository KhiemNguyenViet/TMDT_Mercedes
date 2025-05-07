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
    ///////////////////////////////
    function token_login($user_id,$password){
        $pass_1=substr($password, 0,8);
        $pass_2=substr($password, 8,8);
        $pass_3=substr($password, 16,8);
        $pass_4=substr($password, 24,8);
        $string=$pass_1.'-'.$pass_3.'-'.$pass_2.''.$user_id.'-'.$pass_2.'-'.$pass_4;
        $token_login=base64_encode($string);
        return $token_login;
    }
    ///////////////////////////////
    function login($conn,$username,$password,$remember){
        if(strlen($username)<4){
            return 0;
        }else{
            $info=mysqli_query($conn,"SELECT * FROM users WHERE username='$username'");
            $total=mysqli_num_rows($info);
            if($total>0){
                $r_info=mysqli_fetch_assoc($info);
                $pass=md5($password);
                if($pass!=$r_info['password']){
                    return 2;
                }else{
                    if (isset($r_info['role']) && $r_info['role'] == 'user') {
                        return 24;
                    } else {
                        if(isset($remember) && $remember=='on'){
                            setcookie("user_id",$this->token_login($r_info['id'], $r_info['password']),time() + 31536000,'/');
                        }else{
                            setcookie("user_id",$this->token_login($r_info['id'], $r_info['password']),time() + 3600,'/');
                        }
                        return 200;
                    }
                }
            }else{
                return 1;
            }
        }
    }
    // Thêm các phương thức cần thiết ở đây
}
?> 