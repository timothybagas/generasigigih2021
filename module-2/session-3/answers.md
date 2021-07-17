<center>
<h2> Module 2 Session 3 Homework</h2>

<hr>

<b>Timothy Bagaskara H</b> | <b>GBE01149</b>

<br>
</center>

#1) Answer for question number 1
<br>
<img src="HW_Module_2_Session_3.jpeg" style="width:100%;"/>

<br>
#2) Answers for question 2 - 4
<br><br>

```sql
CREATE TABLE items (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    price INT DEFAULT 0
);

INSERT INTO items (name, price) VALUES ("Nasi Goreng Gila", 25000),
("Kerupuk", 0), ("Spaghetti", 40000), ("Green Tea Latte", 18000),
("Air Putih", 2000), ("Vanilla Ice Cream", 13000), ("Cordon Bleu", 36000),
("French Fries", 20000), ("Mango Juice",15000);

-- answers for question number 2
CREATE TABLE customers (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(50),
    phone VARCHAR(20),
    UNIQUE (name, phone)
);

CREATE TABLE orders (
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    customer_id INT NOT NULL,
    quantity INT DEFAULT 0,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES items(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- answers for question number 3
INSERT INTO customers (name, phone) VALUES ("Joni", "+6281198981213"),
("Agus", "+6281255637821"), ("Cindy", "+6289678810902"), ("Lala", "+6282354378894"),
("Rino", "+6289567238912");

INSERT INTO orders (order_id, item_id, customer_id, quantity) VALUES
(1, 1, 1, 1), (1, 5, 1, 1), (2, 3, 2, 1), (2, 4, 2, 1);

INSERT INTO orders (order_id, item_id, customer_id, quantity) VALUES
(3, 3, 5, 1), (3, 9, 5, 1), (3, 6, 5, 1), (4, 7, 3, 1), (4, 5, 3, 1);

INSERT INTO orders (order_id, item_id, customer_id, quantity) VALUES
(5, 8, 4, 2), (5, 4, 4, 1);

-- answer for question number 4
SELECT order_id AS "Order Id", order_date AS "Order Date", customers.name AS "Customer name", 
customers.phone AS "Customer phone", SUM(quantity * items.price) AS "Total", GROUP_CONCAT(items.name) AS "Items bought"
FROM orders JOIN items ON (item_id = items.id) JOIN customers ON (customer_id = customers.id) GROUP BY order_id;
```
