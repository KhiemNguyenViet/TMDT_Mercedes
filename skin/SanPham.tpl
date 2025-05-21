<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
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
                <li data-filter="all" class="active">Tất cả</li>
                <li data-filter="AMG">AMG</li>
                <li data-filter="A-Class">A-Class</li>
                <li data-filter="C-Class">C-Class</li>
                <li data-filter="E-Class">E-Class</li>
                <li data-filter="G-Class">G-Class</li>
                <li data-filter="GLA">GLA</li>
                <li data-filter="GLB">GLB</li>
                <li data-filter="GLC">GLC</li>
                <li data-filter="GLE">GLE</li>
                <li data-filter="GLS">GLS</li>
                <li data-filter="GT">GT</li>
                <li data-filter="Maybach">Maybach</li>
                <li data-filter="Mercedes-Benz">Mercedes-Benz</li>
                <li data-filter="EQ">Mercedes-EQ</li>
                <li data-filter="S-Class">S-Class</li>
                <li data-filter="V-Class">V-Class</li>
            </ul>
        </aside>



        <main class="main-content">
            <div class="topbar">
                <select>
                    <option>Thứ tự mặc định</option>
                    <option>Giá tăng dần</option>
                    <option>Giá giảm dần</option>
                </select>
            </div>

            {box_index}
        </main>
        <script>
            const categoryList = document.getElementById('category-list');
            const products = document.querySelectorAll('.product-card');

            categoryList.addEventListener('click', (e) => {
                if (e.target.tagName === 'LI') {
                    // Xử lý active class
                    categoryList.querySelectorAll('li').forEach(li => li.classList.remove('active'));
                    e.target.classList.add('active');

                    const filter = e.target.getAttribute('data-filter');

                    products.forEach(product => {
                        const category = product.getAttribute('data-category');
                        if (filter === 'all' || category === filter) {
                            product.style.display = 'block';
                        } else {
                            product.style.display = 'none';
                        }
                    });
                }
            });
        </script>

    </div>
    {footer}
</body>

</html>