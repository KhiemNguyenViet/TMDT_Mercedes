-- Tạo cơ sở dữ liệu
DROP DATABASE IF EXISTS mercedes_shop;
CREATE DATABASE mercedes_shop;
USE mercedes_shop;

-- Tạo bảng users
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
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
    FOREIGN KEY (user_id) REFERENCES users(id)
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
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    preferred_date DATE NOT NULL,
    preferred_time TIME NOT NULL,
    status ENUM('pending', 'confirmed', 'completed', 'cancelled') DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
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
('Coupe', 'mercedes-coupe', 'Dòng xe coupe thể thao');

-- Chèn dữ liệu mẫu cho products
INSERT INTO products (category_id, name, slug, description, price, image, stock, featured) VALUES
(1, 'Mercedes-Benz C-Class', 'mercedes-benz-c-class', 'Sedan hạng sang với thiết kế hiện đại', 1500000.00, 'c-class.jpg', 10, 1),
(2, 'Mercedes-Benz GLC', 'mercedes-benz-glc', 'SUV đa dụng với không gian rộng rãi', 2000000.00, 'glc.jpg', 8, 1),
(3, 'Mercedes-Benz E-Class Coupe', 'mercedes-benz-e-class-coupe', 'Coupe thể thao với thiết kế ấn tượng', 2500000.00, 'e-class-coupe.jpg', 5, 0);

-- Tạo tài khoản admin mẫu
INSERT INTO users (username, password, email, full_name, role) VALUES
('admin', '123456123456', 'admin@mercedes.com', 'Administrator', 'admin'); 