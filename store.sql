CREATE database Store;
use Store;

ALTER TABLE categories ADD category_id INT NOT NULL auto_increment;

ALTER TABLE categories DROP COLUMN category_id;

ALTER TABLE categories ADD cat_id INT NOT NULL AUTO_INCREMENT;

DROP TABLE categories;

CREATE TABLE categories(
Name  VARCHAR(200)
);

ALTER TABLE categories ADD cat_id INT NOT NULL AUTO_INCREMENT;

DROP TABLE categories;

CREATE TABLE categories(
Name  VARCHAR(200),
Cat_ID INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(Cat_ID)
);
select * from categories;

insert into categories (Name) values("cat");
INSERT INTO categories(Name)  VALUES ('books' );

SELECT Name from categories WHERE Name="books";
SELECT * from categories;


SELECT * FROM categories WHERE Cat_ID=1;



ALTER TABLE categories CHANGE `Name` `name`  VARCHAR(200);
ALTER TABLE categories CHANGE `CAT_ID` `id` INT NOT NULL AUTO_INCREMENT;

CREATE TABLE products(
title VARCHAR(70),
description VARCHAR(500),
price INT NOT NULL,
img_url VARCHAR(500),
favorite BOOLEAN
);

ALTER TABLE products MODIFY price FLOAT NOT NULL;

SELECT * FROM categories;

DELETE FROM categories WHERE id= 1;

SELECT * FROM categories;

DELETE FROM categories WHERE name= ('books');

SELECT * FROM categories;

DELETE FROM categories WHERE name= ('clothing');

SELECT * FROM categories;

DELETE FROM categories WHERE name= ('food');

INSERT INTO categories(Name)  VALUES ('snacks' );
SELECT * FROM categories;
INSERT INTO categories(Name)  VALUES ('toiletries' );
SELECT * FROM categories;
INSERT INTO categories(Name)  VALUES ('confectionery' );
SELECT * FROM categories;


ALTER TABLE products ADD category INT NOT NULL;
SELECT * FROM products;
SELECT * FROM categories;

INSERT INTO products  VALUES ('Kit Kat Bar','Crunchy Chocolate',2.00 ,'./images/kitkat.png',false,14);
SELECT * FROM products;
INSERT INTO products  VALUES ('M&MS','Peanuty Chocolate',2.00 ,'./images/mms.png',false,14);
INSERT INTO products  VALUES ('TrailMix','Mix to satisfy your sweet and savory cravings',5.00 ,'./images/trailmix.png',false,12);
INSERT INTO products  VALUES ('Colgate','Toothpaste',3.00 ,'./images/toothpaste.png',false,12);
Select * FROM products;


SELECT categories.name, products.title
FROM products 
INNER JOIN categories ON categories.id = products.category
ORDER BY categories.id;

SELECT categories.name, products.title
FROM products 
INNER JOIN categories ON categories.id = products.category
ORDER BY categories.id;


INSERT INTO products  VALUE('Hersheys', 'creamy', 3.00, 'https://theamericancandystore.co.uk/647/hersheys-cookies-n-creme-giant-bar-198g.jpg', 'false',14) ;
INSERT INTO products  VALUE('Hersheys', 'creamy', 3.00, 'https://theamericancandystore.co.uk/647/hersheys-cookies-n-creme-giant-bar-198g.jpg', false,14) ;
SELECT * FROM products;
SELECT * FROM products;
ALTER TABLE products ADD FOREIGN KEY(category) REFERENCES categories(id);
ALTER TABLE products ADD product_id INT NOT NULL AUTO_INCREMENT;

ALTER TABLE products ADD product_id INT;
ALTER TABLE products CHANGE  `product_id` `product_id`  INT NOT NULL AUTO_INCREMENT;

Drop Table products;

CREATE TABLE products(
product_id INT NOT NULL AUTO_INCREMENT,
id INT NOT NULL,
title VARCHAR(70),
description VARCHAR(500),
price INT NOT NULL,
img_url VARCHAR(500),
favorite BOOLEAN,
PRIMARY KEY(product_id),
FOREIGN KEY (id)
REFERENCES categories(id)
ON UPDATE CASCADE
ON DELETE RESTRICT
);

Select * From products;
INSERT INTO products(id,title,description,price,img_url, favorite) VALUES(14, "Kit Kat", "crunchy chocolate", 2.00, '/Users/sheinatolmas/Desktop/store/images/kitkat.png', false); 

SELECT * FROM products ;

SELECT categories.name, products.title
FROM products 
INNER JOIN categories ON categories.id = products.id
ORDER BY categories.id;
Select * From products;

ALTER TABLE products CHANGE `id` `category`  INT NOT NULL;
Select * From products;
Drop Table products;

CREATE TABLE products(
product_id INT NOT NULL AUTO_INCREMENT UNIQUE,
title VARCHAR(70) NOT NULL UNIQUE,
description TEXT,
favorite BOOLEAN,
price INT NOT NULL,
img_url VARCHAR(500),
category  INT,
PRIMARY KEY(product_id),
FOREIGN KEY (category)
REFERENCES categories(id)
ON UPDATE CASCADE
ON DELETE RESTRICT
);

INSERT INTO products(title,description,favorite, price,img_url, category) VALUES( "Kit Kat", "crunchy chocolate", false, 2.00, '/Users/sheinatolmas/Desktop/store/images/kitkat.png', 14); 
SELECT * From products;
SELECT * FROM products;

ALTER TABLE products CHANGE `description` `desc`  TEXT;
ALTER TABLE products CHANGE `desc` `description`  TEXT;
SELECT * FROM products;
ALTER TABLE products CHANGE `product_id` `id` INT NOT NULL AUTO_INCREMENT UNIQUE;
SELECT * FROM  products;

DELETE FROM products WHERE title="lols";
SELECT * FROM  products;
DELETE FROM products WHERE title="Skittles";
SELECT * FROM  products;
DELETE FROM products WHERE description="none";
SELECT * FROM  products;
DELETE FROM products WHERE title="mrs fields";
SELECT * FROM  products;

INSERT INTO products(title, description, favorite, price, img_url, category) VALUES ('M&MS','Peanuty Chocolate',false, 2.00 ,'./images/mms.png',14);
INSERT INTO products(title, description, favorite, price, img_url, category) VALUES ('Gillette Razor','For a clean shaver',false, 8.00 ,'./images/razor.png',13);
INSERT INTO products(title, description, favorite, price, img_url, category) VALUES ('Snyders Honeymustard Pretzels','flavorful pretzel piecesr',false, 8.00 ,'./images/pretzels.png',12);
INSERT INTO products(title, description, favorite, price, img_url, category) VALUES ('Neutrogena Face Wash','light facewash',false, 8.00 ,'./images/neutrogena.png',13);
INSERT INTO products(title, description, favorite, price, img_url, category) VALUES ('Nature Valley Granola Bites','hearty granola',false, 8.00 ,'./images/granola.png',12);







