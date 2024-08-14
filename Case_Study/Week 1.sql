/*
1. **Basic Data Exploration**
    - Display the first names, last names, and emails of all customers.
    - Display the names and join dates of customers who joined in 2024.
2. **Sales Data Analysis**
    - Display the order ID, order date, and total amount for all orders.
    - Display orders with a total amount of $100 or more.
3. **Product Data Exploration**
    - Display the names and prices of all products.
    - Display products with a price of $50 or more.
4. **Filtering Data by Specific Conditions**
    - Display the names and prices of products in the "Electronics" category.
    - Display the order ID, order date, and total amount for orders placed after "2024-01-01".
*/
-- Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    join_date DATE
);

-- Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

-- OrderDetails table
CREATE TABLE OrderDetails (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

--SELECT EXEMPLE
select *
from  Customers
limit  10
