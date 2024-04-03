CREATE TABLE inventory(
inventory_id NUMBER(5) CONSTRAINT inventory_inventory_id_pk PRIMARY KEY,
quantity NUMBER(30) CONSTRAINT inventory_quantity_nn NOT NULL,
min NUMBER(25) CONSTRAINT inventory_min_nn NOT NULL,
max NUMBER(25) CONSTRAINT inventory_max_nn NOT NULL
);

CREATE TABLE cust(
customer_id NUMBER(4) CONSTRAINT customer_customer_id_pk PRIMARY KEY,
customer_name VARCHAR2(25) CONSTRAINT customer_customer_name_nn NOT NULL,
address VARCHAR2(60) CONSTRAINT customer_address_nn NOT NULL,
contact_no NUMBER(10) CONSTRAINT customer_contact_no_nn NOT NULL
);

CREATE TABLE supplier(
supplier_id NUMBER(5) CONSTRAINT supplier_supplier_id_pk PRIMARY KEY,
product_type VARCHAR2(25) CONSTRAINT supplier_product_type_nn NOT NULL,
phone_number NUMBER(10) CONSTRAINT supplier_phone_number_nn NOT NULL
);

CREATE TABLE pro(
product_id NUMBER(5) CONSTRAINT pro_product_id_pk PRIMARY KEY,
product_Fname VARCHAR2(20) CONSTRAINT pro_product_Fname_nn NOT NULL,
price NUMBER(6) CONSTRAINT pro_price_nn NOT NULL,
inventory_id NUMBER(5) CONSTRAINT pro_inventory_id_fk REFERENCES inventory(inventory_id)
);

CREATE TABLE sales(
sales_id NUMBER(5) CONSTRAINT sales_sales_id_pk PRIMARY KEY,
sales_date DATE,
quantity_sold NUMBER(20),
customer_id NUMBER(5) CONSTRAINT sales_customer_id_fk REFERENCES cust(customer_id)
);

CREATE TABLE product_sales(
price NUMBER(6) CONSTRAINT product_sales_price_nn NOT NULL,
quantity NUMBER(25) CONSTRAINT product_sales_quantity_nn NOT NULL,
sales_id NUMBER(5) CONSTRAINT sales_sales_id_fk REFERENCES sales(sales_id),
product_id NUMBER(5) CONSTRAINT sales_product_id_fk REFERENCES pro(product_id)
);

CREATE TABLE purchase(
purchase_id NUMBER(5) CONSTRAINT purchase_purchase_id_pk PRIMARY KEY,
supplier_name VARCHAR2(20) CONSTRAINT purchase_supplier_name_nn NOT NULL
);

CREATE TABLE ORD(
order_id NUMBER(5) CONSTRAINT ORD_order_id_pk PRIMARY KEY,
order_date DATE,
quantity_bought NUMBER(20) CONSTRAINT ORD_quantity_bought_nn NOT NULL,
 purchase_id NUMBER(5) CONSTRAINT ORD_purchase_id_fk  REFERENCES purchase(purchase_id),
supplier_id NUMBER(5) CONSTRAINT ORD_supplier_id_fk  REFERENCES supplier(supplier_id)
);

CREATE TABLE has(
product_id NUMBER(5) CONSTRAINT has_product_id_fk REFERENCES pro(product_id),
purchase_id NUMBER(5) CONSTRAINT has_purchase_id_fk REFERENCES purchase(purchase_id),
quantity NUMBER(20) CONSTRAINT has_quantity_nn NOT NULL
);

ALTER TABLE cust
ADD (birthdate date);

ALTER TABLE inventory
ADD (pname varchar2(20) );

ALTER TABLE supplier
ADD CONSTRAINT supplier_supplier_phone_number_product_type_uk UNIQUE(phone_number,product_type);

ALTER TABLE pro
MODIFY (price varchar(10) );

ALTER TABLE has 
add constraint has_purchase_id_product_id_pk primary key(purchase_id, product_id)



INSERT INTO inventory(inventory_id,pname,quantity,min,max)VALUES ('12345','clothes','16','5','40');
INSERT INTO inventory(inventory_id,pname,quantity,min,max)VALUES ('63834', 'fan','75','15','150');
INSERT INTO inventory(inventory_id,pname,quantity,min,max)VALUES ('54723', 'Body lotion','18','2','30');
INSERT INTO inventory(inventory_id,pname,quantity,min,max)VALUES ('22899', 'Toaster', '8','3','10');
INSERT INTO inventory(inventory_id,pname,quantity,min,max)VALUES ('09213', 'Apples', '23', '3','30');
INSERT INTO inventory(inventory_id,pname,quantity,min,max)VALUES ('37823', 'Spinach', '34', '1','30');

INSERT INTO cust(customer_name,customer_id,contact_no,address,)VALUES ('John Smith', '2110', '0544321345','Rockaway Avenue New Milford,CT 06776');
INSERT INTO cust(customer_name,customer_id,contact_no,address)VALUES ('Tom Cook', '2121', '0546241218','7134 St Margarets Ave.Champlin, MN 55316');
INSERT INTO cust(customer_name,customer_id,contact_no,address)VALUES ('Maria Su', '2132', '0523754122','9130 N. Harvey Rd.Lawrence, MA 01841');
INSERT INTO cust(customer_name,customer_id,contact_no,address)VALUES ('Salman Hayek', '2143', '0566324237','40 Rose Ave.New York, NY 10002');
INSERT INTO cust(customer_name,customer_id,contact_no,address)VALUES ('Malek Morel', '2170', '0555765229','99 Trenton Lane Schaumburg, IL 60193');
INSERT INTO cust(customer_name,customer_id,contact_no,address)VALUES ('Seyi Thompson', '2154', '0544509328','9738 Princeton Circle Attleboro, MA 02703');


INSERT INTO supplier(supplier_id,product_type,phone_number)VALUES ('89077','furnitures','0544645567');
INSERT INTO supplier(supplier_id,product_type,phone_number)VALUES ('23882','men wears','0533123456');
INSERT INTO supplier(supplier_id,product_type,phone_number)VALUES ('97474','Cosmetics','0546891011');
INSERT INTO supplier(supplier_id,product_type,phone_number)VALUES ('45678','Electronics','0544213141');
INSERT INTO supplier(supplier_id,product_type,phone_number)VALUES ('91011','Fruits','0567161718');
INSERT INTO supplier(supplier_id,product_type,phone_number)VALUES ('12131','Vegetables','0514192021');


INSERT INTO pro(product_id,product_fname,price)VALUES ('54321','Biscuit','15');
INSERT INTO pro(product_id,product_fname,price)VALUES ('09876','Bread','55');
INSERT INTO pro(product_id,product_fname,price)VALUES ('22212','Body lotion','85');
INSERT INTO pro(product_id,product_fname,price)VALUES ('23964','Toaster','190');
INSERT INTO pro(product_id,product_fname,price)VALUES ('83266','Apples','30');
INSERT INTO pro(product_id,product_fname,price)VALUES ('72565','Spinach','25');


INSERT INTO sales(sales_id,sales_date,quantity_sold)VALUES ('12789', TO_DATE('27-Feb-2023', 'DD/MM/YYYY'),'55');
INSERT INTO sales(sales_id,sales_date,quantity_sold)VALUES ('43892', TO_DATE('27-Feb-2023','DD/MM/YYYY'),'23');
INSERT INTO sales(sales_id,sales_date,quantity_sold)VALUES ('72132', TO_DATE('27-Feb-2023','DD/MM/YYYY'),'125');
INSERT INTO sales(sales_id,sales_date,quantity_sold)VALUES ('65019', TO_DATE('27-Feb-2023','DD/MM/YYYY'),'165');
INSERT INTO sales(sales_id,sales_date,quantity_sold)VALUES ('32145', TO_DATE('27-Feb-2023','DD/MM/YYYY'),'46');
INSERT INTO sales(sales_id,sales_date,quantity_sold)VALUES ('11990', TO_DATE('27-Feb-2023','DD/MM/YYYY'),'73');


INSERT INTO product_sales(price,quantity)VALUES ('72','30');
INSERT INTO product_sales(price,quantity)VALUES ('72','30');
INSERT INTO product_sales(price,quantity)VALUES ('72','30');
INSERT INTO product_sales(price,quantity)VALUES ('72','30');
INSERT INTO product_sales(price,quantity)VALUES ('72','30');
INSERT INTO product_sales(price,quantity)VALUES ('72','30');


INSERT INTO purchase(purchase_id,supplier_name)VALUES ('72234','Ulker');
INSERT INTO purchase(purchase_id,supplier_name)VALUES ('91042','Arsal');
INSERT INTO purchase(purchase_id,supplier_name)VALUES ('12690','Imperial');
INSERT INTO purchase(purchase_id,supplier_name)VALUES ('40132','Narin');
INSERT INTO purchase(purchase_id,supplier_name)VALUES ('10244','Nivea');
INSERT INTO purchase(purchase_id,supplier_name)VALUES ('35019','Binatone');


INSERT INTO ord(order_id,order_date,quantity_bought)VALUES ('72234',TO_DATE('27-Feb-2023','DD/MM/YYYY'),'145');
INSERT INTO ord(order_id,order_date,quantity_bought)VALUES ('13356',TO_DATE('27-Feb-2023','DD/MM/YYYY'),'45');
INSERT INTO ord(order_id,order_date,quantity_bought)VALUES ('89433',TO_DATE('27-Feb-2023','DD/MM/YYYY'),'69');
INSERT INTO ord(order_id,order_date,quantity_bought)VALUES ('30984',TO_DATE('27-Feb-2023','DD/MM/YYYY'),'45');
INSERT INTO ord(order_id,order_date,quantity_bought)VALUES ('23555',TO_DATE('27-Feb-2023','DD/MM/YYYY'),'45');
INSERT INTO ord(order_id,order_date,quantity_bought)VALUES ('98375',TO_DATE('27-Feb-2023','DD/MM/YYYY'),'45');


INSERT INTO has(quantity,product_id,purchase_id) VALUES ('45','54321','72234');
INSERT INTO has(quantity,product_id,purchase_id) VALUES ('45','09876','91042');
INSERT INTO has(quantity,product_id,purchase_id) VALUES ('45','22212','10244');
INSERT INTO has(quantity,product_id,purchase_id) VALUES ('45','83266','40132');
INSERT INTO has(quantity,product_id,purchase_id) VALUES ('45','72565','12690');
INSERT INTO has(quantity,product_id,purchase_id) VALUES ('45','72565','35019');

select *
from has 

UPDATE inventory
SET quantity='100'
WHERE inventory_id='63834';

UPDATE has 
set product_id
where qq = 


UPDATE cust
set birthdate = '24-jan-1998'
where customer_name = 'John Smith'

UPDATE cust
set birthdate = '24-feb-1996'
where customer_name = 'Tom Cook'

UPDATE cust
set birthdate = '20-jan-1998'
where customer_name = 'Maria Su'

UPDATE cust
set birthdate = '24-jan-1988'
where customer_name = 'Salman Hayek'

UPDATE cust
set birthdate = '22-aug-2000'
where customer_name = 'Malek Morel'

UPDATE cust
set birthdate = '22-aug-2000'
where customer_name = 'Seyi Thompson'

UPDATE cust
SET address='8878 Parker Avenue Lake Worth, FL 33463'
WHERE customer_name='Maria Su';

UPDATE supplier
SET supplier_id='48379'
WHERE phone_number='0544213141';

UPDATE pro
SET price='55'
WHERE product_id='34323';

UPDATE sales
SET sales_id='72132'
WHERE quantity_sold='100';



update pro
set inventory_id ='12345'
where product_fname= 'Biscuit'

update pro
set inventory_id ='37823'
where product_fname= 'Spinach'

update pro
set inventory_id ='09213'
where product_fname= 'Apples'

update pro
set inventory_id ='22899'
where product_fname= 'Toaster'

update pro
set inventory_id ='54723'
where product_fname= 'Body lotion'

update pro
set inventory_id ='63834'
where product_fname= 'Bread'

DELETE  from cust
WHERE customer_id='2154';

DELETE  from cust
WHERE customer_name='Tom Cook';

DELETE  from cust
WHERE customer_name='Salman Hayek';

DELETE  from cust
WHERE customer_id='2170';

DELETE  from sales
WHERE sales_id='65019';

select *
from cust 

select *
from pro

select product_id, quantity 
from has 

select customer_name
from  cust
where customer_id ='2121'

select *
from ORD 


DROP TABLE inventory cascade;
DROP TABLE cust cascade;
DROP TABLE pro cascade;
DROP TABLE purchase cascade;
DROP TABLE supplier cascade;