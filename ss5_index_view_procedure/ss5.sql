CREATE DATABASE demo;
USE demo;
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    productcode VARCHAR(50) NOT NULL,
    productname VARCHAR(100) NOT NULL,
    productprice DECIMAL(10,2) NOT NULL,
    productamount INT NOT NULL,
    productdescription TEXT,
    productstatus VARCHAR(50)
);
INSERT INTO products (productcode, productname, productprice, productamount, productdescription, productstatus)
VALUES ('P001', 'Product 1', 10.50, 100, 'Description 1', 'Active'),
       ('P002', 'Product 2', 20.00, 200, 'Description 2', 'Active'),
       ('P003', 'Product 3', 15.75, 150, 'Description 3', 'Inactive');
ALTER TABLE products
ADD UNIQUE INDEX idx_productcode (productcode),
ADD INDEX idx_productname_price (productname, productprice);
-- Câu truy vấn trước khi tạo index
EXPLAIN SELECT * FROM products WHERE productcode = 'P001';
-- Câu truy vấn sau khi tạo index
EXPLAIN SELECT * FROM products WHERE productname = 'Product 1' AND productprice = 10.50;

-- Tạo view
CREATE VIEW product_view AS
SELECT productcode, productname, productprice, productstatus
FROM products;

-- Sửa đổi view
ALTER VIEW product_view
AS
SELECT productcode, productname, productprice, productamount
FROM products;

-- Xoá view
DROP VIEW product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng products
delimiter //
create procedure get_all_products() 
begin 
    select * from products ;
end //
delimiter 

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
CREATE PROCEDURE add_product(IN p_productcode VARCHAR(50), IN p_productname VARCHAR(100), IN p_productprice DECIMAL(10,2), IN p_productamount INT, IN p_productdescription TEXT, IN p_productstatus VARCHAR(50))
BEGIN
    INSERT INTO products (productcode, productname, productprice, productamount, productdescription, productstatus)
    VALUES (p_productcode, p_productname, p_productprice, p_productamount, p_productdescription, p_productstatus);
END //
delimiter 
-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
CREATE PROCEDURE update_product(IN p_id INT, IN p_productname VARCHAR(100), IN p_productprice DECIMAL(10,2), IN p_productamount INT, IN p_productdescription TEXT, IN p_productstatus VARCHAR(50))
BEGIN
    UPDATE products
    SET productname = p_productname, productprice = p_productprice, productamount = p_productamount, productdescription = p_productdescription, productstatus = p_productstatus
    WHERE id = p_id;
END //
delimiter 
-- Tạo store procedure xoá sản phẩm theo id
delimiter //
CREATE PROCEDURE delete_product(IN p_id INT)
BEGIN
    DELETE FROM products WHERE id = p_id;
END //
delimiter 




