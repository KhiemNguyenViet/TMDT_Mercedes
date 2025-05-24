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
    name_car VARCHAR(255) NOT NULL,
    description_car TEXT,
    price DECIMAL(15,2) NOT NULL,
    image_car VARCHAR(255),
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
    fuel_consumption_l_100km INT,
    acceleration_0_100_s INT,
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
INSERT INTO `products` (`id`, `category_id`, `name_car`, `description_car`, `price`, `image_car`, `stock`, `featured`, `created_at`) VALUES
(1, 1, 'Mercedes-Benz C 300 AMG', 'Sedan hạng sang với thiết kế hiện đại và hiệu suất cao', '1900000000.00', '1747879141_b1641351da0d741c3a3cfceb5e07c789.jpg', 10, 1, '2025-05-14 10:17:10'),
(2, 2, 'Mercedes-Benz GLC 300 4MATIC', 'SUV đa dụng với không gian rộng rãi và công nghệ tiên tiến', '2500000000.00', 'sanpham2.jpg', 8, 1, '2025-05-14 10:17:10'),
(3, 3, 'Mercedes-Benz E-Class Coupe', 'Coupe thể thao với thiết kế ấn tượng', '3200000000.00', 'sanpham3.png', 5, 0, '2025-05-14 10:17:10'),
(4, 1, 'Mercedes-Benz A 200 Sedan', 'Sedan nhỏ gọn, năng động và cá tính', '1450000000.00', '1747932176_55ccf27d26d7b23839986b6ae2e447ab.jpg', 12, 1, '2025-05-14 10:17:10'),
(5, 2, 'Mercedes-Benz GLE 450 4MATIC', 'SUV sang trọng, mạnh mẽ và an toàn', '4200000000.00', '1748055037_6f5ba8e5d233a2297de18478709c82f6.jpg', 7, 1, '2025-05-14 10:17:10'),
(6, 3, 'Mercedes-Benz CLA 250 Coupe', 'Coupe 4 cửa với phong cách độc đáo', '2000000000.00', 'sanpham6.jpg', 9, 1, '2025-05-14 10:17:10'),
(7, 1, 'Mercedes-Benz S 500 4MATIC', 'Đỉnh cao sedan hạng sang, công nghệ tiên tiến', '5500000000.00', 'sanpham7.jpg', 4, 1, '2025-05-14 10:17:10'),
(8, 2, 'Mercedes-Benz G 500', 'Biểu tượng SUV địa hình, huyền thoại off-road', '6500000000.00', 'sanpham8.jpg', 3, 1, '2025-05-14 10:17:10'),
(9, 3, 'Mercedes-AMG GT 53 4-Door Coupe', 'Coupe 4 cửa hiệu suất cao', '7500000000.00', 'sanpham9.jpg', 2, 0, '2025-05-14 10:17:10'),
(10, 1, 'Mercedes-Benz E 300 AMG', 'Sedan doanh nhân, lịch lãm và đẳng cấp', '2900000000.00', '1747932118_f962142252141a4f453e02cde66573d1.jpg', 11, 1, '2025-05-14 10:17:10'),
(11, 2, 'Mercedes-Benz GLS 450 4MATIC', 'SUV full-size, không gian cho cả gia đình', '4800000000.00', '1747933467_f5fb9c608549fc69db9f20d2c7a49281.jpg', 6, 0, '2025-05-14 10:17:10'),
(12, 3, 'Mercedes-Benz C-Class Coupe', 'Coupe thanh lịch, trẻ trung và thể thao', '2200000000.00', '1747933127_e88bab04383897a02b7f08550a588fc7.avif', 8, 1, '2025-05-14 10:17:10'),
(13, 1, 'Mercedes-Maybach S 580 4MATIC', 'Siêu sang, trải nghiệm thượng lưu tuyệt đối', '11000000000.00', '1747933327_44638634aea2106b9b50b9578ddc7fe5.avif', 2, 1, '2025-05-14 10:17:10'),
(14, 2, 'Mercedes-Benz GLA 200', 'SUV cỡ nhỏ, linh hoạt trong đô thị', '1800000000.00', '1748055116_7e3dffb48f7aec91add6e0710a4bbea3.jpg', 15, 1, '2025-05-14 10:17:10'),
(15, 3, 'Mercedes-Benz S-Class Coupe', 'Coupe sang trọng bậc nhất, thiết kế quyến rũ', '6000000000.00', 'sanpham15.jpg', 3, 1, '2025-05-14 10:17:10'),
(16, 1, 'Mercedes-AMG C 63 S', 'Sedan hiệu suất cao, cảm giác lái phấn khích', '4500000000.00', 'sanpham16.jpg', 5, 1, '2025-05-14 10:17:10'),
(17, 3, 'Mercedes-AMG GLE 53 4MATIC+ Coupe', 'SUV Coupe thể thao, động cơ mạnh mẽ', '5200000000.00', '1748054887_427702539c18b4ace4b3223d6587dfec.png', 4, 1, '2025-05-14 10:17:10'),
(18, 3, 'Mercedes-AMG GT 63 4-Door Coupe', 'Coupe 4 cửa hiệu suất đỉnh cao', '8500000000.00', '1747933540_d0782cf05c73f9f9d51e14ce04754681.jpg', 2, 1, '2025-05-14 10:17:10'),
(19, 1, 'Mercedes-Benz EQS 450+', 'Sedan thuần điện tương lai, sang trọng và bền vững', '4500000000.00', '1747933383_24cbf660bf81ef1c62f3f1f8d674306e.jpg', 6, 1, '2025-05-14 10:17:10'),
(20, 2, 'Mercedes-Benz EQB 350 4MATIC', 'SUV thuần điện 7 chỗ, thực dụng và hiện đại', '2800000000.00', '1748054963_89354418f18fb85d6189422b22cb5f55.jpg', 7, 1, '2025-05-14 10:17:10'),
(21, 4, 'Mercedes-Benz A 200 Sedan', 'A-Class Sedan tiêu chuẩn, tiện nghi và hiệu quả', '1450000000.00', 'sanpham21.jpg', 10, 1, '2025-05-14 10:17:10'),
(22, 5, 'Mercedes-Maybach S 680 4MATIC', 'Tuyệt tác siêu sang, động cơ V12 mạnh mẽ', '18000000000.00', 'sanpham22.jpg', 1, 1, '2025-05-14 10:17:10'),
(23, 6, 'Mercedes-AMG G 63', 'SUV địa hình hiệu suất cao, phong cách hầm hố', '12000000000.00', 'sanpham23.jpg', 2, 1, '2025-05-14 10:17:10'),
(24, 9, 'Mercedes-Benz EQS 580 4MATIC SUV', 'SUV điện hạng sang, công nghệ đỉnh cao', '6500000000.00', '1747933630_f0ddf51fdbddd792482b8ffcae264629.avif', 4, 0, '2025-05-14 10:17:10'),
(25, 8, 'Mercedes-AMG A 35 4MATIC', 'Hatchback thể thao AMG, nhanh nhẹn và cá tính', '2600000000.00', 'sanpham25.jpg', 6, 1, '2025-05-14 10:17:10'),
(26, 10, 'Mercedes-Benz V 250 AMG', 'MPV hạng sang với gói thể thao AMG', '3500000000.00', '1747932670_df61d5e93bf1fc8a66c67c50caf312bc.png', 5, 0, '2025-05-14 10:17:10'),
(27, 7, 'Mercedes-Maybach GLS 600 4MATIC', 'SUV siêu sang, không gian xa hoa và tiện nghi', '14000000000.00', '1747932857_f5fb9c608549fc69db9f20d2c7a49281.jpg', 2, 1, '2025-05-14 10:17:10'),
(28, 9, 'Mercedes-Benz EQC 400 4MATIC', 'SUV điện đầu tiên của Mercedes-EQ, vận hành êm ái', '3500000000.00', '1747932576_2cccfaa15c30d45c31ea9df3844e7d4b.jpg', 7, 1, '2025-05-14 10:17:10'),
(29, 1, 'Mercedes-Benz CLS 450 4MATIC', 'Coupe 4 cửa, thiết kế quyến rũ và động cơ I6', '4000000000.00', '1747932359_5bcccd900881c042ae3cace77b04b23d.jpg', 4, 0, '2025-05-14 10:17:10'),
(30, 8, 'Mercedes-AMG GT R', 'Quái thú đường đua, hiệu suất cực đỉnh', '12500000000.00', '1747882153_6f5ba8e5d233a2297de18478709c82f6.jpg', 1, 1, '2025-05-14 10:17:10');

-- Chèn dữ liệu mẫu cho product_details
INSERT INTO `product_details` (`id`, `product_id`, `engine_type`, `displacement_cc`, `horsepower_hp`, `torque_nm`, `transmission_type`, `drive_type`, `length_mm`, `width_mm`, `height_mm`, `fuel_consumption_l_100km`, `acceleration_0_100_s`, `top_speed_kmh`, `interior_features`, `safety_features`, `color_options`, `created_at`) VALUES
(1, 1, 'I4 Turbo + EQ Boost', 1991, 258, 400, '9G-TRONIC', 'RWD', 4751, 1820, 1438, 7, 6, 250, 'MBUX, Da Artico, Đèn viền nội thất 64 màu, Ghế thể thao AMG', 'Active Brake Assist, Attention Assist, Blind Spot Assist', 'Trắng Polar, Đen Obsidian, Xám Graphite', '2025-05-14 10:17:10'),
(2, 2, 'I4 Turbo + EQ Boost', 1991, 258, 400, '9G-TRONIC', 'AWD (4MATIC)', 4716, 1890, 1640, 7, 6, 240, 'MBUX, Da Artico, Hệ thống âm thanh Burmester, Đèn viền nội thất', 'Active Distance Assist DISTRONIC, PRE-SAFE, 360 Camera', 'Bạc Iridium, Đen Obsidian, Xanh Cavansite', '2025-05-14 10:17:10'),
(3, 3, 'I6 Turbo + EQ Boost', 2999, 367, 500, '9G-TRONIC', 'RWD', 4835, 1860, 1430, 8, 5, 250, 'MBUX, Da Nappa, Ghế chỉnh điện đa hướng, Hệ thống âm thanh Burmester', 'PRE-SAFE, Active Lane Keeping Assist, Blind Spot Assist', 'Đen Obsidian, Trắng Diamond, Đỏ Hyacinth', '2025-05-14 10:17:10'),
(4, 4, 'I4 Turbo', 1332, 163, 250, '7G-DCT', 'FWD', 4549, 1796, 1446, 5, 8, 230, 'MBUX, Da Artico, Đèn viền nội thất, Ghế thể thao', 'Active Brake Assist, Attention Assist, Parking Assist', 'Trắng Polar, Đen Cosmos, Xanh Denim', '2025-05-14 10:17:10'),
(5, 5, 'I6 Turbo + EQ Boost', 2999, 367, 500, '9G-TRONIC', 'AWD (4MATIC)', 4924, 2010, 1797, 9, 6, 250, 'MBUX Hyperscreen, Da Nappa, Ghế massage, Hệ thống âm thanh Burmester', 'E-ACTIVE BODY CONTROL, PRE-SAFE Impulse Side, 360 Camera', 'Bạc High-Tech, Đen Obsidian, Xanh Emerald', '2025-05-14 10:17:10'),
(6, 6, 'I4 Turbo', 1991, 224, 350, '7G-DCT', 'AWD (4MATIC)', 4688, 1830, 1439, 6, 6, 250, 'MBUX, Da Artico, Ghế thể thao, Đèn viền nội thất 64 màu', 'Active Brake Assist, Blind Spot Assist, Lane Keeping Assist', 'Trắng Polar, Đen Night, Xám Mountain', '2025-05-14 10:17:10'),
(7, 7, 'V6 Turbo + EQ Boost', 2999, 435, 520, '9G-TRONIC', 'AWD (4MATIC)', 5289, 1954, 1503, 10, 5, 250, 'MBUX Hyperscreen, Da Nappa, Ghế massage, Hệ thống âm thanh Burmester 4D', 'PRE-SAFE Impulse Side, E-ACTIVE BODY CONTROL, Digital Light', 'Đen Obsidian, Bạc Iridium, Trắng Diamond', '2025-05-14 10:17:10'),
(8, 8, 'V8 Biturbo', 3982, 422, 610, '9G-TRONIC', 'AWD (4MATIC)', 4817, 1931, 1969, 12, 6, 210, 'Da Nappa, Hệ thống âm thanh Burmester, Đèn viền nội thất', 'AMG RIDE CONTROL, Active Lane Keeping Assist, 360 Camera', 'Đen Night Magno, Trắng Polar, Xanh Olive', '2025-05-14 10:17:10'),
(9, 9, 'I6 Turbo + EQ Boost', 2999, 435, 520, 'AMG SPEEDSHIFT TCT 9G', 'AWD (4MATIC+)', 5054, 1953, 1447, 9, 5, 270, 'Da Nappa AMG, Vô lăng AMG Performance, Hệ thống âm thanh Burmester', 'AMG RIDE CONTROL, Active Brake Assist, Blind Spot Assist', 'Xám Selenite, Đen Obsidian, Trắng Diamond', '2025-05-14 10:17:10'),
(10, 10, 'I4 Turbo + EQ Boost', 1991, 258, 400, '9G-TRONIC', 'RWD', 4935, 1852, 1468, 7, 6, 250, 'MBUX, Da Artico, Ghế chỉnh điện, Đèn viền nội thất 64 màu', 'PRE-SAFE, Active Distance Assist DISTRONIC, 360 Camera', 'Bạc Iridium, Đen Obsidian, Xanh Nautic', '2025-05-14 10:17:10'),
(11, 11, 'V6 Turbo + EQ Boost', 2999, 367, 500, '9G-TRONIC', 'AWD (4MATIC)', 5207, 2030, 1838, 9, 6, 250, 'MBUX Hyperscreen, Da Nappa, Ghế massage, Hệ thống âm thanh Burmester', 'E-ACTIVE BODY CONTROL, PRE-SAFE, 360 Camera', 'Trắng Diamond, Đen Obsidian, Xanh Sodalite', '2025-05-14 10:17:10'),
(12, 12, 'I4 Turbo + EQ Boost', 1991, 258, 400, '9G-TRONIC', 'RWD', 4693, 1810, 1405, 7, 6, 250, 'MBUX, Da Artico, Ghế thể thao, Đèn viền nội thất', 'Active Brake Assist, Blind Spot Assist, Parking Assist', 'Trắng Polar, Đen Night, Xám Graphite', '2025-05-14 10:17:10'),
(13, 13, 'V8 Biturbo + EQ Boost', 3982, 503, 700, '9G-TRONIC', 'AWD (4MATIC)', 5469, 1921, 1503, 11, 5, 250, 'Da Nappa cao cấp, Hệ thống âm thanh Burmester 4D, Ghế massage đa chế độ', 'PRE-SAFE Impulse Side, E-ACTIVE BODY CONTROL, Digital Light', 'Đen Obsidian, Bạc Iridium, Xanh Emerald', '2025-05-14 10:17:10'),
(14, 14, 'I4 Turbo', 1332, 163, 250, '7G-DCT', 'FWD', 4410, 1834, 1611, 6, 9, 209, 'MBUX, Da Artico, Đèn viền nội thất, Ghế thể thao', 'Active Brake Assist, Attention Assist, Parking Assist', 'Trắng Polar, Đen Cosmos, Xanh Denim', '2025-05-14 10:17:10'),
(15, 15, 'V8 Biturbo', 3982, 469, 700, '9G-TRONIC', 'RWD', 5027, 1899, 1411, 10, 5, 250, 'Da Nappa, Hệ thống âm thanh Burmester, Ghế chỉnh điện đa hướng', 'PRE-SAFE, Active Lane Keeping Assist, 360 Camera', 'Đen Obsidian, Trắng Diamond, Đỏ Hyacinth', '2025-05-14 10:17:10'),
(16, 16, 'V8 Biturbo', 3982, 510, 700, 'AMG SPEEDSHIFT MCT 9G', 'RWD', 4751, 1839, 1426, 11, 4, 290, 'Ghế thể thao AMG, Da Nappa, Vô lăng AMG Performance', 'AMG RIDE CONTROL, Active Brake Assist, Blind Spot Assist', 'Xám Selenite, Đen Night Magno, Trắng Polar', '2025-05-14 10:17:10'),
(17, 17, 'I6 Turbo + EQ Boost', 2999, 435, 520, 'AMG SPEEDSHIFT TCT 9G', 'AWD (4MATIC+)', 4961, 2018, 1716, 9, 5, 250, 'Da Nappa AMG, MBUX, Hệ thống âm thanh Burmester', 'AMG RIDE CONTROL, PRE-SAFE, 360 Camera', 'Đen Obsidian, Trắng Diamond, Xanh Cavansite', '2025-05-14 10:17:10'),
(18, 18, 'V8 Biturbo', 3982, 639, 900, 'AMG SPEEDSHIFT MCT 9G', 'AWD (4MATIC+)', 5054, 1953, 1447, 11, 3, 315, 'Da Nappa AMG, Vô lăng AMG Performance, Hệ thống âm thanh Burmester', 'AMG RIDE CONTROL, Active Brake Assist, Digital Light', 'Xám Selenite, Đen Night Magno, Vàng Solarbeam', '2025-05-14 10:17:10'),
(19, 19, 'Electric Motor', 4568, 333, 568, 'Single Speed Automatic', 'RWD', 5216, 1926, 1512, 23, 6, 210, 'MBUX Hyperscreen, Da Nappa, Đèn viền nội thất 64 màu', 'Driving Assistance Package Plus, PRE-SAFE, Digital Light', 'Trắng Diamond, Đen Obsidian, Xanh Sodalite', '2025-05-14 10:17:10'),
(20, 20, 'Electric Motor (Dual)', 4561, 292, 520, 'Single Speed Automatic', 'AWD (4MATIC)', 4684, 1834, 1668, 89, 6, 160, 'MBUX, Da Artico, Ghế 7 chỗ, Đèn viền nội thất', 'Active Brake Assist, Attention Assist, 360 Camera', 'Trắng Polar, Đen Cosmos, Xám Mountain', '2025-05-14 10:17:10'),
(21, 21, 'I4 Turbo', 1332, 163, 250, '7G-DCT', 'FWD', 4549, 1796, 1446, 5, 8, 230, 'MBUX, Da Artico, Đèn viền nội thất, Ghế thể thao', 'Active Brake Assist, Attention Assist, Parking Assist', 'Trắng Polar, Đen Cosmos, Xanh Denim', '2025-05-14 10:17:10'),
(22, 22, 'V12 Biturbo', 5980, 621, 900, '9G-TRONIC', 'AWD (4MATIC)', 5469, 1921, 1503, 14, 5, 250, 'Da Nappa cao cấp, Hệ thống âm thanh Burmester High-End 4D, Ghế massage đa chế độ', 'PRE-SAFE Impulse Side, E-ACTIVE BODY CONTROL, Digital Light', 'Đen Obsidian, Bạc Iridium, Xanh Emerald', '2025-05-14 10:17:10'),
(23, 23, 'V8 Biturbo', 3982, 585, 850, 'AMG SPEEDSHIFT TCT 9G', 'AWD (4MATIC)', 4873, 1984, 1969, 13, 5, 220, 'Da Nappa AMG, Vô lăng AMG Performance, Hệ thống ống xả AMG Performance', 'AMG RIDE CONTROL, Active Lane Keeping Assist, 360 Camera', 'Đen Night Magno, Xanh Olive, Xám Selenite Magno', '2025-05-14 10:17:10'),
(24, 24, 'Electric Motor (Dual)', 1234, 516, 855, 'Single Speed Automatic', 'AWD (4MATIC)', 5216, 1926, 1718, 98, 5, 210, 'MBUX Hyperscreen, Da Nappa, Hệ thống lọc không khí HEPA', 'Driving Assistance Package Plus, Digital Light, 360 Camera', 'Trắng Diamond, Đen Obsidian, Xanh Sodalite', '2025-05-14 10:17:10'),
(25, 25, 'I4 Turbo', 1991, 306, 400, 'AMG SPEEDSHIFT DCT 7G', 'AWD (4MATIC)', 4439, 1796, 1400, 7, 5, 250, 'Ghế thể thao AMG, Da Artico, Vô lăng AMG Performance', 'AMG RIDE CONTROL, Active Brake Assist, Blind Spot Assist', 'Xám Mountain, Đen Night, Trắng Polar', '2025-05-14 10:17:10'),
(26, 26, 'I4 Diesel', 1950, 190, 440, '9G-TRONIC', 'RWD', 5140, 1928, 1880, 7, 10, 206, 'MBUX, Da Artico, Ghế chỉnh điện, Hệ thống âm thanh Burmester', 'Active Brake Assist, Attention Assist, 360 Camera', 'Đen Obsidian, Bạc Iridium, Trắng Polar', '2025-05-14 10:17:10'),
(27, 27, 'V8 Biturbo + EQ Boost', 3982, 558, 730, '9G-TRONIC', 'AWD (4MATIC)', 5205, 2030, 1838, 12, 5, 250, 'Da Nappa cao cấp, Hệ thống âm thanh Burmester 4D, Ghế massage đa chế độ', 'PRE-SAFE Impulse Side, E-ACTIVE BODY CONTROL, Digital Light', 'Đen Obsidian, Trắng Diamond, Xanh Sodalite', '2025-05-14 10:17:10'),
(28, 28, 'Electric Motor (Dual)', 1234, 408, 760, 'Single Speed Automatic', 'AWD (4MATIC)', 4761, 1884, 1623, 89, 5, 180, 'MBUX, Da Artico, Đèn viền nội thất, Hệ thống âm thanh Burmester', 'Driving Assistance Package Plus, PRE-SAFE, 360 Camera', 'Trắng Polar, Đen Obsidian, Xám Graphite', '2025-05-14 10:17:10'),
(29, 29, 'I6 Turbo + EQ Boost', 2999, 367, 500, '9G-TRONIC', 'AWD (4MATIC)', 4988, 1890, 1435, 8, 5, 250, 'MBUX, Da Nappa, Ghế chỉnh điện đa hướng, Hệ thống âm thanh Burmester', 'PRE-SAFE, Active Distance Assist DISTRONIC, Digital Light', 'Đen Obsidian, Trắng Diamond, Đỏ Hyacinth', '2025-05-14 10:17:10'),
(30, 30, 'V8 Biturbo', 3982, 585, 700, 'AMG SPEEDSHIFT DCT 7G', 'RWD', 4551, 2007, 1284, 11, 4, 318, 'Ghế đua AMG Carbon, Vật liệu Dinamica, AMG Track Pace', 'AMG Traction Control, Phanh gốm AMG carbon, Active Brake Assist', 'Xanh Green Hell Magno, Vàng Solarbeam, Đỏ Jupiter', '2025-05-14 10:17:10');


-- Chèn dữ liệu mẫu cho users
INSERT INTO users (username, password, email, full_name, phone, address, role, created_at, avatar) VALUES
('admin', 'ea48576f30be1669971699c09ad05c94', 'admin@mercedes.com', 'Administrator', NULL, NULL, 'admin', '2025-05-14 17:17:10', ''),
('Nguyên', '4297f44b13955235245b2497399d7a93', 'khiem123@gmail.com', 'Nguyễn Văn Nguyên', '0987777777', 'Đông Anh', 'user', '2025-05-14 17:17:10', ''),
('Hàoo', '4297f44b13955235245b2497399d7a93', 'maianhhaohao@gmail.com', 'Mai Anh Hào', '0971046017', 'Thường Tín', 'user', '2025-05-14 17:17:10', ''),
('Khiem', '4297f44b13955235245b2497399d7a93', 'khiemnguyenviet.2004@gmail.com', 'Nguyễn Viết Gia Khiêm', '0981663735', 'Cầu giấy', 'user', '2025-05-14 17:17:10', '');

-- Chèn dữ liệu mẫu cho orders
INSERT INTO `orders` (`id`, `user_id`, `product_id`, `salutation`, `full_name`, `phone_number`, `email`, `contact_address`, `total_amount`, `deposit_amount`, `payment_notes`, `bank_account_number`, `bank_account_name`, `bank_name`, `bank_branch`, `dealer`, `sales_person`, `status`, `created_at`, `image_thanhtoan`) VALUES
(1, 2, 1, 'Anh', 'Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '1500000000.00', '10000000.00', NULL, '0981663735', 'Nguyn Viet Khiem', 'MB Bank', '', '', '', 'cancelled', '2025-05-14 11:10:55', ''),
(2, 2, 1, 'Anh', 'Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '1500000000.00', '10000000.00', NULL, '0981663735', 'Nguyn Viet Khiem', 'MB Bank', '', '', '', 'pending', '2025-05-14 11:13:40', ''),
(3, NULL, 2, 'Anh', 'Hoàng Anh', '02352135235', 'hoanganh04@gmail.com', 'hà noi', '2000000000.00', '10000000.00', NULL, '4242424242424', 'ggggkgkg', 'acb', '', '', 'hgfhfhf', 'pending', '2025-05-14 18:36:04', ''),
(4, NULL, 6, 'Anh', 'Khiêm Nguyễn Viết Gia', '0981663735', 'maihao.2004@gmail.com', 'tổ 19, ngõ 255, đường Nguyễn Khang, Yên Hòa', '1900000000.00', '10000000.00', NULL, '0981663735', 'Nguyn Viet Khiem', 'MB Bank', '', '', '', 'pending', '2025-05-16 08:48:55', 'C:\\fakepath\\files.png'),
(5, 3, 1, 'Anh', 'Hàoo', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '1500000000.00', '10000000.00', '', '0981663735', 'Mai Anh Hào', 'MB BANK', '', '', '', 'pending', '2025-05-17 00:20:21', 'C:\\fakepath\\image.jpg'),
(6, 3, 15, 'Anh', 'Hàoo', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '5000000000.00', '10000000.00', 'rất dễ', '0971046017', 'Mai Anh Hào', 'MB BANK', '', '', '', 'cancelled', '2025-05-17 00:34:41', 'C:\\fakepath\\image.jpg'),
(7, NULL, 1, 'Anh', 'Mai Anh Hào', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu giấy', '1500000000.00', '10000000.00', '', '0981663735', 'Mai Anh Hào', 'MB BANK', '', 'Mercedes Hà Nội', '', 'pending', '2025-05-19 09:50:24', '1747673424_f646cdee237bd84e33485eb03c9228ac.png'),
(8, NULL, 1, 'Anh', 'Mai Anh Hào', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'tổ 19, ngõ 255, đường Nguyễn Khang, Yên Hòa', '1500000000.00', '10000000.00', '', '0981663735', 'Nguyn Viet Khiem', 'MB Bank', '', 'Mercedes Hà Nội', '', 'pending', '2025-05-20 10:17:46', '1747761466_390b1ada31c552f36442c0adc69a7f26.png'),
(9, NULL, 1, 'Anh', '', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu giấy', '1900000000.00', '10000000.00', '', '4242424242424', 'ggggkgkg', 'acb', '', 'Mercedes Hà Nội', '', 'cancelled', '2025-05-23 09:28:28', '1747992508_d7a572aec6696c653fd7a26addc50dff.webp'),
(10, NULL, 1, 'Anh', '', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu giấy', '1900000000.00', '10000000.00', '', '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB', '', 'Mercedes Hà Nội', '', 'pending', '2025-05-23 14:57:22', '1748012242_269ecb5f93af5d0cd562d81a7d9f44c2.jpg'),
(11, 4, 1, 'Anh', '', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu giấy', '1900000000.00', '10000000.00', '', '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB BANK', '', 'Mercedes Hà Nội', '', 'pending', '2025-05-23 16:05:59', '1748016359_fb2757f5f2a0574a456b45851916244d.jpg'),
(12, 4, 3, 'Anh', '', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu giấy', '3200000000.00', '10000000.00', '', '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB BANK', '', 'Mercedes Hà Nội', '', 'completed', '2025-05-23 17:53:05', '1748022785_269ecb5f93af5d0cd562d81a7d9f44c2.jpg'),
(13, 2, 4, 'Anh', 'Nguyễn Văn Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '1450000000.00', '10000000.00', 'Thanh toán trước 50%', '0981663735', 'Nguyễn Văn Nguyên', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Nguyễn Văn A', 'pending', '2025-01-10 03:30:00', 'order_jan_1.png'),
(14, 3, 7, 'Anh', 'Mai Anh Hào', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '5500000000.00', '10000000.00', NULL, '0971046017', 'Mai Anh Hào', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Trần Thị B', 'completed', '2025-01-15 07:45:00', 'order_jan_2.png'),
(15, 4, 10, 'Anh', 'Nguyễn Viết Gia Khiêm', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu Giấy', '2900000000.00', '10000000.00', 'Thanh toán đầy đủ', '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Lê Văn C', 'completed', '2025-02-05 02:15:00', 'order_feb_1.png'),
(16, 2, 2, 'Anh', 'Nguyễn Văn Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '2500000000.00', '10000000.00', NULL, '0981663735', 'Nguyễn Văn Nguyên', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Phạm Thị D', 'pending', '2025-02-20 09:20:00', 'order_feb_2.png'),
(17, 3, 13, 'Anh', 'Mai Anh Hào', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '11000000000.00', '10000000.00', 'Thanh toán bằng chuyển khoản', '0971046017', 'Mai Anh Hào', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Nguyễn Văn E', 'cancelled', '2025-03-12 04:00:00', 'order_mar_1.png'),
(18, 4, 19, 'Anh', 'Nguyễn Viết Gia Khiêm', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu Giấy', '4500000000.00', '10000000.00', NULL, '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Trần Thị F', 'completed', '2025-03-25 06:30:00', 'order_mar_2.png'),
(19, 2, 6, 'Anh', 'Nguyễn Văn Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '2000000000.00', '10000000.00', 'Đặt cọc trước', '0981663735', 'Nguyễn Văn Nguyên', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Lê Văn G', 'pending', '2025-04-08 08:00:00', 'order_apr_1.png'),
(20, 3, 8, 'Anh', 'Mai Anh Hào', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '6500000000.00', '10000000.00', NULL, '0971046017', 'Mai Anh Hào', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Phạm Thị H', 'completed', '2025-04-18 03:45:00', 'order_apr_2.png'),
(21, 4, 12, 'Anh', 'Nguyễn Viết Gia Khiêm', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu Giấy', '2200000000.00', '10000000.00', 'Thanh toán trước 30%', '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Nguyễn Văn I', 'pending', '2025-05-10 05:00:00', 'order_may_1.png'),
(22, 2, 16, 'Anh', 'Nguyễn Văn Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '4500000000.00', '10000000.00', NULL, '0981663735', 'Nguyễn Văn Nguyên', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Trần Thị J', 'completed', '2025-05-22 07:15:00', 'order_may_2.png'),
(23, 3, 18, 'Anh', 'Mai Anh Hào', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '8500000000.00', '10000000.00', 'Thanh toán đầy đủ', '0971046017', 'Mai Anh Hào', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Lê Văn K', 'completed', '2025-06-05 02:30:00', 'order_jun_1.png'),
(24, 4, 24, 'Anh', 'Nguyễn Viết Gia Khiêm', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu Giấy', '6500000000.00', '10000000.00', NULL, '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Phạm Thị L', 'pending', '2025-06-20 09:00:00', 'order_jun_2.png'),
(25, 2, 20, 'Anh', 'Nguyễn Văn Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '2800000000.00', '10000000.00', 'Thanh toán trước 50%', '0981663735', 'Nguyễn Văn Nguyên', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Nguyễn Văn M', 'completed', '2025-07-12 04:30:00', 'order_jul_1.png'),
(26, 3, 22, 'Anh', 'Mai Anh Hào', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '18000000000.00', '10000000.00', NULL, '0971046017', 'Mai Anh Hào', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Trần Thị N', 'cancelled', '2025-07-25 06:45:00', 'order_jul_2.png'),
(27, 4, 25, 'Anh', 'Nguyễn Viết Gia Khiêm', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu Giấy', '2600000000.00', '10000000.00', 'Thanh toán bằng chuyển khoản', '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Lê Văn O', 'pending', '2025-08-08 08:15:00', 'order_aug_1.png'),
(28, 2, 27, 'Anh', 'Nguyễn Văn Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '14000000000.00', '10000000.00', NULL, '0981663735', 'Nguyễn Văn Nguyên', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Phạm Thị P', 'completed', '2025-08-18 03:00:00', 'order_aug_2.png'),
(29, 3, 28, 'Anh', 'Mai Anh Hào', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '3500000000.00', '10000000.00', 'Thanh toán trước 30%', '0971046017', 'Mai Anh Hào', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Nguyễn Văn Q', 'completed', '2025-09-10 05:30:00', 'order_sep_1.png'),
(30, 4, 29, 'Anh', 'Nguyễn Viết Gia Khiêm', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu Giấy', '4000000000.00', '10000000.00', NULL, '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Trần Thị R', 'pending', '2025-09-22 07:45:00', 'order_sep_2.png'),
(31, 2, 30, 'Anh', 'Nguyễn Văn Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '12500000000.00', '10000000.00', 'Thanh toán đầy đủ', '0981663735', 'Nguyễn Văn Nguyên', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Lê Văn S', 'completed', '2025-10-05 02:00:00', 'order_oct_1.png'),
(32, 3, 5, 'Anh', 'Mai Anh Hào', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '4200000000.00', '10000000.00', NULL, '0971046017', 'Mai Anh Hào', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Phạm Thị T', 'completed', '2025-10-20 09:15:00', 'order_oct_2.png'),
(33, 4, 9, 'Anh', 'Nguyễn Viết Gia Khiêm', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu Giấy', '7500000000.00', '10000000.00', 'Thanh toán trước 50%', '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Nguyễn Văn U', 'pending', '2025-11-12 04:00:00', 'order_nov_1.png'),
(34, 2, 11, 'Anh', 'Nguyễn Văn Nguyên', '0987777777', 'khiem123@gmail.com', 'Đông Anh', '4800000000.00', '10000000.00', NULL, '0981663735', 'Nguyễn Văn Nguyên', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Trần Thị V', 'cancelled', '2025-11-25 06:30:00', 'order_nov_2.png'),
(35, 3, 14, 'Anh', 'Mai Anh Hào', '0971046017', 'maianhhaohao@gmail.com', 'Thường Tín', '1800000000.00', '10000000.00', 'Thanh toán bằng chuyển khoản', '0971046017', 'Mai Anh Hào', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Lê Văn W', 'completed', '2025-12-08 08:45:00', 'order_dec_1.png'),
(36, 4, 17, 'Anh', 'Nguyễn Viết Gia Khiêm', '0981663735', 'khiemnguyenviet.2004@gmail.com', 'Cầu Giấy', '5200000000.00', '10000000.00', NULL, '0981663735', 'Nguyễn Viết Gia Khiêm', 'MB Bank', 'Hà Nội', 'Mercedes Hà Nội', 'Phạm Thị X', 'completed', '2025-12-20 03:30:00', 'order_dec_2.png');

-- Chèn dữ liệu mẫu cho test_drives
INSERT INTO test_drives (user_id, full_name, phone_number, email, product_id, preferred_date, preferred_time, status, notes, location, created_at) VALUES
(2, 'Nguyên', '0987777777', 'khiem123@gmail.com', 1, '2025-05-16', '15:00:00', 'confirmed', '', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-15 01:23:39'),
(2, 'Nguyên', '0987777777', 'khiem123@gmail.com', 1, '2025-05-21', '16:00:00', 'completed', 'ggdgdgd', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-15 01:47:18'),
(2, 'Nguyên', '0987777777', 'khiem123@gmail.com', 1, '2025-05-16', '14:30:00', 'confirmed', '', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-15 02:07:01'),
(3, 'Hàoo', '0971046017', 'maianhhaohao@gmail.com', 1, '2025-05-28', '11:30:00', 'pending', '', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-17 08:42:08'),
(3, 'Hàoo', '0971046017', 'maianhhaohao@gmail.com', 1, '2025-05-22', '13:30:00', 'pending', '', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-17 08:43:35'),
(4, 'Khiem', '0981663735', 'khiemnguyenviet.2004@gmail.com', 7, '2025-05-21', '14:30:00', 'confirmed', 'eee', 'Mercedes-Benz Haxaco Láng Hạ', '2025-05-17 16:11:37');