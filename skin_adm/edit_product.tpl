<div class="edit-product-form">
    <h2>Sửa sản phẩm</h2>
    <form id="editProductForm" method="POST" action="process.php" enctype="multipart/form-data">
        <input type="hidden" name="action" value="update_product">
        <input type="hidden" name="id" value="{id}">
        
        <div class="form-group">
            <label>Tên sản phẩm:</label>
            <input type="text" name="name" value="{name}" required>
        </div>

        <div class="form-group">
            <label>Giá (VNĐ):</label>
            <input type="number" name="price" value="{price_raw}" required>
        </div>

        <div class="form-group">
            <label>Mô tả:</label>
            <textarea name="description" required>{description}</textarea>
        </div>

        <div class="form-group">
            <label>Số lượng:</label>
            <input type="number" name="stock" value="{stock}" required>
        </div>

        <div class="form-group">
            <label>Hình ảnh hiện tại:</label>
            <img src="../hinhanh/{image}" class="preview-img" style="max-width: 200px;">
            <input type="file" name="new_image" accept="image/*">
            <input type="hidden" name="current_image" value="{image}">
        </div>

        <div class="form-buttons">
            <button type="submit" class="btn-save">Lưu thay đổi</button>
            <a href="index.php" class="btn-cancel">Quay lại</a>
        </div>
    </form>
</div>

<style>
.edit-product-form {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.form-group input[type="text"],
.form-group input[type="number"],
.form-group textarea {
    width: 100%;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.form-buttons {
    margin-top: 20px;
}

.btn-save {
    background: #4CAF50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn-cancel {
    background: #f44336;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    text-decoration: none;
    margin-left: 10px;
}
</style>