-- Restaurant Owners
-- 5 Tables
-- 1x Fact, 4x Dimension
-- search google, how to add foreign key
-- write SQL 3-5 queries analyze data
-- 1x subquery/ with

CREATE TABLE menus (
  menu_id INT,
  menu_name TEXT,
  price REAL  
);

INSERT INTO menus values
(1, 'Croffle', 55),
(2, 'Brownie', 60),
(3, 'Cornflake', 85),
(4, 'Cake', 30);

CREATE TABLE orders (
  order_id INT,
  name TEXT,
  menu_name TEXT,
  Quantity REAL,
  amount REAL
);

INSERT INTO orders values
  (1, 'Clark', 'Brownie', 2, 60*2),
  (2, 'Martha', 'Cake', 10, 10*30),
  (3, 'Oliver', 'Croffle', 5, 5*55),
  (4, 'Jimmy', 'Cornflake', 2, 2*85);

CREATE TABLE dates (
  order_id INT,
  name TEXT,
  order_date date,
  amount REAL
);

INSERT INTO dates values
  (1, 'Clark', '2022-04-13', 120),
  (2, 'Martha', '2022-04-13', 300),
  (3, 'Oliver', '2022-04-14', 275),
  (4, 'Jimmy', '2022-04-15', 170);

CREATE TABLE branchs (
  order_id INT,
  branch_location TEXT,
  employee_name TEXT,
  amount REAL
);

INSERT INTO branchs values
  (1, 'Kansas', 'Joey', 120),
  (2, 'Kansas', 'Joey', 300),
  (3, 'Washington DC', 'Kara', 275),
  (4, 'Florida', 'Pete', 170);

CREATE TABLE customer_survey (
  customer_id INT,
  customer_name TEXT,
  rate TEXT
);

INSERT INTO customer_survey values
  (1, 'Clark', 'Good'),
  (2, 'Martha', 'Excellent!!'),
  (3, 'Oliver', 'Poor'),
  (4, 'Jimmy', 'Good');

.mode markdown
.header on

SELECT * FROM menus;
SELECT * FROM orders;
SELECT * FROM dates;
SELECT * FROM branchs;
SELECT * FROM customer_survey;

SELECT
  orders.order_id,
  orders.name,
  dates.order_date,
  orders.amount,
  branchs.branch_location
  FROM orders
  LEFT JOIN dates, branchs
  ON orders.order_id = dates.order_id
  AND orders.amount = branchs.amount