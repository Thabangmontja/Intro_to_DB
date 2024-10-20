-- Create the database
CREATE DATABASE IF NOT EXISTS alx_book_store;

-- Use the created database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create the Books table
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE SET NULL  -- Optional: Set to NULL if an author is deleted
        ON UPDATE CASCADE    -- Update in books if author_id is updated
);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL,
    address TEXT NOT NULL
);

-- Create the Orders table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE   -- Optional: Delete orders if the customer is deleted
        ON UPDATE CASCADE   -- Update orders if customer_id is updated
);

-- Create the Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetail_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE   -- Optional: Delete order details if order is deleted
        ON UPDATE CASCADE,  -- Update order details if order_id is updated
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE   -- Optional: Delete order details if book is deleted
        ON UPDATE CASCADE   -- Update order details if book_id is updated
);
