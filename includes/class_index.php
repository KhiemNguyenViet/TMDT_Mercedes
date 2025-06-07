<?php
class class_index extends class_manage
{
    function list_lichsu_thanhtoan($conn, $user_id)
    {
        $thongtin = mysqli_query($conn, "SELECT o.*, p.name_car as product_name, p.image_car as product_image 
        FROM orders o 
        LEFT JOIN products p ON o.product_id = p.id 
        WHERE o.user_id = '$user_id' 
        ORDER BY o.id DESC");
        $skin = $this->load('class_skin');
        $check = $this->load('class_check');
        $i = 0;
        $list = '';
        while ($row = mysqli_fetch_array($thongtin)) {
            $i++;
            $row['orders.id'] = $row['id'];
            $row['orders.status'] = $row['status'] == 'pending' ? '<span class="badge bg-warning">Chờ xử lý</span>' : ($row['status'] == 'processing' ? '<span class="badge bg-info">Đang xử lý</span>' : ($row['status'] == 'completed' ? '<span class="badge bg-success">Hoàn thành</span>' :
                '<span class="badge bg-danger">Đã hủy</span>'));
            $row['stt'] = $i;
            $row['fullname'] = $row['full_name'];
            $row['location'] = $row['location'];
            $row['phone_number'] = $row['phone_number'];
            $row['preferred_date'] = $row['preferred_date'];
            $row['preferred_time'] = $row['preferred_time'];
            $row['product_name'] = $row['product_name'];
            $row['product_image'] = $row['product_image'];
            $row['total_amount'] = number_format($row['total_amount'], 0, ',', '.');
            $row['deposit_amount'] = number_format($row['deposit_amount'], 0, ',', '.');
            $row['bank_name'] = $row['bank_name'];
            $row['bank_branch'] = $row['bank_branch'];
            $row['bank_account_number'] = $row['bank_account_number'];
            $row['bank_account_name'] = $row['bank_account_name'];
            $row['payment_notes'] = $row['payment_notes'];
            $row['created_at'] = $row['created_at'];
            $row['orders.salutation'] = $row['salutation'];
            $row['orders.email'] = $row['email'];
            $row['orders.contact_address'] = $row['contact_address'];
            $row['orders.dealer'] = $row['dealer'];
            $row['orders.sales_person'] = $row['sales_person'];
            $row['orders.image_thanhtoan'] = $row['image_thanhtoan'];
            $list .= $skin->skin_replace('skin/box_li/li_lichsu_thanhtoan', $row);
        }
        return $list;
    }
    /////////////////////////////
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
            $row['name'] = $row['name_car'];
            $row['image'] = $row['image_car'];
            $row['price'] = number_format($row['price'], 0, ',', '.') . ' VND';
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

            $row['name'] = $row['name_car'];
            $row['image'] = $row['image_car'];
            $row['price'] = number_format($row['price'], 0, ',', '.') . ' VND';
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
            $row['name'] = $row['name_car'];
            $row['image'] = $row['image_car'];
            $row['price'] = number_format($row['price'], 0, ',', '.') . ' VND';
            $list .= $skin->skin_replace('skin/box_li/li_coupebanchay', $row);
        }
        return $list;
    }
    function list_lichlai($conn, $user_id)
    {
        $thongtin_laithu = mysqli_query($conn, "SELECT test_drives.*, products.name_car as car_name FROM test_drives LEFT JOIN products ON test_drives.product_id = products.id WHERE user_id = $user_id ORDER BY test_drives.id DESC");
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
            switch ($row['status']) {
                case 'pending':
                    $row['status_text'] = 'Chờ xác nhận';
                    $row['action_buttons'] = '
                    <button type="button" class="btn-khachhang-cancel" data-id="' . $row['id'] . '">
                        Hủy
                    </button>';
                    break;
                case 'confirmed':
                    $row['status_text'] = 'Đã xác nhận';
                    $row['action_buttons'] = '  
                    <button type="button" class="btn-khachhang-cancel" data-id="' . $row['id'] . '" >
                        Hủy
                    </button>';
                    break;
                case 'completed':
                    $row['status_text'] = 'Đã hoàn thành';
                    $row['action_buttons'] = '<span class="badge badge-success">Đã hoàn thành</span>';
                    break;
                case 'cancelled':
                    $row['status_text'] = 'Đã hủy';
                    $row['action_buttons'] = '<span class="badge badge-danger">Đã hủy</span>';
                    break;
                case 'processing':
                    $row['status_text'] = 'Đang xử lý';
                    $row['action_buttons'] = '<span class="badge badge-info">Đang xử lý</span>';
                    break;
            }
            $list .= $skin->skin_replace('skin/box_li/li_lichlai', $row);
        }
        return $list;
    }
    function box_index($conn)
    {
        // Get parameters
        $category = isset($_GET['category']) ? $_GET['category'] : 'all';
        $sort = isset($_GET['sort']) ? $_GET['sort'] : 'default';
        $page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
        $per_page = 12;

        // Build base query
        $query = "SELECT p.*, c.name as category_name 
              FROM products p 
              LEFT JOIN categories c ON p.category_id = c.id";

        // Add category filter
        if ($category !== 'all') {
            $category = mysqli_real_escape_string($conn, $category);
            $query .= " WHERE p.category_id = '$category'";
        }

        // Add sorting
        switch ($sort) {
            case 'price-asc':
                $query .= " ORDER BY p.price ASC";
                break;
            case 'price-desc':
                $query .= " ORDER BY p.price DESC";
                break;
            default:
                $query .= " ORDER BY p.id ASC";
        }

        // Get total records for pagination
        $total_query = mysqli_query($conn, "SELECT COUNT(*) as total FROM ($query) as t");
        $total = mysqli_fetch_assoc($total_query)['total'];
        $total_pages = ceil($total / $per_page);

        // Add pagination
        $offset = ($page - 1) * $per_page;
        $query .= " LIMIT $offset, $per_page";

        // Execute final query
        $thongtin = mysqli_query($conn, $query);
        $skin = $this->load('class_skin');
        $list = '';

        // Build products list
        while ($row = mysqli_fetch_array($thongtin)) {
            $row = array_merge($row, [
                'stock' => $row['stock'],
                'name' => $row['name_car'],
                'image' => $row['image_car'],
                'price' => number_format($row['price'], 0, ',', '.'),
                'description' => $row['description_car'],
                'id' => $row['id'],
                'category_id' => $row['category_id'],
                'category' => $row['category_name']
            ]);
            $list .= $skin->skin_replace('skin/box_li/li_sanpham', $row);
        }

        // Build pagination
        $pagination = $this->build_pagination($page, $total_pages, $category, $sort);

        return [
            'list' => $list,
            'pagination' => $pagination,
            'category_param' => $category !== 'all' ? "category=$category&" : '',
            'sort_param' => $sort !== 'default' ? "&sort=$sort" : '',
            'active_all' => $category === 'all' ? 'active' : '',
            'sort_default' => $sort === 'default' ? 'selected' : '',
            'sort_asc' => $sort === 'price-asc' ? 'selected' : '',
            'sort_desc' => $sort === 'price-desc' ? 'selected' : ''
        ];
    }

    function build_pagination($current_page, $total_pages, $category, $sort)
    {
        if ($total_pages <= 1) return '';

        $html = '<div class="pagination">';

        // Previous button
        $prev_disabled = $current_page == 1 ? 'disabled' : '';
        $prev_link = "?category=$category" . ($sort != 'default' ? "&sort=$sort" : '') . "&page=" . ($current_page - 1);
        $html .= "<a href='$prev_link' class='page-link prev $prev_disabled'>&larr; Trước đó</a>";

        $html .= '<div class="page-numbers">';
        // Page numbers
        for ($i = 1; $i <= $total_pages; $i++) {
            $active = $i == $current_page ? 'active' : '';
            $link = "?category=$category" . ($sort != 'default' ? "&sort=$sort" : '') . "&page=$i";
            $html .= "<a href='$link' class='page-link $active'>$i</a>";
        }
        $html .= '</div>';

        // Next button
        $next_disabled = $current_page == $total_pages ? 'disabled' : '';
        $next_link = "?category=$category" . ($sort != 'default' ? "&sort=$sort" : '') . "&page=" . ($current_page + 1);
        $html .= "<a href='$next_link' class='page-link next $next_disabled'>Tiếp theo &rarr;</a>";

        $html .= '</div>';
        return $html;
    }
    function list_category($conn)
    {
        $query = "SELECT id, name, slug FROM categories ORDER BY id ASC";
        $thongtin = mysqli_query($conn, $query);

        if (!$thongtin) {
            die("Query failed: " . mysqli_error($conn));
        }

        $skin = $this->load('class_skin');
        $list = '';

        while ($row = mysqli_fetch_array($thongtin)) {
            $row['id'] = $row['id'];
            $row['name'] = $row['name'];
            $row['slug'] = $row['slug'];
            $list .= $skin->skin_replace('skin/box_li/li_category', $row);
        }

        return $list;
    }
    function list_car_models($conn)
    {
        $query = mysqli_query($conn, "SELECT * FROM categories ORDER BY name ASC");
        $list = '';

        while ($row = mysqli_fetch_array($query)) {
            $row['value'] = $row['id'];
            $row['name'] = $row['name'];
            $list .= $this->skin->skin_replace('skin/box_li/li_car_model', $row);
        }

        return $list;
    }
    function search_products($conn, $keyword)
    {
        // Chuẩn hóa từ khóa: loại bỏ khoảng trắng thừa ở đầu/cuối
        $keyword = trim($keyword);

        // Tạo các biến thể của từ khóa
        $keyword_no_space = str_replace(' ', '', $keyword); // "g 63" -> "g63"
        $keyword_with_space = preg_replace('/(\w)(\d)/', '$1 $2', $keyword); // "g63" -> "g 63"

        // Chuẩn bị các phiên bản từ khóa cho tìm kiếm
        $search_terms = [
            "%$keyword%",           // Từ khóa gốc: "g63" hoặc "g 63"
            "%$keyword_no_space%",  // Từ khóa không khoảng trắng: "g63"
            "%$keyword_with_space%" // Từ khóa có khoảng trắng: "g 63"
        ];

        // Câu query SQL: tìm kiếm không phân biệt hoa thường
        $query = "SELECT * FROM products WHERE 
              LOWER(name_car) LIKE ? OR 
              LOWER(name_car) LIKE ? OR 
              LOWER(name_car) LIKE ? OR 
              LOWER(description_car) LIKE ? OR 
              LOWER(description_car) LIKE ? OR 
              LOWER(description_car) LIKE ?
              ORDER BY name_car ASC";

        // Chuẩn bị statement
        $stmt = $conn->prepare($query);
        if ($stmt === false) {
            return [
                'list' => '<div class="no-results">Lỗi truy vấn cơ sở dữ liệu</div>',
                'pagination' => ''
            ];
        }

        // Gán tham số: lặp lại các biến thể từ khóa
        $stmt->bind_param(
            'ssssss',
            $search_terms[0],
            $search_terms[1],
            $search_terms[2],
            $search_terms[0],
            $search_terms[1],
            $search_terms[2]
        );

        // Thực thi
        $stmt->execute();
        $result = $stmt->get_result();
        $list = '';

        while ($row = $result->fetch_assoc()) {
            $row['stock'] = $row['stock'];
            $row['name'] = $row['name_car'];
            $row['image'] = $row['image_car'];
            $row['description'] = $row['description_car'];
            $row['price'] = number_format($row['price'], 0, ',', '.') . ' VND';
            $list .= $this->skin->skin_replace('skin/box_li/li_sanpham', $row);
        }

        // Đóng statement
        $stmt->close();

        return [
            'list' => $list ?: '<div class="no-results">Không tìm thấy sản phẩm phù hợp</div>',
            'pagination' => ''
        ];
    }
}
