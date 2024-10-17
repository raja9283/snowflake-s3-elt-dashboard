
CREATE OR REPLACE TABLE products (
    product_id INT PRIMARY KEY,
    product_name STRING,
    category STRING,
    subcategory STRING,
    price FLOAT
);

CREATE OR REPLACE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name STRING,
    email STRING,
    location STRING,
    age_group STRING
);

CREATE OR REPLACE TABLE events (
    event_id INT,
    event_type STRING,
    product_id INT,
    customer_id INT,
    event_time TIMESTAMP,
    quantity INT,
    price FLOAT
);

