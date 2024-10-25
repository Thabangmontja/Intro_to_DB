CREATE DATABASE alx_book_store;
-- Database creation script for alx_book_store
-- Drop database if it exists, then create it
DROP DATABASE IF EXISTS alx_book_store;
CREATE DATABASE alx_book_store;
-- Create authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    bio TEXT
);
DROP DATABASE IF EXISTS alx_book_store;
CREATE DATABASE alx_book_store;
-- Select the database
USE alx_book_store;

-- Create authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    bio TEXT
);
SHOW CREATE TABLE authors;

-- Create books table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT NOT NULL,
    genre VARCHAR(50),
    price DECIMAL(10, 2),
    published_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);
SHOW CREATE TABLE books;

-- Create customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20)
);
SHOW CREATE TABLE customers;

-- Create orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
SHOW CREATE TABLE orders;

-- Create order_details table
CREATE TABLE order_details (
    order_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);
SHOW CREATE TABLE order_details;

-- Remove unnecessary columns
ALTER TABLE customers
DROP COLUMN first_name,
DROP COLUMN last_name,
DROP COLUMN phone;

-- Add the new columns
ALTER TABLE customers
ADD COLUMN customer_name VARCHAR(215) NOT NULL,
ADD COLUMN address TEXT;

-- Modify email column to match specified length
ALTER TABLE customers
MODIFY COLUMN email VARCHAR(215);
