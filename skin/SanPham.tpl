<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="description"
        content="Mercedes-Benz Việt Nam - Đại lý Mercedes-Benz chính hãng, cung cấp xe Mercedes-Benz mới, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <meta name="keywords"
        content="Mercedes-Benz, xe Mercedes-Benz, đại lý Mercedes-Benz, tư vấn xe, lái thử xe, bán lẻ xe Mercedes-Benz">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <title>Sản phẩm</title>
    <link rel="stylesheet" href="../skin/tpl/css/MenuBar.css">
    <link rel="stylesheet" href="../skin/tpl/css/SanPham.css">
    <link rel="stylesheet" href="../skin/tpl/css/Footer.css">

</head>

<body>
    {header}
    <div class="container">
        <aside class="sidebar">
            <h4>MERCEDES-BENZ</h4>
            <ul id="category-list">
                <li data-filter="all" class="{active_all}">
                    <a href="?category=all{sort_param}">Tất cả</a>
                </li>
                {list_category}
            </ul>
        </aside>
        <main class="main-content">
            <div class="topbar">
                <select class="sort-select" onchange="window.location.href=this.value">
                    <option value="?{category_param}sort=default" {sort_default}>Thứ tự mặc định</option>
                    <option value="?{category_param}sort=price-asc" {sort_asc}>Giá tăng dần</option>
                    <option value="?{category_param}sort=price-desc" {sort_desc}>Giá giảm dần</option>
                </select>
                <div class="search-bar">
                    <form action="/search.php" method="GET">
                        <input type="text" name="keyword" placeholder="Tìm kiếm sản phẩm..." id="search-input" required>
                        <button type="submit" id="search-button">Tìm kiếm</button>
                    </form>
                </div>

                <div class="product-grid">
                    {box_index}
                </div>
                <style>
                    #category-list li {
                        padding: 10px 15px;
                        cursor: pointer;
                        transition: all 0.3s ease;
                        border-radius: 4px;
                    }

                    #category-list li a {
                        color: #333;
                        text-decoration: none;
                        display: block;
                    }

                    #category-list li.active {
                        background-color: #000;
                    }

                    #category-list li.active a {
                        color: #fff;
                    }

                    #category-list li:hover:not(.active) {
                        background-color: #f5f5f5;
                    }
                </style>
                {pagination}
        </main>
    </div>
    {footer}
</body>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const urlParams = new URLSearchParams(window.location.search);
        const currentCategory = urlParams.get('category') || 'all';
        const categoryItems = document.querySelectorAll('#category-list li');
        categoryItems.forEach(item => {
            item.classList.remove('active');
        });
        if (currentCategory === 'all') {
            document.querySelector('#category-list li[data-filter="all"]').classList.add('active');
        } else {
            document.querySelector(`#category-list li a[href*="category=${currentCategory}"]`)
                ?.parentElement.classList.add('active');
        }
    });
</script>

</html>