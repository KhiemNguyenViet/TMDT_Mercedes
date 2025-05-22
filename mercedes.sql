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
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    avatar VARCHAR(255) NOT NULL
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
    product_id INT NOT NULL,
    salutation VARCHAR(10) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    contact_address TEXT,
    total_amount DECIMAL(15,2) NOT NULL,
    deposit_amount DECIMAL(15,2) NOT NULL DEFAULT 10000000.00,
    payment_notes TEXT,
    bank_account_number VARCHAR(50),
    bank_account_name VARCHAR(255),
    bank_name VARCHAR(100),
    bank_branch VARCHAR(100),
    dealer VARCHAR(255) NOT NULL,
    sales_person VARCHAR(255),
    status ENUM('pending', 'processing', 'completed', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    image_thanhtoan VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (product_id) REFERENCES products(id)
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
    user_id INT,
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

-- Chèn dữ liệu mẫu cho categories
INSERT INTO categories (name, slug, description, created_at) VALUES
('Sedan', 'mercedes-sedan', 'Dòng xe sedan sang trọng', '2025-05-14 17:17:10'),
('SUV', 'mercedes-suv', 'Dòng xe SUV đa dụng', '2025-05-14 17:17:10'),
('Coupe', 'mercedes-coupe', 'Dòng xe coupe thể thao', '2025-05-14 17:17:10'),
('A-Class', 'mercedes-a-class', 'Dòng xe sedan/hatchback nhỏ gọn', '2025-05-14 17:17:10'),
('S-Class', 'mercedes-s-class', 'Dòng sedan hạng sang đầu bảng', '2025-05-14 17:17:10'),
('G-Class', 'mercedes-g-class', 'Dòng SUV địa hình biểu tượng', '2025-05-14 17:17:10'),
('Maybach', 'mercedes-maybach', 'Dòng xe siêu sang đỉnh cao', '2025-05-14 17:17:10'),
('AMG Line', 'mercedes-amg-line', 'Các phiên bản thể thao AMG Line', '2025-05-14 17:17:10'),
('EQ Series', 'mercedes-eq-series', 'Dòng xe thuần điện Mercedes-EQ', '2025-05-14 17:17:10'),
('V-Class', 'mercedes-v-class', 'Dòng MPV đa dụng cao cấp', '2025-05-14 17:17:10');

-- Chèn dữ liệu mẫu cho products
INSERT INTO products (category_id, name, slug, description, price, image, stock, featured, created_at) VALUES
(1, 'Mercedes-Benz C 300 AMG', 'mercedes-benz-c300-amg', 'Sedan hạng sang với thiết kế hiện đại và hiệu suất cao', 1900000000.00, '1747879141_b1641351da0d741c3a3cfceb5e07c789.jpg', 10, TRUE, '2025-05-14 17:17:10'),
(2, 'Mercedes-Benz GLC 300 4MATIC', 'mercedes-benz-glc300-4matic', 'SUV đa dụng với không gian rộng rãi và công nghệ tiên tiến', 2500000000.00, 'sanpham2.jpg', 8, TRUE, '2025-05-14 17:17:10'),
(3, 'Mercedes-Benz E-Class Coupe', 'mercedes-benz-e-class-coupe', 'Coupe thể thao với thiết kế ấn tượng', 3200000000.00, 'sanpham3.png', 5, FALSE, '2025-05-14 17:17:10'),
(1, 'Mercedes-Benz A 200 Sedan', 'mercedes-benz-a200-sedan', 'Sedan nhỏ gọn, năng động và cá tính', 1450000000.00, 'sanpham4.jpg', 12, TRUE, '2025-05-14 17:17:10'),
(2, 'Mercedes-Benz GLE 450 4MATIC', 'mercedes-benz-gle450-4matic', 'SUV sang trọng, mạnh mẽ và an toàn', 4200000000.00, 'sanpham5.jpg', 7, FALSE, '2025-05-14 17:17:10'),
(3, 'Mercedes-Benz CLA 250 Coupe', 'mercedes-benz-cla250-coupe', 'Coupe 4 cửa với phong cách độc đáo', 2000000000.00, 'sanpham6.jpg', 9, TRUE, '2025-05-14 17:17:10'),
(1, 'Mercedes-Benz S 500 4MATIC', 'mercedes-benz-s500-4matic', 'Đỉnh cao sedan hạng sang, công nghệ tiên tiến', 5500000000.00, 'sanpham7.jpg', 4, TRUE, '2025-05-14 17:17:10'),
(2, 'Mercedes-Benz G 500', 'mercedes-benz-g500', 'Biểu tượng SUV địa hình, huyền thoại off-road', 6500000000.00, 'sanpham8.jpg', 3, TRUE, '2025-05-14 17:17:10'),
(3, 'Mercedes-AMG GT 53 4-Door Coupe', 'mercedes-amg-gt53-4door', 'Coupe 4 cửa hiệu suất cao', 7500000000.00, 'sanpham9.jpg', 2, FALSE, '2025-05-14 17:17:10'),
(1, 'Mercedes-Benz E 300 AMG', 'mercedes-benz-e300-amg', 'Sedan doanh nhân, lịch lãm và đẳng cấp', 2900000000.00, 'sanpham10.jpg', 11, TRUE, '2025-05-14 17:17:10'),
(2, 'Mercedes-Benz GLS 450 4MATIC', 'mercedes-benz-gls450-4matic', 'SUV full-size, không gian cho cả gia đình', 4800000000.00, 'sanpham11.jpg', 6, FALSE, '2025-05-14 17:17:10'),
(3, 'Mercedes-Benz C-Class Coupe', 'mercedes-benz-c-class-coupe', 'Coupe thanh lịch, trẻ trung và thể thao', 2200000000.00, 'sanpham12.jpg', 8, TRUE, '2025-05-14 17:17:10'),
(1, 'Mercedes-Maybach S 580 4MATIC', 'mercedes-maybach-s580-4matic', 'Siêu sang, trải nghiệm thượng lưu tuyệt đối', 11000000000.00, 'sanpham13.jpg', 2, TRUE, '2025-05-14 17:17:10'),
(2, 'Mercedes-Benz GLA 200', 'mercedes-benz-gla200', 'SUV cỡ nhỏ, linh hoạt trong đô thị', 1800000000.00, 'sanpham14.jpg', 15, FALSE, '2025-05-14 17:17:10'),
(3, 'Mercedes-Benz S-Class Coupe', 'mercedes-benz-s-class-coupe', 'Coupe sang trọng bậc nhất, thiết kế quyến rũ', 6000000000.00, 'sanpham15.jpg', 3, TRUE, '2025-05-14 17:17:10'),
(1, 'Mercedes-AMG C 63 S', 'mercedes-amg-c63s', 'Sedan hiệu suất cao, cảm giác lái phấn khích', 4500000000.00, 'sanpham16.jpg', 5, TRUE, '2025-05-14 17:17:10'),
(2, 'Mercedes-AMG GLE 53 4MATIC+ Coupe', 'mercedes-amg-gle53-4matic-coupe', 'SUV Coupe thể thao, động cơ mạnh mẽ', 5200000000.00, 'sanpham17.jpg', 4, FALSE, '2025-05-14 17:17:10'),
(3, 'Mercedes-AMG GT 63 4-Door Coupe', 'mercedes-amg-gt63-4door', 'Coupe 4 cửa hiệu suất đỉnh cao', 8500000000.00, 'sanpham18.jpg', 2, TRUE, '2025-05-14 17:17:10'),
(1, 'Mercedes-Benz EQS 450+', 'mercedes-benz-eqs450', 'Sedan thuần điện tương lai, sang trọng và bền vững', 4500000000.00, 'sanpham19.jpg', 6, TRUE, '2025-05-14 17:17:10'),
(2, 'Mercedes-Benz EQB 350 4MATIC', 'mercedes-benz-eqb350-4matic', 'SUV thuần điện 7 chỗ, thực dụng và hiện đại', 2800000000.00, 'sanpham20.jpg', 7, FALSE, '2025-05-14 17:17:10'),
(4, 'Mercedes-Benz A 200 Sedan', 'mercedes-benz-a200-sedan-2', 'A-Class Sedan tiêu chuẩn, tiện nghi và hiệu quả', 1450000000.00, 'sanpham21.jpg', 10, TRUE, '2025-05-14 17:17:10'),
(5, 'Mercedes-Maybach S 680 4MATIC', 'mercedes-maybach-s680-4matic', 'Tuyệt tác siêu sang, động cơ V12 mạnh mẽ', 18000000000.00, 'sanpham22.jpg', 1, TRUE, '2025-05-14 17:17:10'),
(6, 'Mercedes-AMG G 63', 'mercedes-amg-g63', 'SUV địa hình hiệu suất cao, phong cách hầm hố', 12000000000.00, 'sanpham23.jpg', 2, TRUE, '2025-05-14 17:17:10'),
(9, 'Mercedes-Benz EQS 580 4MATIC SUV', 'mercedes-eqs-580-suv', 'SUV điện hạng sang, công nghệ đỉnh cao', 6500000000.00, 'sanpham24.jpg', 4, FALSE, '2025-05-14 17:17:10'),
(8, 'Mercedes-AMG A 35 4MATIC', 'mercedes-amg-a35-4matic', 'Hatchback thể thao AMG, nhanh nhẹn và cá tính', 2600000000.00, 'sanpham25.jpg', 6, TRUE, '2025-05-14 17:17:10'),
(10, 'Mercedes-Benz V 250 AMG', 'mercedes-benz-v250-amg', 'MPV hạng sang với gói thể thao AMG', 3500000000.00, 'sanpham26.jpg', 5, FALSE, '2025-05-14 17:17:10'),
(7, 'Mercedes-Maybach GLS 600 4MATIC', 'mercedes-maybach-gls600-4matic', 'SUV siêu sang, không gian xa hoa và tiện nghi', 14000000000.00, 'sanpham27.jpg', 2, TRUE, '2025-05-14 17:17:10'),
(9, 'Mercedes-Benz EQC 400 4MATIC', 'mercedes-eqc-400-4matic', 'SUV điện đầu tiên của Mercedes-EQ, vận hành êm ái', 3500000000.00, 'sanpham28.jpg', 7, TRUE, '2025-05-14 17:17:10'),
(1, 'Mercedes-Benz CLS 450 4MATIC', 'mercedes-cls-450-4matic', 'Coupe 4 cửa, thiết kế quyến rũ và động cơ I6', 4000000000.00, 'sanpham29.jpg', 4, FALSE, '2025-05-14 17:17:10'),
(8, 'Mercedes-AMG GT R', 'mercedes-amg-gt-r', 'Quái thú đường đua, hiệu suất cực đỉnh', 12500000000.00, '1747882153_6f5ba8e5d233a2297de18478709c82f6.jpg', 1, TRUE, '2025-05-14 17:17:10');

-- Chèn dữ liệu mẫu cho product_details
INSERT INTO product_details (product_id, engine_type, displacement_cc, horsepower_hp, torque_nm, transmission_type, drive_type, length_mm, width_mm, height_mm, fuel_consumption_l_100km, acceleration_0_100_s, top_speed_kmh, interior_features, safety_features, color_options, created_at) VALUES
(1, 'I4 Turbo + EQ Boost', 1991, 258, 400, '9G-TRONIC', 'RWD', 4751, 1820, 1438, 6.80, 6.2, 250, 'MBUX, Da Artico, Đèn viền nội thất 64 màu, Ghế thể thao AMG', 'Active Brake Assist, Attention Assist, Blind Spot Assist', 'Trắng Polar, Đen Obsidian, Xám Graphite', '2025-05-14 17:17:10'),
(2, 'I4 Turbo + EQ Boost', 1991, 258, 400, '9G-TRONIC', 'AWD (4MATIC)', 4716, 1890, 1640, 7.30, 6.2, 240, 'MBUX, Da Artico, Hệ thống âm thanh Burmester, Đèn viền nội thất', 'Active Distance Assist DISTRONIC, PRE-SAFE, 360 Camera', 'Bạc Iridium, Đen Obsidian, Xanh Cavansite', '2025-05-14 17:17:10'),
(3, 'I6 Turbo + EQ Boost', 2999, 367, 500, '9G-TRONIC', 'RWD', 4835, 1860, 1430, 7.90, 5.0, 250, 'MBUX, Da Nappa, Ghế chỉnh điện đa hướng, Hệ thống âm thanh Burmester', 'PRE-SAFE, Active Lane Keeping Assist, Blind Spot Assist', 'Đen Obsidian, Trắng Diamond, Đỏ Hyacinth', '2025-05-14 17:17:10'),
(4, 'I4 Turbo', 1332, 163, 250, '7G-DCT', 'FWD', 4549, 1796, 1446, 5.40, 8.1, 230, 'MBUX, Da Artico, Đèn viền nội thất, Ghế thể thao', 'Active Brake Assist, Attention Assist, Parking Assist', 'Trắng Polar, Đen Cosmos, Xanh Denim', '2025-05-14 17:17:10'),
(5, 'I6 Turbo + EQ Boost', 2999, 367, 500, '9G-TRONIC', 'AWD (4MATIC)', 4924, 2010, 1797, 8.90, 5.7, 250, 'MBUX Hyperscreen, Da Nappa, Ghế massage, Hệ thống âm thanh Burmester', 'E-ACTIVE BODY CONTROL, PRE-SAFE Impulse Side, 360 Camera', 'Bạc High-Tech, Đen Obsidian, Xanh Emerald', '2025-05-14 17:17:10'),
(6, 'I4 Turbo', 1991, 224, 350, '7G-DCT', 'AWD (4MATIC)', 4688, 1830, 1439, 6.20, 6.3, 250, 'MBUX, Da Artico, Ghế thể thao, Đèn viền nội thất 64 màu', 'Active Brake Assist, Blind Spot Assist, Lane Keeping Assist', 'Trắng Polar, Đen Night, Xám Mountain', '2025-05-14 17:17:10'),
(7, 'V6 Turbo + EQ Boost', 2999, 435, 520, '9G-TRONIC', 'AWD (4MATIC)', 5289, 1954, 1503, 9.50, 4.8, 250, 'MBUX Hyperscreen, Da Nappa, Ghế massage, Hệ thống âm thanh Burmester 4D', 'PRE-SAFE Impulse Side, E-ACTIVE BODY CONTROL, Digital Light', 'Đen Obsidian, Bạc Iridium, Trắng Diamond', '2025-05-14 17:17:10'),
(8, 'V8 Biturbo', 3982, 422, 610, '9G-TRONIC', 'AWD (4MATIC)', 4817, 1931, 1969, 11.50, 5.9, 210, 'Da Nappa, Hệ thống âm thanh Burmester, Đèn viền nội thất', 'AMG RIDE CONTROL, Active Lane Keeping Assist, 360 Camera', 'Đen Night Magno, Trắng Polar, Xanh Olive', '2025-05-14 17:17:10'),
(9, 'I6 Turbo + EQ Boost', 2999, 435, 520, 'AMG SPEEDSHIFT TCT 9G', 'AWD (4MATIC+)', 5054, 1953, 1447, 8.50, 4.5, 270, 'Da Nappa AMG, Vô lăng AMG Performance, Hệ thống âm thanh Burmester', 'AMG RIDE CONTROL, Active Brake Assist, Blind Spot Assist', 'Xám Selenite, Đen Obsidian, Trắng Diamond', '2025-05-14 17:17:10'),
(10, 'I4 Turbo + EQ Boost', 1991, 258, 400, '9G-TRONIC', 'RWD', 4935, 1852, 1468, 6.80, 6.1, 250, 'MBUX, Da Artico, Ghế chỉnh điện, Đèn viền nội thất 64 màu', 'PRE-SAFE, Active Distance Assist DISTRONIC, 360 Camera', 'Bạc Iridium, Đen Obsidian, Xanh Nautic', '2025-05-14 17:17:10'),
(11, 'V6 Turbo + EQ Boost', 2999, 367, 500, '9G-TRONIC', 'AWD (4MATIC)', 5207, 2030, 1838, 9.20, 5.8, 250, 'MBUX Hyperscreen, Da Nappa, Ghế massage, Hệ thống âm thanh Burmester', 'E-ACTIVE BODY CONTROL, PRE-SAFE, 360 Camera', 'Trắng Diamond, Đen Obsidian, Xanh Sodalite', '2025-05-14 17:17:10'),
(12, 'I4 Turbo + EQ Boost', 1991, 258, 400, '9G-TRONIC', 'RWD', 4693, 1810, 1405, 6.90, 6.0, 250, 'MBUX, Da Artico, Ghế thể thao, Đèn viền nội thất', 'Active Brake Assist, Blind Spot Assist, Parking Assist', 'Trắng Polar, Đen Night, Xám Graphite', '2025-05-14 17:17:10'),
(13, 'V8 Biturbo + EQ Boost', 3982, 503, 700, '9G-TRONIC', 'AWD (4MATIC)', 5469, 1921, 1503, 11.00, 4.6, 250, 'Da Nappa cao cấp, Hệ thống âm thanh Burmester 4D, Ghế massage đa chế độ', 'PRE-SAFE Impulse Side, E-ACTIVE BODY CONTROL, Digital Light', 'Đen Obsidian, Bạc Iridium, Xanh Emerald', '2025-05-14 17:17:10'),
(14, 'I4 Turbo', 1332, 163, 250, '7G-DCT', 'FWD', 4410, 1834, 1611, 5.70, 8.7, 209, 'MBUX, Da Artico, Đèn viền nội thất, Ghế thể thao', 'Active Brake Assist, Attention Assist, Parking Assist', 'Trắng Polar, Đen Cosmos, Xanh Denim', '2025-05-14 17:17:10'),
(15, 'V8 Biturbo', 3982, 469, 700, '9G-TRONIC', 'RWD', 5027, 1899, 1411, 10.10, 4.6, 250, 'Da Nappa, Hệ thống âm thanh Burmester, Ghế chỉnh điện đa hướng', 'PRE-SAFE, Active Lane Keeping Assist, 360 Camera', 'Đen Obsidian, Trắng Diamond, Đỏ Hyacinth', '2025-05-14 17:17:10'),
(16, 'V8 Biturbo', 3982, 510, 700, 'AMG SPEEDSHIFT MCT 9G', 'RWD', 4751, 1839, 1426, 10.80, 4.0, 290, 'Ghế thể thao AMG, Da Nappa, Vô lăng AMG Performance', 'AMG RIDE CONTROL, Active Brake Assist, Blind Spot Assist', 'Xám Selenite, Đen Night Magno, Trắng Polar', '2025-05-14 17:17:10'),
(17, 'I6 Turbo + EQ Boost', 2999, 435, 520, 'AMG SPEEDSHIFT TCT 9G', 'AWD (4MATIC+)', 4961, 2018, 1716, 9.30, 5.3, 250, 'Da Nappa AMG, MBUX, Hệ thống âm thanh Burmester', 'AMG RIDE CONTROL, PRE-SAFE, 360 Camera', 'Đen Obsidian, Trắng Diamond, Xanh Cavansite', '2025-05-14 17:17:10'),
(18, 'V8 Biturbo', 3982, 639, 900, 'AMG SPEEDSHIFT MCT 9G', 'AWD (4MATIC+)', 5054, 1953, 1447, 11.30, 3.2, 315, 'Da Nappa AMG, Vô lăng AMG Performance, Hệ thống âm thanh Burmester', 'AMG RIDE CONTROL, Active Brake Assist, Digital Light', 'Xám Selenite, Đen Night Magno, Vàng Solarbeam', '2025-05-14 17:17:10'),
(19, 'Electric Motor', NULL, 333, 568, 'Single Speed Automatic', 'RWD', 5216, 1926, 1512, NULL, 5.9, 210, 'MBUX Hyperscreen, Da Nappa, Đèn viền nội thất 64 màu', 'Driving Assistance Package Plus, PRE-SAFE, Digital Light', 'Trắng Diamond, Đen Obsidian, Xanh Sodalite', '2025-05-14 17:17:10'),
(20, 'Electric Motor (Dual)', NULL, 292, 520, 'Single Speed Automatic', 'AWD (4MATIC)', 4684, 1834, 1668, NULL, 6.2, 160, 'MBUX, Da Artico, Ghế 7 chỗ, Đèn viền nội thất', 'Active Brake Assist, Attention Assist, 360 Camera', 'Trắng Polar, Đen Cosmos, Xám Mountain', '2025-05-14 17:17:10'),
(21, 'I4 Turbo', 1332, 163, 250, '7G-DCT', 'FWD', 4549, 1796, 1446, 5.40, 8.1, 230, 'MBUX, Da Artico, Đèn viền nội thất, Ghế thể thao', 'Active Brake Assist, Attention Assist, Parking Assist', 'Trắng Polar, Đen Cosmos, Xanh Denim', '2025-05-14 17:17:10'),
(22, 'V12 Biturbo', 5980, 621, 900, '9G-TRONIC', 'AWD (4MATIC)', 5469, 1921, 1503, 13.50, 4.5, 250, 'Da Nappa cao cấp, Hệ thống âm thanh Burmester High-End 4D, Ghế massage đa chế độ', 'PRE-SAFE Impulse Side, E-ACTIVE BODY CONTROL, Digital Light', 'Đen Obsidian, Bạc Iridium, Xanh Emerald', '2025-05-14 17:17:10'),
(23, 'V8 Biturbo', 3982, 585, 850, 'AMG SPEEDSHIFT TCT 9G', 'AWD (4MATIC)', 4873, 1984, 1969, 13.10, 4.5, 220, 'Da Nappa AMG, Vô lăng AMG Performance, Hệ thống ống xả AMG Performance', 'AMG RIDE CONTROL, Active Lane Keeping Assist, 360 Camera', 'Đen Night Magno, Xanh Olive, Xám Selenite Magno', '2025-05-14 17:17:10'),
(24, 'Electric Motor (Dual)', NULL, 516, 855, 'Single Speed Automatic', 'AWD (4MATIC)', 5216, 1926, 1718, NULL, 4.6, 210, 'MBUX Hyperscreen, Da Nappa, Hệ thống lọc không khí HEPA', 'Driving Assistance Package Plus, Digital Light, 360 Camera', 'Trắng Diamond, Đen Obsidian, Xanh Sodalite', '2025-05-14 17:17:10'),
(25, 'I4 Turbo', 1991, 306, 400, 'AMG SPEEDSHIFT DCT 7G', 'AWD (4MATIC)', 4439, 1796, 1400, 7.30, 4.7, 250, 'Ghế thể thao AMG, Da Artico, Vô lăng AMG Performance', 'AMG RIDE CONTROL, Active Brake Assist, Blind Spot Assist', 'Xám Mountain, Đen Night, Trắng Polar', '2025-05-14 17:17:10'),
(26, 'I4 Diesel', 1950, 190, 440, '9G-TRONIC', 'RWD', 5140, 1928, 1880, 6.50, 9.5, 206, 'MBUX, Da Artico, Ghế chỉnh điện, Hệ thống âm thanh Burmester', 'Active Brake Assist, Attention Assist, 360 Camera', 'Đen Obsidian, Bạc Iridium, Trắng Polar', '2025-05-14 17:17:10'),
(27, 'V8 Biturbo + EQ Boost', 3982, 558, 730, '9G-TRONIC', 'AWD (4MATIC)', 5205, 2030, 1838, 12.00, 4.9, 250, 'Da Nappa cao cấp, Hệ thống âm thanh Burmester 4D, Ghế massage đa chế độ', 'PRE-SAFE Impulse Side, E-ACTIVE BODY CONTROL, Digital Light', 'Đen Obsidian, Trắng Diamond, Xanh Sodalite', '2025-05-14 17:17:10'),
(28, 'Electric Motor (Dual)', NULL, 408, 760, 'Single Speed Automatic', 'AWD (4MATIC)', 4761, 1884, 1623, NULL, 5.1, 180, 'MBUX, Da Artico, Đèn viền nội thất, Hệ thống âm thanh Burmester', 'Driving Assistance Package Plus, PRE-SAFE, 360 Camera', 'Trắng Polar, Đen Obsidian, Xám Graphite', '2025-05-14 17:17:10'),
(29, 'I6 Turbo + EQ Boost', 2999, 367, 500, '9G-TRONIC', 'AWD (4MATIC)', 4988, 1890, 1435, 7.80, 4.8, 250, 'MBUX, Da Nappa, Ghế chỉnh điện đa hướng, Hệ thống âm thanh Burmester', 'PRE-SAFE, Active Distance Assist DISTRONIC, Digital Light', 'Đen Obsidian, Trắng Diamond, Đỏ Hyacinth', '2025-05-14 17:17:10'),
(30, 'V8 Biturbo', 3982, 585, 700, 'AMG SPEEDSHIFT DCT 7G', 'RWD', 4551, 2007, 1284, 11.40, 3.6, 318, 'Ghế đua AMG Carbon, Vật liệu Dinamica, AMG Track Pace', 'AMG Traction Control, Phanh gốm AMG carbon, Active Brake Assist', 'Xanh Green Hell Magno, Vàng Solarbeam, Đỏ Jupiter', '2025-05-14 17:17:10');

-- Chèn dữ liệu mẫu cho users
INSERT INTO users (username, password, email, full_name, phone, address, role, created_at, avatar) VALUES
('admin', 'ea48576f30be1669971699c09ad05c94', 'admin@mercedes.com', 'Administrator', NULL, NULL, 'admin', '2025-05-14 17:17:10', ''),
('Nguyên', '4297f44b13955235245b2497399d7a93', 'khiem123@gmail.com', 'Nguyễn Văn Nguyên', '0987777777', 'Đông Anh', 'user', '2025-05-14 17:17:10', ''),
('Hàoo', '4297f44b13955235245b2497399d7a93', 'maianhhaohao@gmail.com', 'Mai Anh Hào', '0971046017', 'Thường Tín', 'user', '2025-05-14 17:17:10', ''),
('Khiem', '4297f44b13955235245b2497399d7a93', 'khiemnguyenviet.2004@gmail.com', 'Nguyễn Viết Gia Khiêm', '0981663735', 'Cầu giấy', 'user', '2025-05-14 17:17:10', '');

-- Chèn dữ liệu mẫu cho orders
INSERT INTO orders (user_id, product_id, salutation, full_name, phone_number, email, contact_address, total_amount, deposit_amount, payment_notes, bank_account_number, bank_account_name, bank_name, bank_branch, dealer, sales_person, status, created_at, image_thanhtoan) VALUES
(2, 1, 'Anh', 'Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', 1500000000.00, 10000000.00, NULL, '0981663735', 'Nguyn Viet Khiem', 'MB Bank', '', '', '', 'cancelled', '2025-05-14 18:10:55', ''),
(2, 1, 'Anh', 'Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', 1500000000.00, 10000000.00, NULL, '0981663735', 'Nguyn Viet Khiem', 'MB Bank', '', '', '', 'pending', '2025-05-14 18:13:40', ''),
(NULL, 2, 'Anh', 'Hoàng Anh', '02352135235', 'hoanganh04@gmail.com', 'hà noi', 2000000000.00, 10000000.00, NULL, '4242424242424', 'ggggkgkg', 'acb', '', '', 'hgfhfhf', 'pending', '2025-05-15 01:36:04', ''),
(NULL, 6, 'Anh', 'Khiêm Nguyễn Viết Gia', '0981663735', 'maihao.2004@gmail.com', 'tổ 19, ngõ 255, đường Nguyễn Khang, Yên Hòa', 1900000000.00, 10000000.00, NULL, '0981663735', 'Nguyn Viet Khiem', 'MB Bank', '', '', '', 'pending', '2025-05-16 15:48:55', 'C:\\fakepath\\files.png'),
(3, 1, 'Anh', 'Hàoo', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', 1500000000.00, 10000000.00, '', '0981663735', 'Mai Anh Hào', 'MB BANK', '', '', '', 'pending', '2025-05-17 07:20:21', 'C:\\fakepath\\image.jpg'),
(3, 15, 'Anh', 'Hàoo', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', 5000000000.00, 10000000.00, 'rất dễ', '0971046017', 'Mai Anh Hào', 'MB BANK', '', '', '', 'pending', '2025-05-17 07:34:41', 'C:\\fakepath\\image.jpg'),
(NULL, 1, 'Anh', 'Mai Anh Hào', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu giấy', 1500000000.00, 10000000.00, '', '0981663735', 'Mai Anh Hào', 'MB BANK', '', 'Mercedes Hà Nội', '', 'pending', '2025-05-19 16:50:24', '1747673424_f646cdee237bd84e33485eb03c9228ac.png'),
(NULL, 1, 'Anh', 'Mai Anh Hào', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'tổ 19, ngõ 255, đường Nguyễn Khang, Yên Hòa', 1500000000.00, 10000000.00, '', '0981663735', 'Nguyn Viet Khiem', 'MB Bank', '', 'Mercedes Hà Nội', '', 'pending', '2025-05-20 17:17:46', '1747761466_390b1ada31c552f36442c0adc69a7f26.png');

-- Chèn dữ liệu mẫu cho test_drives
INSERT INTO test_drives (user_id, full_name, phone_number, email, product_id, preferred_date, preferred_time, status, notes, location, created_at) VALUES
(2, 'Nguyên', '0987777777', 'khiem123@gmail.com', 1, '2025-05-16', '15:00:00', 'confirmed', '', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-15 01:23:39'),
(2, 'Nguyên', '0987777777', 'khiem123@gmail.com', 1, '2025-05-21', '16:00:00', 'completed', 'ggdgdgd', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-15 01:47:18'),
(2, 'Nguyên', '0987777777', 'khiem123@gmail.com', 1, '2025-05-16', '14:30:00', 'confirmed', '', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-15 02:07:01'),
(3, 'Hàoo', '0971046017', 'maianhhaohao@gmail.com', 1, '2025-05-28', '11:30:00', 'pending', '', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-17 08:42:08'),
(3, 'Hàoo', '0971046017', 'maianhhaohao@gmail.com', 1, '2025-05-22', '13:30:00', 'pending', '', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-17 08:43:35'),
(4, 'Khiem', '0981663735', 'khiemnguyenviet.2004@gmail.com', 7, '2025-05-21', '14:30:00', 'confirmed', 'eee', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-17 16:11:37');