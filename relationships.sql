-- Relationships (one to one, one to many, many to many)
-- products and orders (one to many)

CREATE TABLE products (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price INTEGER NOT NULL,
    stock INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_id INTEGER NOT NULL REFERENCES products(id), -- foreign key, which is used to reference records in other tables
    quantity INTEGER NOT NULL,
    customer TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO products (name, price, stock) VALUES
("Smocha", 60, 100),
("Soda", 50, 23);

SELECT * FROM products;

INSERT INTO orders (product_id, quantity, customer) VALUES
(1, 3, "Victor Mboche"),
(1, 2, "Yvonne Kajuju")

SELECT * FROM orders;

-- Select the single product
SELECT * FROM products WHERE id = 1;
-- step two, get all orders for the product
SELECT * FROM orders WHERE product_id = 1;

-- We can combine the above two queries into one by using joins
SELECT products.id, products.name AS product_name, products.price, orders.id, orders.customer, orders.quantity FROM products
LEFT JOIN orders ON products.id = orders.product_id
WHERE products.id = 1;
