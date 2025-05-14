-- Tạo cơ sở dữ liệu
DROP DATABASE IF EXISTS mercedes_shop;
CREATE DATABASE mercedes_shop;
USE mercedes_shop;

-- Tạo bảng users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role ENUM('admin', 'user', 'guest') DEFAULT 'guest',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng categories
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    slug VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tạo bảng products
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    description TEXT,
    price DECIMAL(15,2) NOT NULL,
    image VARCHAR(255),
    stock INT DEFAULT 0,
    featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Tạo bảng orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(15,2) NOT NULL,
    status ENUM('pending', 'processing', 'completed', 'cancelled') DEFAULT 'pending',
    shipping_address TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Tạo bảng order_items
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(15,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tạo bảng test_drives
CREATE TABLE test_drives (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NULL,
    full_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(100),
    product_id INT NOT NULL,
    preferred_date DATE NOT NULL,
    preferred_time TIME NOT NULL,
    status ENUM('pending', 'confirmed', 'completed', 'cancelled') DEFAULT 'pending',
    notes TEXT,
    location VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tạo bảng contacts
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    status ENUM('new', 'read', 'replied') DEFAULT 'new',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Chèn dữ liệu mẫu cho categories
INSERT INTO categories (name, slug, description) VALUES
('Sedan', 'mercedes-sedan', 'Dòng xe sedan sang trọng'),
('SUV', 'mercedes-suv', 'Dòng xe SUV đa dụng'),
('Coupe', 'mercedes-coupe', 'Dòng xe coupe thể thao'),
('A-Class', 'mercedes-a-class', 'Dòng xe sedan/hatchback nhỏ gọn'),
('S-Class', 'mercedes-s-class', 'Dòng sedan hạng sang đầu bảng'),
('G-Class', 'mercedes-g-class', 'Dòng SUV địa hình biểu tượng'),
('Maybach', 'mercedes-maybach', 'Dòng xe siêu sang đỉnh cao'),
('AMG Line', 'mercedes-amg-line', 'Các phiên bản thể thao AMG Line'),
('EQ Series', 'mercedes-eq-series', 'Dòng xe thuần điện Mercedes-EQ'),
('V-Class', 'mercedes-v-class', 'Dòng MPV đa dụng cao cấp');

-- Chèn dữ liệu mẫu cho products
INSERT INTO products (category_id, name, slug, description, price, image, stock, featured) VALUES
(1, 'Mercedes-Benz C-Class', 'mercedes-benz-c-class', 'Sedan hạng sang với thiết kế hiện đại', 1500000.00, 'sanpham1.jpg', 10, TRUE),
(2, 'Mercedes-Benz GLC', 'mercedes-benz-glc', 'SUV đa dụng với không gian rộng rãi', 2000000.00, 'sanpham2.jpg', 8, TRUE),
(3, 'Mercedes-Benz E-Class Coupe', 'mercedes-benz-e-class-coupe', 'Coupe thể thao với thiết kế ấn tượng', 2500000.00, 'sanpham3.png', 5, FALSE),
(1, 'Mercedes-Benz A-Class Sedan', 'mercedes-benz-a-class-sedan', 'Sedan nhỏ gọn, năng động và cá tính', 1200000.00, 'sanpham4.jpg', 12, TRUE),
(2, 'Mercedes-Benz GLE', 'mercedes-benz-gle', 'SUV sang trọng, mạnh mẽ và an toàn', 2800000.00, 'sanpham5.jpg', 7, FALSE),
(3, 'Mercedes-Benz CLA Coupe', 'mercedes-benz-cla-coupe', 'Coupe 4 cửa với phong cách độc đáo', 1900000.00, 'sanpham6.jpg', 9, TRUE),
(1, 'Mercedes-Benz S-Class', 'mercedes-benz-s-class-sedan', 'Đỉnh cao sedan hạng sang, công nghệ tiên tiến', 4500000.00, 'sanpham7.jpg', 4, TRUE),
(2, 'Mercedes-Benz G-Class', 'mercedes-benz-g-class-suv', 'Biểu tượng SUV địa hình, huyền thoại off-road', 5500000.00, 'sanpham8.jpg', 3, TRUE),
(3, 'Mercedes-AMG GT Coupe', 'mercedes-amg-gt-coupe', 'Siêu xe thể thao hiệu suất cao', 7000000.00, 'sanpham9.jpg', 2, FALSE),
(1, 'Mercedes-Benz E-Class Sedan', 'mercedes-benz-e-class-sedan', 'Sedan doanh nhân, lịch lãm và đẳng cấp', 2200000.00, 'sanpham10.jpg', 11, TRUE),
(2, 'Mercedes-Benz GLS', 'mercedes-benz-gls', 'SUV full-size, không gian cho cả gia đình', 3500000.00, 'sanpham11.jpg', 6, FALSE),
(3, 'Mercedes-Benz C-Class Coupe', 'mercedes-benz-c-class-coupe', 'Coupe thanh lịch, trẻ trung và thể thao', 1800000.00, 'sanpham12.jpg', 8, TRUE),
(1, 'Mercedes-Maybach S-Class', 'mercedes-maybach-s-class', 'Siêu sang, trải nghiệm thượng lưu tuyệt đối', 10000000.00, 'sanpham13.jpg', 2, TRUE),
(2, 'Mercedes-Benz GLA', 'mercedes-benz-gla', 'SUV cỡ nhỏ, linh hoạt trong đô thị', 1600000.00, 'sanpham14.jpg', 15, FALSE),
(3, 'Mercedes-Benz S-Class Coupe', 'mercedes-benz-s-class-coupe', 'Coupe sang trọng bậc nhất, thiết kế quyến rũ', 5000000.00, 'sanpham15.jpg', 3, TRUE),
(1, 'Mercedes-AMG C 63 S Sedan', 'mercedes-amg-c63s-sedan', 'Sedan hiệu suất cao, cảm giác lái phấn khích', 3800000.00, 'sanpham16.jpg', 5, TRUE),
(2, 'Mercedes-AMG GLE 53 Coupe', 'mercedes-amg-gle53-coupe', 'SUV Coupe thể thao, động cơ mạnh mẽ', 4200000.00, 'sanpham17.jpg', 4, FALSE),
(3, 'Mercedes-AMG GT 4-Door Coupe', 'mercedes-amg-gt-4-door-coupe', 'Coupe 4 cửa hiệu suất đỉnh cao', 8000000.00, 'sanpham18.jpg', 2, TRUE),
(1, 'Mercedes-Benz EQS Sedan', 'mercedes-benz-eqs-sedan', 'Sedan thuần điện tương lai, sang trọng và bền vững', 4000000.00, 'sanpham19.jpg', 6, TRUE),
(2, 'Mercedes-Benz EQB', 'mercedes-benz-eqb', 'SUV thuần điện 7 chỗ, thực dụng và hiện đại', 2300000.00, 'sanpham20.jpg', 7, FALSE),
(4, 'Mercedes-Benz A200 Sedan', 'mercedes-benz-a200-sedan', 'A-Class Sedan tiêu chuẩn, tiện nghi và hiệu quả', 1350000.00, 'sanpham21.jpg', 10, TRUE),
(5, 'Mercedes-Maybach S680', 'mercedes-maybach-s680', 'Tuyệt tác siêu sang, động cơ V12 mạnh mẽ', 15000000.00, 'sanpham22.jpg', 1, TRUE),
(6, 'Mercedes-AMG G63', 'mercedes-amg-g63', 'SUV địa hình hiệu suất cao, phong cách hầm hố', 11000000.00, 'sanpham23.jpg', 2, TRUE),
(9, 'Mercedes-Benz EQS 580 4MATIC SUV', 'mercedes-eqs-580-suv', 'SUV điện hạng sang, công nghệ đỉnh cao', 6000000.00, 'sanpham24.jpg', 4, FALSE),
(8, 'Mercedes-AMG A35 Hatchback', 'mercedes-amg-a35-hatchback', 'Hatchback thể thao AMG, nhanh nhẹn và cá tính', 2500000.00, 'sanpham25.jpg', 6, TRUE),
(10, 'Mercedes-Benz V250 AMG', 'mercedes-benz-v250-amg', 'MPV hạng sang với gói thể thao AMG', 3000000.00, 'sanpham26.jpg', 5, FALSE),
(7, 'Mercedes-Maybach GLS 600', 'mercedes-maybach-gls-600', 'SUV siêu sang, không gian xa hoa và tiện nghi', 12000000.00, 'sanpham27.jpg', 2, TRUE),
(9, 'Mercedes-Benz EQC 400 4MATIC', 'mercedes-eqc-400', 'SUV điện đầu tiên của Mercedes-EQ, vận hành êm ái', 3200000.00, 'sanpham28.jpg', 7, TRUE),
(1, 'Mercedes-Benz CLS 450 4MATIC', 'mercedes-cls-450', 'Coupe 4 cửa, thiết kế quyến rũ và động cơ I6', 3700000.00, 'sanpham29.jpg', 4, FALSE),
(8, 'Mercedes-AMG GT R', 'mercedes-amg-gt-r', 'Quái thú đường đua, hiệu suất cực đỉnh', 11500000.00, 'sanpham30.jpg', 1, TRUE);

-- Tạo bảng product_details
CREATE TABLE product_details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT UNIQUE,
    engine_type VARCHAR(100),
    displacement_cc INT,
    horsepower_hp INT,
    torque_nm INT,
    transmission_type VARCHAR(50),
    drive_type VARCHAR(50),
    length_mm INT,
    width_mm INT,
    height_mm INT,
    fuel_consumption_l_100km DECIMAL(5,2),
    acceleration_0_100_s DECIMAL(4,1),
    top_speed_kmh INT,
    interior_features TEXT,
    safety_features TEXT,
    color_options TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Chèn dữ liệu mẫu cho product_details (ví dụ cho một vài sản phẩm mới)
INSERT INTO product_details (product_id, engine_type, displacement_cc, horsepower_hp, torque_nm, transmission_type, drive_type, length_mm, width_mm, height_mm, fuel_consumption_l_100km, acceleration_0_100_s, top_speed_kmh, interior_features, safety_features, color_options) VALUES
(21, 'I4 Turbo', 1332, 163, 250, '7G-DCT', 'FWD', 4549, 1796, 1446, 5.4, 8.1, 230, 'MBUX, Da Artico, Đèn viền nội thất', 'Active Brake Assist, Attention Assist', 'Trắng Polar, Đen Cosmos, Xanh Denim'),
(22, 'V12 Biturbo', 5980, 621, 900, '9G-TRONIC', 'AWD (4MATIC)', 5469, 1921, 1503, 13.5, 4.5, 250, 'Da Nappa cao cấp, Hệ thống âm thanh Burmester High-End 4D, Ghế massage đa chế độ', 'PRE-SAFE Impulse Side, E-ACTIVE BODY CONTROL', 'Đen Obsidian, Bạc Iridium, Xanh Emerald'),
(23, 'V8 Biturbo', 3982, 585, 850, 'AMG SPEEDSHIFT TCT 9G', 'AWD (4MATIC)', 4873, 1984, 1969, 13.1, 4.5, 220, 'Da Nappa AMG, Vô lăng AMG Performance, Hệ thống ống xả AMG Performance', 'AMG RIDE CONTROL, Active Lane Keeping Assist', 'Đen Night Magno, Xanh Olive, Xám Selenite Magno'),
(24, 'Electric Motor (Dual)', NULL, 516, 855, 'Single Speed Automatic', 'AWD (4MATIC)', 5216, 1926, 1718, NULL, 4.6, 210, 'MBUX Hyperscreen, Da Nappa, Hệ thống lọc không khí HEPA', 'Driving Assistance Package Plus, Digital Light', 'Trắng Diamond, Đen Obsidian, Xanh Sodalite'),
(30, 'V8 Biturbo', 3982, 585, 700, 'AMG SPEEDSHIFT DCT 7G', 'RWD', 4551, 2007, 1284, 11.4, 3.6, 318, 'Ghế đua AMG Carbon, Vật liệu Dinamica, AMG Track Pace', 'AMG Traction Control, Phanh gốm AMG carbon', 'Xanh Green Hell Magno, Vàng Solarbeam, Đỏ Jupiter');

-- Chèn dữ liệu mẫu cho product_details cho các sản phẩm còn lại (cần cập nhật thông tin chính xác)
INSERT INTO product_details (product_id, engine_type, displacement_cc, horsepower_hp, torque_nm, transmission_type, drive_type, length_mm, width_mm, height_mm, fuel_consumption_l_100km, acceleration_0_100_s, top_speed_kmh, interior_features, safety_features, color_options) VALUES
(1, 'I4 Turbo', 1991, 204, 300, '9G-TRONIC', 'RWD', 4751, 1820, 1438, 6.5, 7.3, 246, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(2, 'I4 Turbo', 1991, 258, 400, '9G-TRONIC', 'AWD (4MATIC)', 4716, 1890, 1640, 7.4, 6.2, 240, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(3, 'I6 Turbo', 2999, 367, 500, '9G-TRONIC', 'RWD', 4835, 1860, 1430, 8.0, 5.0, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(4, 'I4 Turbo', 1332, 163, 250, '7G-DCT', 'FWD', 4549, 1796, 1446, 5.4, 8.1, 230, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(5, 'I6 Turbo', 2999, 367, 500, '9G-TRONIC', 'AWD (4MATIC)', 4924, 2010, 1797, 9.0, 5.7, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(6, 'I4 Turbo', 1991, 224, 350, '7G-DCT', 'FWD/AWD (4MATIC)', 4688, 1830, 1439, 6.2, 6.3, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(7, 'V8 Biturbo', 3982, 503, 700, '9G-TRONIC', 'RWD/AWD (4MATIC)', 5289, 1954, 1503, 10.5, 4.4, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(8, 'V8 Biturbo', 3982, 422, 610, '9G-TRONIC', 'AWD (4MATIC)', 4817, 1931, 1969, 12.1, 5.9, 210, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(9, 'V8 Biturbo', 3982, 530, 670, 'AMG SPEEDSHIFT MCT 7G', 'RWD', 4546, 1939, 1288, 11.5, 3.8, 310, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(10, 'I4 Turbo', 1991, 258, 400, '9G-TRONIC', 'RWD', 4935, 1852, 1468, 6.8, 6.1, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(11, 'I6 Turbo/V8 Biturbo', NULL, NULL, NULL, '9G-TRONIC', 'AWD (4MATIC)', 5207, 2030, 1838, NULL, NULL, NULL, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(12, 'I4 Turbo', 1991, 258, 400, '9G-TRONIC', 'RWD/AWD (4MATIC)', 4693, 1810, 1405, 6.9, 6.0, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(13, 'V8 Biturbo/V12 Biturbo', NULL, NULL, NULL, '9G-TRONIC', 'AWD (4MATIC)', 5469, 1921, 1503, NULL, NULL, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(14, 'I4 Turbo', 1332, 163, 250, '7G-DCT/8G-DCT', 'FWD/AWD (4MATIC)', 4410, 1834, 1611, 5.7, 8.7, 209, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(15, 'V8 Biturbo', 3982, 469, 700, '9G-TRONIC', 'RWD/AWD (4MATIC)', 5027, 1899, 1411, 10.1, 4.6, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(16, 'V8 Biturbo', 3982, 510, 700, 'AMG SPEEDSHIFT MCT 9G', 'RWD', 4751, 1839, 1426, 10.8, 4.0, 290, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(17, 'I6 Turbo + EQ Boost', 2999, 435, 520, 'AMG SPEEDSHIFT TCT 9G', 'AWD (4MATIC+)', 4961, 2018, 1716, 9.3, 5.3, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(18, 'V8 Biturbo', 3982, 639, 900, 'AMG SPEEDSHIFT MCT 9G', 'AWD (4MATIC+)', 5054, 1953, 1447, 11.3, 3.2, 315, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(19, 'Electric Motor', NULL, 523, 855, 'Single Speed Automatic', 'AWD (4MATIC)', 5216, 1926, 1512, NULL, 4.3, 210, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(20, 'Electric Motor', NULL, 292, 520, 'Single Speed Automatic', 'AWD (4MATIC)', 4684, 1834, 1668, NULL, 6.2, 160, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(25, 'I4 Turbo', 1991, 306, 400, 'AMG SPEEDSHIFT DCT 7G', 'AWD (4MATIC)', 4439, 1796, 1400, 7.3, 4.7, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(26, 'I4 Diesel', 1950, 190, 440, '9G-TRONIC', 'RWD', 5140, 1928, 1880, 6.5, 9.5, 206, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(27, 'V8 Biturbo + EQ Boost', 3982, 558, 730, '9G-TRONIC', 'AWD (4MATIC)', 5205, 2030, 1838, 12.0, 4.9, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(28, 'Electric Motor (Dual)', NULL, 408, 760, 'Single Speed Automatic', 'AWD (4MATIC)', 4761, 1884, 1623, NULL, 5.1, 180, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết'),
(29, 'I6 Turbo + EQ Boost', 2999, 367, 500, '9G-TRONIC', 'AWD (4MATIC)', 4988, 1890, 1435, 7.8, 4.8, 250, 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết', 'Cần cập nhật chi tiết');

-- Chèn dữ liệu mẫu cho users
INSERT INTO users (username, password, email, full_name, phone, address, role) VALUES
('admin', 'ea48576f30be1669971699c09ad05c94', 'admin@mercedes.com', 'Administrator', NULL, NULL, 'admin'),
('Nguyên', '4297f44b13955235245b2497399d7a93', 'khiem123@gmail.com', 'Nguyễn Văn Nguyên', '0987777777', 'Đông Anh', 'user'); 