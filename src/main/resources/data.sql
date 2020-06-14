DELETE FROM PRODUCT_CATEGORIES;
DELETE FROM CATEGORY;
DELETE FROM INVOICE_LINE;
DELETE FROM PRODUCT;
DELETE FROM ADDRESS;
DELETE FROM INVOICE;
DELETE FROM CUSTOMER;

INSERT INTO CUSTOMER (NAME) VALUES
  ('John Doe'),
  ('Mike Myers'),
  ('Benny Hill');

INSERT INTO ADDRESS (STREET,STREET_NUMBER,CITY,ZIP_CODE,COUNTRY,ID_CUSTOMER) VALUES
  ('Trust Road','926','Hastings','4178','New Zealand',(select ID from CUSTOMER where NAME='John Doe')),
  ('Somewhere Street',NULL,'New York','10005','United States',(select ID from CUSTOMER where NAME='Mike Myers')),
  ('Thames Street','25B','London','SE10 9DD','United Kingdom',(select ID from CUSTOMER where NAME='Benny Hill'));
  
INSERT INTO CATEGORY (NAME) VALUES
  ('Fragile'),
  ('Hi-Tech'),
  ('Outdoor'),
  ('Kitchenware');
  
INSERT INTO PRODUCT (NAME) VALUES
  ('Picnic Forks'),
  ('Smartphone'),
  ('Autonomous Lawn Mower'),
  ('Mirror');
  
INSERT INTO PRODUCT_CATEGORIES (ID_PRODUCT,ID_CATEGORY) VALUES
  ((select ID from PRODUCT where NAME='Picnic Forks'),(select ID from CATEGORY where NAME='Kitchenware')),
  ((select ID from PRODUCT where NAME='Picnic Forks'),(select ID from CATEGORY where NAME='Outdoor')),
  ((select ID from PRODUCT where NAME='Smartphone'),(select ID from CATEGORY where NAME='Hi-Tech')),
  ((select ID from PRODUCT where NAME='Smartphone'),(select ID from CATEGORY where NAME='Fragile')),
  ((select ID from PRODUCT where NAME='Autonomous Lawn Mower'),(select ID from CATEGORY where NAME='Outdoor')),
  ((select ID from PRODUCT where NAME='Autonomous Lawn Mower'),(select ID from CATEGORY where NAME='Hi-Tech')),
  ((select ID from PRODUCT where NAME='Mirror'),(select ID from CATEGORY where NAME='Fragile'));

INSERT INTO INVOICE (ORDER_NUMBER,ID_CUSTOMER) VALUES
  ('AA123456789A',(select ID from CUSTOMER where NAME='John Doe')),
  ('AA123456789B',(select ID from CUSTOMER where NAME='John Doe')),
  ('BB123456789A',(select ID from CUSTOMER where NAME='Mike Myers')),
  (NULL,(select ID from CUSTOMER where NAME='Benny Hill'));
  
INSERT INTO INVOICE_LINE (ID_PRODUCT,QUANTITY,INVOICE_NUMBER) VALUES
  ((select ID from PRODUCT where NAME='Picnic Forks'),10,(select INVOICE_NUMBER from INVOICE where ORDER_NUMBER='AA123456789A')),
  ((select ID from PRODUCT where NAME='Autonomous Lawn Mower'),1,(select INVOICE_NUMBER from INVOICE where ORDER_NUMBER='AA123456789A')),
  ((select ID from PRODUCT where NAME='Smartphone'),1,(select INVOICE_NUMBER from INVOICE where ORDER_NUMBER='AA123456789B')),
  ((select ID from PRODUCT where NAME='Picnic Forks'),22,(select INVOICE_NUMBER from INVOICE where ORDER_NUMBER='BB123456789A')),
  ((select ID from PRODUCT where NAME='Mirror'),2,(select INVOICE_NUMBER from INVOICE where ORDER_NUMBER='BB123456789A')),
  ((select ID from PRODUCT where NAME='Picnic Forks'),5,(select INVOICE_NUMBER from INVOICE where ORDER_NUMBER IS NULL));