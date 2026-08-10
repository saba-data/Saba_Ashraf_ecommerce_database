INSERT INTO users
(full_name,email,phone,hash_password,role)
VALUES

('Ahmed Ali','ahmed@gmail.com','0791111111','hash1','admin'),

('Sara Mohammad','sara@gmail.com','0791111112','hash2','customer'),

('Omar Khaled','omar@gmail.com','0791111113','hash3','customer'),

('Lina Ahmad','lina@gmail.com','0791111114','hash4','customer'),

('Ali Hasan','ali@gmail.com','0791111115','hash5','customer'),

('Noor Salem','noor@gmail.com','0791111116','hash6','customer'),

('Yazan Ahmad','yazan@gmail.com','0791111117','hash7','customer'),

('Rama Naser','rama@gmail.com','0791111118','hash8','customer');

INSERT INTO categories
(name,description)
VALUES

('Laptops','Laptop devices'),

('Smartphones','Mobile phones'),

('Accessories','Computer accessories'),

('Gaming','Gaming products'),

('Audio','Headphones and speakers');
INSERT INTO products
(category_id,name,description,price,quantity_stock,sku)
VALUES

(1,'Dell XPS 13','Laptop',1200,8,'SKU001'),

(1,'HP EliteBook','Laptop',950,5,'SKU002'),

(1,'Lenovo ThinkPad','Laptop',1100,3,'SKU003'),

(1,'MacBook Air','Laptop',1450,4,'SKU004'),

(2,'iPhone 15','Apple Phone',999,10,'SKU005'),

(2,'Samsung S24','Android Phone',850,12,'SKU006'),

(2,'Google Pixel 9','Phone',780,7,'SKU007'),

(2,'Xiaomi 15','Phone',650,15,'SKU008'),

(3,'Mechanical Keyboard','Keyboard',90,20,'SKU009'),

(3,'Wireless Mouse','Mouse',35,40,'SKU010'),

(3,'USB-C Charger','Charger',25,0,'SKU011'),

(3,'HDMI Cable','Cable',15,25,'SKU012'),

(3,'Power Bank','Power Bank',45,16,'SKU013'),

(4,'PlayStation Controller','Controller',75,18,'SKU014'),

(4,'Gaming Headset','Gaming Headset',120,6,'SKU015'),

(4,'Gaming Mouse Pad','Mouse Pad',18,30,'SKU016'),

(4,'Gaming Chair','Chair',250,2,'SKU017'),

(5,'AirPods Pro','Wireless Earbuds',240,14,'SKU018'),

(5,'JBL Speaker','Bluetooth Speaker',160,9,'SKU019'),

(5,'Studio Microphone','Mic',180,0,'SKU020');


INSERT INTO orders
(user_id,status,total_amount,shipping_address,notes)
VALUES

(2,'pending',1290,'Tafilh',''),

(3,'confirmed',850,'Irbid',''),

(4,'processing',275,'Zarqa',''),

(2,'delivered',1500,'Amman',''),

(5,'cancelled',90,'Aqaba',''),

(6,'shipped',1045,'Salt',''),

(3,'pending',180,'Irbid',''),

(5,'confirmed',500,'Madaba',''),

(2,'delivered',160,'Irbid',''),

(7,'processing',1100,'Jerash','');

INSERT INTO payments
(order_id,payment_method,payment_status,amount,transaction_reference,paid_at)
VALUES

(1,'card','paid',1290,'TRX1001',CURRENT_TIMESTAMP),

(2,'cash','paid',850,'TRX1002',CURRENT_TIMESTAMP),

(3,'wallet','paid',275,'TRX1003',CURRENT_TIMESTAMP),

(4,'bank_transfer','paid',1500,'TRX1004',CURRENT_TIMESTAMP),

(5,'card','failed',90,'TRX1005',CURRENT_TIMESTAMP),

(6,'wallet','paid',1045,'TRX1006',CURRENT_TIMESTAMP),

(8,'cash','pending',500,'TRX1007',CURRENT_TIMESTAMP),

(9,'card','paid',160,'TRX1008',CURRENT_TIMESTAMP);

INSERT INTO order_items
(order_id, product_id, quantity, price_unit, subtotal)
VALUES

(1,1,1,1200,1200),
(1,10,2,35,70),
(1,12,1,15,15),

(2,6,1,850,850),
(2,13,2,45,90),

(3,14,1,75,75),
(3,10,2,35,70),
(3,9,1,90,90),

(4,4,1,1450,1450),
(4,12,2,15,30),
(4,19,1,160,160),

(5,9,1,90,90),
(5,16,2,18,36),

(6,3,1,1100,1100),
(6,12,3,15,45),
(6,10,1,35,35),

(7,20,1,180,180),
(7,11,2,25,50),

(8,17,2,250,500),
(8,15,1,120,120),

(9,19,1,160,160),
(9,13,2,45,90),

(10,2,1,950,950),
(10,18,1,240,240),
(10,16,3,18,54);

--التحديث بعد إدخال order_items حتي تطابق القيم total_amount في جدول orders --

UPDATE orders SET total_amount = 1285 WHERE id = 1;
UPDATE orders SET total_amount = 940 WHERE id = 2;
UPDATE orders SET total_amount = 235 WHERE id = 3;
UPDATE orders SET total_amount = 1640 WHERE id = 4;
UPDATE orders SET total_amount = 126 WHERE id = 5;
UPDATE orders SET total_amount = 1180 WHERE id = 6;
UPDATE orders SET total_amount = 230 WHERE id = 7;
UPDATE orders SET total_amount = 620 WHERE id = 8;
UPDATE orders SET total_amount = 250 WHERE id = 9;
UPDATE orders SET total_amount = 1244 WHERE id = 10;


