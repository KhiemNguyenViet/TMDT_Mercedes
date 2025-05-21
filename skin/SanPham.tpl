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
                <select class="sort-select">
                    <option>Thứ tự mặc định</option>
                    <option>Giá tăng dần</option>
                    <option>Giá giảm dần</option>
                </select>
            </div>

            <div class="product-grid">
                {box_index}
            </div>

            <div class="pagination">
                <a href="#" class="page-link prev">&larr; Trước đó</a>
                <div class="page-numbers">
                    <a href="#" class="page-link active">1</a>
                    <a href="#" class="page-link">2</a>
                    <a href="#" class="page-link">3</a>
                </div>
                <a href="#" class="page-link next">Tiếp theo &rarr;</a>
            </div>
        </main>
        <script>
            const categoryList = document.getElementById('category-list');
            const products = document.querySelectorAll('.product-card');
            const productsPerPage = 12; // 3 hàng x 4 cột = 12 sản phẩm mỗi trang
            let currentPage = 1;

            // Hàm hiển thị sản phẩm theo trang
            function displayProductsByPage(page) {
                const startIndex = (page - 1) * productsPerPage;
                const endIndex = startIndex + productsPerPage;

                let visibleProducts = Array.from(products).filter(product => {
                    const filter = document.querySelector('#category-list li.active').getAttribute('data-filter');
                    const category = product.getAttribute('data-category');
                    return filter === 'all' || category === filter;
                });

                products.forEach(product => {
                    product.style.display = 'none';
                });

                visibleProducts.forEach((product, index) => {
                    if (index >= startIndex && index < endIndex) {
                        product.style.display = 'block';
                    }
                });

                // Cập nhật thanh phân trang
                updatePagination(visibleProducts.length);
            }

            // Cập nhật trạng thái thanh phân trang
            function updatePagination(totalProducts) {
                const pageCount = Math.ceil(totalProducts / productsPerPage);
                const pageNumbersEl = document.querySelector('.page-numbers');
                const prevBtn = document.querySelector('.page-link.prev');
                const nextBtn = document.querySelector('.page-link.next');

                // Xóa các liên kết trang cũ
                pageNumbersEl.innerHTML = '';

                // Tạo các liên kết trang mới
                for (let i = 1; i <= pageCount; i++) {
                    const pageLink = document.createElement('a');
                    pageLink.href = '#';
                    pageLink.classList.add('page-link');
                    if (i === currentPage) {
                        pageLink.classList.add('active');
                    }
                    pageLink.textContent = i;
                    pageLink.addEventListener('click', (e) => {
                        e.preventDefault();
                        currentPage = i;
                        displayProductsByPage(currentPage);
                    });
                    pageNumbersEl.appendChild(pageLink);
                }

                // Cập nhật trạng thái nút Trước đó
                if (currentPage === 1) {
                    prevBtn.classList.add('disabled');
                } else {
                    prevBtn.classList.remove('disabled');
                }

                // Cập nhật trạng thái nút Tiếp theo
                if (currentPage === pageCount || pageCount === 0) {
                    nextBtn.classList.add('disabled');
                } else {
                    nextBtn.classList.remove('disabled');
                }

                // Ẩn thanh phân trang nếu chỉ có 1 trang hoặc không có sản phẩm
                const paginationEl = document.querySelector('.pagination');
                if (pageCount <= 1) {
                    paginationEl.style.display = 'none';
                } else {
                    paginationEl.style.display = 'flex';
                }
            }

            // Xử lý click trên danh mục
            categoryList.addEventListener('click', (e) => {
                if (e.target.tagName === 'LI') {
                    // Xử lý active class
                    categoryList.querySelectorAll('li').forEach(li => li.classList.remove('active'));
                    e.target.classList.add('active');

                    // Reset về trang 1 khi chọn danh mục mới
                    currentPage = 1;
                    displayProductsByPage(currentPage);
                }
            });

            // Xử lý nút Trước đó
            document.querySelector('.page-link.prev').addEventListener('click', (e) => {
                e.preventDefault();
                if (currentPage > 1) {
                    currentPage--;
                    displayProductsByPage(currentPage);
                }
            });

            // Xử lý nút Tiếp theo
            document.querySelector('.page-link.next').addEventListener('click', (e) => {
                e.preventDefault();
                const pageCount = Math.ceil(
                    Array.from(products).filter(product => {
                        const filter = document.querySelector('#category-list li.active').getAttribute('data-filter');
                        const category = product.getAttribute('data-category');
                        return filter === 'all' || category === filter;
                    }).length / productsPerPage
                );

                if (currentPage < pageCount) {
                    currentPage++;
                    displayProductsByPage(currentPage);
                }
            });

            // Hiển thị trang đầu tiên khi tải trang
            displayProductsByPage(currentPage);
        </script>

    </div>
    {footer}
</body>

</html>