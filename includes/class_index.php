<?php
class class_index extends class_manage {

    function list_glcbanchay($conn,$limit) {
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
            $list.=$skin->skin_replace('skin/box_li/li_glcbanchay',$row);
        }
        return $list;
    }

}
?>