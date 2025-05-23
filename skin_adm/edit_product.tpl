<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../hinhanh/logo.jpg" type="image/x-icon">
    <title>Chỉnh sửa sản phẩm</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- Thêm CSS của Toastr -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

    <!-- Thêm JS của Toastr -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <style>
        /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .edit-form {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 24px;
            color: #2c3e50;
            margin-bottom: 30px;
            text-align: center;
        }

        h3 {
            font-size: 18px;
            color: #2c3e50;
            margin: 25px 0 20px;
            padding-bottom: 10px;
            border-bottom: 1px solid #eee;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 30px;
            margin-bottom: 30px;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #2c3e50;
        }

        input[type="text"],
        input[type="number"],
        select,
        textarea {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        select:focus,
        textarea:focus {
            border-color: #3498db;
            box-shadow: 0 0 0 2px rgba(52, 152, 219, 0.2);
            outline: none;
        }

        .image-upload {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .image-preview {
            width: 200px;
            height: 150px;
            border: 2px dashed #ddd;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }

        .image-preview img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }

        .file-input {
            display: none;
        }

        .file-label {
            display: inline-block;
            padding: 8px 16px;
            background-color: #3498db;
            color: white;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            text-align: center;
        }

        .file-label:hover {
            background-color: #2980b9;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .checkbox-group label {
            margin-bottom: 0;
            cursor: pointer;
        }

        .form-actions {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .btn {
            padding: 10px 24px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
        }

        .btn-cancel {
            background-color: #fff;
            border: 1px solid #ddd;
            color: #666;
        }

        .btn-cancel:hover {
            background-color: #f5f5f5;
        }

        .btn-save {
            background-color: #3498db;
            color: white;
        }

        .btn-save:hover {
            background-color: #2980b9;
        }

        /* Error states */
        input:invalid,
        select:invalid,
        textarea:invalid {
            border-color: #e74c3c;
        }

        /* Loading state */
        .btn-save.loading {
            opacity: 0.7;
            cursor: not-allowed;
        }

        /* Responsive adjustments */
        @media (max-width: 480px) {
            .container {
                margin: 20px auto;
            }

            .edit-form {
                padding: 20px;
            }

            .form-actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="edit-form">
            <h2>Chỉnh sửa sản phẩm</h2>

            <form id="productForm">
                <div class="form-sections" id_product="{id}">
                    <!-- Thông tin cơ bản -->
                    <div class="form-section">
                        <h3>Thông tin cơ bản</h3>
                        <div class="form-grid">
                            <div class="form-left">
                                <div class="form-group">
                                    <label for="name">Tên sản phẩm</label>
                                    <input type="text" id="name" value="{name_car}" name="name" required>
                                </div>

                                <div class="form-group">
                                    <label for="category">Danh mục xe</label>
                                    <select id="category" value="{category_name}" name="category_id" required>
                                        <option value="{category_id}">{category_name}</option>
                                        {list_category}
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label for="price">Giá (VNĐ)</label>
                                    <input type="text" id="price" value="{price}" name="price" min="0" step="0.01"
                                        required>
                                </div>

                                <div class="form-group">
                                    <label for="stock">Số lượng trong kho</label>
                                    <input type="number" id="stock" value="{stock}" name="stock" min="0" required>
                                </div>
                            </div>

                            <div class="form-right">
                                <div class="form-group">
                                    <label for="description">Mô tả chung</label>
                                    <textarea id="description" value="{description_car}" name="description"
                                        rows="4">{description_car}</textarea>
                                </div>

                                <div class="form-group">
                                    <label>Hình ảnh</label>
                                    <div class="image-upload">
                                        <div class="image-preview" id="imagePreview">
                                            <img src="../uploads/{image_car}" alt="Preview" id="preview">
                                            <!-- <span class="placeholder">Chưa có ảnh</span> -->
                                        </div>
                                        <input type="hidden" name="current_image" id="current_image">
                                        <input type="file" id="image" name="image" accept="image/*" required>
                                    </div>
                                </div>

                                <div class="form-group checkbox-group">
                                    <label for="featured">Sản phẩm nổi bật</label>
                                    <select id="featured" value="{featured}" name="featured" style="width: 17%;">
                                        <option value="{featured}">{name_featured}</option>
                                        <option value="1">Có</option>
                                        <option value="0">Không</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Thông số kỹ thuật -->
                    <div class="form-section">
                        <h3>Thông số kỹ thuật</h3>
                        <div class="form-grid">
                            <div class="form-left">
                                <div class="form-group">
                                    <label for="engine_type">Loại động cơ</label>
                                    <input type="text" id="engine_type" value="{engine_type}" name="engine_type">
                                </div>

                                <div class="form-group">
                                    <label for="displacement">Dung tích xi lanh (cc)</label>
                                    <input type="number" id="displacement" value="{displacement_cc}"
                                        name="displacement_cc">
                                </div>

                                <div class="form-group">
                                    <label for="horsepower">Công suất (HP)</label>
                                    <input type="number" id="horsepower" value="{horsepower_hp}" name="horsepower_hp">
                                </div>

                                <div class="form-group">
                                    <label for="torque">Mô-men xoắn (Nm)</label>
                                    <input type="number" id="torque" value="{torque_nm}" name="torque_nm">
                                </div>
                            </div>

                            <div class="form-right">
                                <div class="form-group">
                                    <label for="transmission">Hộp số</label>
                                    <input type="text" id="transmission" value="{transmission_type}"
                                        name="transmission_type">
                                </div>

                                <div class="form-group">
                                    <label for="drive_type">Dẫn động</label>
                                    <input type="text" id="drive_type" value="{drive_type}" name="drive_type">
                                </div>

                                <div class="form-group">
                                    <label for="fuel_consumption">Mức tiêu thụ nhiên liệu (L/100km)</label>
                                    <input type="number" id="fuel_consumption" value="{fuel_consumption_l_100km}"
                                        name="fuel_consumption_l_100km" step="0.1">
                                </div>

                                <div class="form-group">
                                    <label for="acceleration">Tăng tốc 0-100 km/h (giây)</label>
                                    <input type="number" id="acceleration" value="{acceleration_0_100_s}"
                                        name="acceleration_0_100_s" step="0.1">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Kích thước & Tính năng -->
                    <div class="form-section">
                        <h3>Kích thước & Tính năng</h3>
                        <div class="form-grid">
                            <div class="form-left">
                                <div class="form-group">
                                    <label for="length">Chiều dài (mm)</label>
                                    <input type="number" id="length" value="{length_mm}" name="length_mm">
                                </div>

                                <div class="form-group">
                                    <label for="width">Chiều rộng (mm)</label>
                                    <input type="number" id="width" value="{width_mm}" name="width_mm">
                                </div>

                                <div class="form-group">
                                    <label for="height">Chiều cao (mm)</label>
                                    <input type="number" id="height" value="{height_mm}" name="height_mm">
                                </div>

                                <div class="form-group">
                                    <label for="top_speed">Tốc độ tối đa (km/h)</label>
                                    <input type="number" id="top_speed" value="{top_speed_kmh}" name="top_speed_kmh">
                                </div>
                            </div>

                            <div class="form-right">
                                <div class="form-group">
                                    <label for="interior_features">Tính năng nội thất</label>
                                    <textarea id="interior_features" value="{interior_features}"
                                        name="interior_features" rows="4">{interior_features}</textarea>
                                </div>

                                <div class="form-group">
                                    <label for="safety_features">Tính năng an toàn</label>
                                    <textarea id="safety_features" value="{safety_features}" name="safety_features"
                                        rows="4">{safety_features}</textarea>
                                </div>

                                <div class="form-group">
                                    <label for="color_options">Các màu sắc</label>
                                    <textarea id="color_options" value="{color_options}" name="color_options"
                                        rows="2">{color_options}</textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="button" class="btn btn-cancel" onclick="history.back()">Quay lại</button>
                    <button type="button" class="btn btn-edit_product">Lưu thay đổi</button>
                </div>
            </form>
        </div>
    </div>
</body>
<script src="../skin_adm/js/process.js"></script>

</html>