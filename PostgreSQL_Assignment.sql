-- Active: 1744200636062@@127.0.0.1@5432@bookstore_db

-- command for creating a table named "books" with various attributes
-- and constraints, including a primary key, foreign keys, and default values.
CREATE Table books(
    id serial PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL CHECK (price >= 0),
    stock INT NOT NULL CHECK (stock >= 0),
    published_year DATE NOT NULL
)

-- command for creating a table named "customers" with various attributes
-- and constraints, including a primary key, foreign keys, and default values.
CREATE Table customers(
    id serial PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    joined_date DATE NOT NULL DEFAULT CURRENT_DATE
)

-- command for creating a table named "orders" with various attributes
-- and constraints, including a primary key, foreign keys, and default values.
CREATE Table orders(
    id serial PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(id),
    book_id INT NOT NULL REFERENCES books(id),
    quantity INT NOT NULL CHECK (quantity > 0),
    order_date DATE NOT NULL DEFAULT CURRENT_DATE
)

-- command for inserting multiple records into the "books" table
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Silent River', 'Rafiq Azad', 350.00, 12, '2018-06-15'),
('Bangla Tales', 'Humayun Ahmed', 420.50, 20, '2015-11-10'),
('Digital Bangladesh', 'Zafar Iqbal', 299.99, 10, '2020-01-01'),
('Ocean of Words', 'Taslima Nasrin', 385.00, 7, '2017-07-07'),
('The Last Rain', 'Anisul Hoque', 510.00, 5, '2021-03-21'),
('Midnight Train', 'Muhammad Zafar Iqbal', 275.50, 18, '2016-09-14'),
('Golden Horizon', 'Selina Hossain', 430.75, 9, '2019-12-01'),
('Echoes of War', 'Syed Shamsul Haque', 315.20, 14, '2022-05-09'),
('The Broken Pen', 'Ahmed Sofa', 240.00, 6, '2013-08-30'),
('Light in the Dark', 'Nurul Islam', 380.80, 11, '2014-02-17'),
('Under the Banyan Tree', 'Shamsur Rahman', 460.00, 4, '2016-04-01'),
('Colors of Life', 'Sayeed Ahmed', 520.99, 8, '2020-10-20'),
('Whispers of Time', 'Hasan Azizul Haque', 295.50, 13, '2015-06-05'),
('Winds of Change', 'Jahanara Imam', 399.99, 7, '2017-01-30'),
('Dreams and Dust', 'Syed Waliullah', 340.70, 10, '2018-03-18'),
('Shadow and Light', 'Imdadul Haq Milan', 312.00, 6, '2019-07-23'),
('Beyond the River', 'Anwar Pasha', 265.00, 15, '2022-12-05'),
('Silent Storm', 'Rabeya Khatun', 375.90, 9, '2014-11-11'),
('Leaves of Hope', 'Abul Bashar', 289.00, 17, '2013-09-09'),
('The Last Letter', 'Nirmalendu Goon', 455.55, 3, '2021-08-08');

INSERT into books (title, author, price, stock, published_year) VALUES
('The Silent River', 'Rafiq Azad', 350.00, 0, '2018-06-15');
 
 INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Ancient Legend', 'Syed Mujtaba Ali', 180.00, 5, '1995-04-20'),
('Forgotten Hills', 'Humayun Azad', 210.50, 3, '1989-08-15'),
('Waves of Bengal', 'Abdullah Abu Sayeed', 175.75, 7, '1992-03-10'),
('Dhaka Days', 'Muhammad Yunus', 250.00, 4, '1998-11-01'),
('Mystery in the Sundarbans', 'Anisul Hoque', 190.00, 6, '1997-07-30');

-- command for inserting multiple records into the "customers" table
INSERT INTO customers (name, email, joined_date) VALUES
('Tanvir Hossain', 'tanvir.hossain@example.com', '2023-01-10'),
('Nusrat Jahan', 'nusrat.jahan@example.com', '2023-02-15'),
('Rafiq Ahmed', 'rafiq.ahmed@example.com', '2022-12-01'),
('Farhana Kabir', 'farhana.kabir@example.com', '2023-03-05'),
('Jamal Uddin', 'jamal.uddin@example.com', '2022-11-20'),
('Mehnaz Rahman', 'mehnaz.rahman@example.com', '2023-04-08'),
('Ashraful Alam', 'ashraful.alam@example.com', '2023-05-12'),
('Shamima Akter', 'shamima.akter@example.com', '2023-06-03'),
('Habib Hasan', 'habib.hasan@example.com', '2023-01-25'),
('Fariha Sultana', 'fariha.sultana@example.com', '2023-07-17');

INSERT INTO customers (name, email, joined_date) VALUES
('Mr.Towfiqur Rahman', 'trrabby1@gmail.com', '2025-04-18');

-- command for inserting multiple records into the "orders" table
INSERT INTO orders (customer_id, book_id, quantity, order_date) VALUES
(1, 1, 2, '2023-01-15'),
(2, 3, 1, '2023-02-20'),
(3, 5, 4, '2022-12-10'),
(4, 7, 3, '2023-03-15'),
(5, 9, 1, '2022-11-25'),
(6, 11, 2, '2023-04-12'),
(7, 13, 5, '2023-05-18'),
(8, 15, 1, '2023-06-08'),
(9, 17, 2, '2023-01-30'),
(10, 19, 1, '2023-07-20');

-- !-- Sollution 1: 
-- Finding books that are out of stock.-- 
SELECT * FROM books WHERE stock = 0;

-- !-- Sollution 2:
--  Retrieving the most expensive book in the store.

SELECT * FROM books ORDER BY price DESC LIMIT 1;

-- -- !-- Sollution 3:
--  Finding the total number of orders placed by each customer.

SELECT customers.name, SUM(orders.quantity) AS total_orders
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;

-- !-- Sollution 4:
-- Calculating the total revenue generated from book sales.

SELECT SUM(books.price * orders.quantity) AS total_revenue
FROM books
JOIN orders on books.id = orders.book_id;

-- !-- Sollution 5:
-- Listing all customers who have placed more than one order.

SELECT customers.name, SUM(orders.quantity) AS orders_count
FROM customers 
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name
HAVING SUM(orders.quantity) > 1;

-- !-- Sollution 6:
-- Finding the average price of books in the store.

SELECT ROUND(AVG(price),2) AS avg_book_price FROM books;

-- !-- Sollution 7:
-- Increasing the price of all books published before 2000 by 10%.
UPDATE books 
SET price = ROUND(price * 1.10, 2)
WHERE extract(year from published_year) < 2000;

-- SELECT * FROM books WHERE extract(year from published_year) < 2000;

-- !-- Sollution 8:
-- Deleteting customers who haven't placed any orders.
DELETE FROM customers 
WHERE id NOT IN (SELECT DISTINCT customer_id FROM orders);
