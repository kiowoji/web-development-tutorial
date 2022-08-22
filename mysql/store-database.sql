CREATE DATABASE store_db;

CREATE TABLE customers (
	customer_id int NOT NULL,
    name varchar(50) NOT NULL,
    address varchar(50) NOT NULL,
    email varchar(50) NOT NULL,
    phone varchar(50) NOT NULL,
    created_at date NOT NULL, 
    PRIMARY KEY (customer_id)
);

CREATE TABLE products (
	product_id int NOT NULL,
    product_name varchar(50) NOT NULL,
    description varchar(100) NOT NULL,
    price int NOT NULL,
    promo_price int NOT NULL,
    category_id int NOT NULL,
    created_at date NOT NULL,
    PRIMARY KEY (product_id)
); 


CREATE TABLE orders (
	order_id int NOT NULL,
	customer_id int NOT NULL,
	created_at date NOT NULL,
    PRIMARY KEY (order_id)
);

CREATE TABLE order_products (
	oredr_product_id int NOT NULL,
    order_id int NOT NULL,
    product_id int NOT NULL,
    quantity varchar(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE categories (
	category_id int NOT NULL,
    category_name varchar(50) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO customers (customer_id, name, address, email, phone, created_at)
VALUES (1, 'Barbara', '94 Sage Terrace', 'barb69093@gmail.com', '674-235-4953', '2020-03-07'),
	(2, 'Freddy', '1 Spohn Circle', 'dk321110@gmail.com', '982-102-1192', '2021-11-01'),
    (3, 'Ann', '346 Ohio Trail', 'annshirley@gmail.com', '203-183-2832', '2021-06-12'),
    (4, 'Romola', '98 Manley Drive', 'alomor@gmail.com', '999-357-1284', '2020-09-23'),
    (5, 'Elka', '68 Lawn Avenue', 'elka123@gmail.com', '204-033-8321', '2020-12-03'),
	(6, 'Ambur', '538 Mosinee Center', 'ambulll@gmail.com', '211-923-0283', '2021-01-09'),
    (7, 'Elena', '54 Lillian Crossing', '1lena81@gmail.com', '621-623-8422', '2021-10-17'),
    (8, 'Bred', '258 Springs Junction', 'omi10@gmail.com', '0122-384-1837', '2020-11-19'),
    (9, 'Dominic', '824 Mosinee Center', 'd0m@gmail.com', '9257-853-1256', '2021-06-25'),
    (10, 'Jonathan', '98 Arapahoe Terrace', 'joestar@gmail.com', '0432-975-3567', '2020-11-21');

INSERT INTO categories (category_id, category_name) 
VALUES (1, 'products'),
	(2, 'electronics'),
	(3, 'household'),
	(4, 'cosmetics'),
	(5, 'clothes');

INSERT INTO products (product_id, product_name, description, price, promo_price, category_id, created_at)
VALUES (1, 'laptop', 'Laptop ASUS X515EA-BQ950', 3000, 2999, 2, '2020-02-11'),
	(2, 'phone', 'SAMSUNG Galaxy Z Fold3', 1500, 1200, 2, '2020-10-18'),
    (3, 'phone', 'APPLE iPhone 12 5G', 2600, 2199, 2, '2020-05-23'),
    (4, 'phone', 'NOKIA 130 2017', 1200, 999, 2, '2020-09-08'),
    (5, 'phone', 'HUAWEI nova 9 SE', 2200, 2500, 2, '2021-02-11'),
    (6, 'laptop', 'HP 15s-fq3007nq', 3300, 2999, 2, '2020-07-09'),
    (7, 'tablet', 'LENOVO Tab M7 (3rd Gen)', 1400, 1299, 2, '2021-01-01'),
    (8, 'tablet', 'APPLE iPad 9 (2021)', 4999, 4998, 2, '2020-11-03'),
    (9, 'headphones', 'Sony WH-1000XM4 Over-Ear', 2100, 2099, 2, '2020-12-03'),
    (10, 'headphones', 'Beats by Dr. Dre Studio3', 4999, 3600, 2, '2020-03-06'),
    (11, 'headphones', 'Logitech G733 LIGHTSPEED RGB', 4800, 4500, 2, '2020-11-24'),
    (12, 'chocolate', 'Cadbury White Chocolate Buttons 95g', 50, 49, 1, '2019-09-01'),
    (13, 'chocolate', 'Lindt Lindor Strawberries & Cream Truffles 200g', 100, 80, 1, '2020-03-05'),
    (14, 'chocolate', 'M&Ms White Chocolate 42.5g', 30, 15, 1, '2020-02-05'),
    (15, 'marshmallow', 'Kingsway Pink & White Mini Heart Mallows', 55, 50, 1, '2021-01-05'),
    (16, 'marshmallow', 'Frisia Mini Mallow Cables', 60, 25, 1, '2020-08-11'),
    (17, 'jeans', 'Stradivarius slim mom jean with stretch', 599, 400, 5, '2020-02-09'),
    (18, 'jeans', 'ASOS DESIGN high rise ridley', 700, 750, 5, '2020-07-01'),
    (19, 'jeans', 'COLLUSION x006 mom jeans', 1200, 940, 5, '2019-03-25'),
    (20, 'shorts', 'COLLUSION 90s baggy dad shorts ', 1000, 950, 5, '2020-09-01'),
    (21, 'skirt', 'New Look satin midi skirt in pink floral', 1100, 690, 5, '2020-03-09'),
    (22, 'skirt', 'Bershka pleat detail low waist 90s ', 400, 499, 5, '2021-01-09'),
    (23, 'bag', 'ASOS DESIGN crossbody bag', 1200, 999, 3, '2021-02-23'),
    (24, 'bag', 'River Island panelled boxy tote bag ', 900, 500, 3, '2020-03-07'),
    (25, 'glasses', 'Monki 70s aviator sunglasse', 450, 200, 3, '2020-01-12'),
    (26, 'cream', 'CeraVe Hydrating Hyaluronic Acid', 1300, 1200, 4, '2020-03-01'),
    (27, 'serum', 'The Ordinary Niacinamide 10% + Zinc 1% 30ml', 1700, 1400, 4, '2020-11-09'),
    (28, 'cream', 'The Ordinary Natural Moisturising Factors + HA', 2100, 1800, 4, '2019-12-01'),
    (29, 'cleanser', 'CeraVe hydrating hyaluronic acid plumping cleanser', 1700, 1600, 4, '2020-09-16'),
    (30, 'cream', 'The INKEY List Caffeine Eye Cream 15ml', 790, 740, 4, '2020-03-07');

INSERT INTO orders (order_id, customer_id, created_at)
VALUES (1, 1, '2021-06-21'),
	(2, 3, '2021-06-22'),
	(3, 5, '2021-07-12'),
	(4, 3, '2021-07-23'),
	(5, 6, '2021-10-08'),
	(6, 7, '2021-10-25'),
	(7, 2, '2021-11-23'),
	(8, 9, '2021-11-26'),
	(9, 1, '2021-12-02'),
	(10, 10, '2021-12-18'),
	(11, 4, '2021-12-22'),
	(12, 5, '2022-01-01'),
	(13, 7, '2022-01-23'),
	(14, 9, '2022-02-09'),
	(15, 10, '2022-02-11'),
	(16, 2, '2022-03-05'),
	(17, 8, '2022-03-09'),
	(18, 1, '2022-04-12'),
	(19, 2, '2022-05-03'),
	(20, 6, '2022-05-17');    
    
INSERT INTO order_products (order_product_id, order_id, product_id, quantity)
VALUES (1, 1, 24, 3),
	(2, 1, 3, 6),
	(3, 2, 17, 1),
	(4, 2, 6, 8),
	(5, 2, 8, 2),
	(6, 3, 26, 11),
	(7, 3, 12, 2),
	(8, 4, 18, 7),
	(9, 4, 1, 1),
	(10, 5, 3, 14),
	(11, 5, 4, 3),
	(12, 6, 19, 18),
	(13, 6, 30, 3),
	(14, 7, 28, 6),
	(15, 7, 13, 25),
	(16, 8, 2, 2),
	(17, 8, 15, 1),
	(18, 8, 4, 7),
	(19, 8, 21, 30),
	(20, 9, 19, 3),
	(21, 9, 1, 7),
	(22, 10, 17, 19),
	(23, 10, 29, 20),
	(24, 10, 5, 12),
	(25, 11, 8, 4),
	(26, 11, 25, 1),
	(27, 12, 2, 9),
	(28, 12, 4, 4),
	(29, 13, 17, 10),
	(30, 13, 19, 2),
	(31, 13, 20, 3),
	(32, 14, 23, 12),
	(33, 14, 11, 60),
	(34, 15, 2, 6),
	(35, 15, 6, 9),
	(36, 15, 8, 12),
	(37, 16, 22, 3),
	(38, 16, 9, 2),
	(39, 17, 14, 70),
	(40, 17, 7, 7),
	(41, 18, 2, 3),
	(42, 18, 14, 9),
	(43, 18, 30, 10),
	(44, 19, 28, 11),
	(45, 19, 16, 23),
	(46, 20, 1, 1),
	(47, 20, 29, 8),
	(48, 20, 3, 1);
    
    
/*Create a query that returns all the products that have promo_price bigger than price */

SELECT product_id, product_name, price, promo_price
FROM products
WHERE promo_price > price;



/*Create a query that returns the discount (percent from price) offered by the promo_price.*/

SELECT promo_price, price, ROUND((price-promo_price)/price * 100, 2) AS 'discount, %'
FROM products;



/*Create a query that returns the total quantities of products ordered*/

SELECT p.product_id, p.product_name, SUM(op.quantity) AS totalQuantity
FROM order_products op
JOIN products p ON op.product_id = p.product_id 
GROUP BY p.product_id
ORDER BY p.product_id;



/*Create a query that retrieves the most sold products (based on quantities sold)*/

SELECT SUM(op.quantity) AS topSales, p.product_id, p.product_name, p.description
FROM order_products op
JOIN products p ON op.product_id = p.product_id 
GROUP BY p.product_id
ORDER BY topSales DESC
LIMIT 10;



/*Create a query that retrieves the most sold categories*/

SELECT p.category_id, c.category_name, SUM(op.quantity) AS topCategories
FROM order_products op
JOIN products p ON op.product_id = p.product_id 
JOIN categories c ON p.category_id = c.category_id
GROUP BY p.category_id
ORDER BY topCategories DESC;



/*Create a query that will return the total amount of money spent by a customer for all orders*/

SELECT c.customer_id, c.name, SUM(p.promo_price * op.quantity) AS total
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_products op ON o.order_id = op.order_id
JOIN products p ON op.product_id = p.product_id
GROUP BY c.customer_id
ORDER BY c.customer_id;




    
    
