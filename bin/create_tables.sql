CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  description varchar(255),
  price decimal(15,2),
  storeid INTEGER,
  stock INTEGER,
  img varchar(75),
  category varchar(10)
);

CREATE INDEX products_name ON products(name);

CREATE TABLE stores (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(100),
  description varchar(255),
  phone_number varchar(15),
  alternate_phone_number varchar(30),
  email_id varchar(50),
  address varchar(255),
  location varchar(50),
  image varchar(50)
);

CREATE TABLE locations (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(100)
);

CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(50),
  password varchar(50),
  phone_number varchar(15),
  alternate_phone_number varchar(30),
  email_id varchar(50),
  role_id INTEGER,
  store_id INTEGER,
  address varchar(255)
);

CREATE TABLE roles (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name varchar(20),UNIQUE (name));

CREATE TABLE hitrate (id INTEGER PRIMARY KEY AUTO_INCREMENT, counter INTEGER, type VARCHAR(15) );

INSERT INTO hitrate (counter,type) values (0,'tilldate');

CREATE TABLE shopping_carts(cart_id INTEGER PRIMARY KEY AUTO_INCREMENT, session_id varchar(50), store_id INTEGER, create_date date, total_amount decimal(15,2), purchase_status varchar(15), eshopper_status varchar(15));

CREATE TABLE shopping_cart_items(id INTEGER PRIMARY KEY AUTO_INCREMENT, cart_id INTEGER, product_id INTEGER, item_quantity INTEGER);

CREATE TABLE shopping_customer_info(id INTEGER PRIMARY KEY AUTO_INCREMENT, cart_id INTEGER, name varchar(50), phone_number varchar(15), alternate_phone_number varchar(15), email_id varchar(50), address varchar(255));

INSERT INTO users (name,password,role_id) values('superadm','superadm','1');

INSERT INTO roles (name) values('admin');
INSERT INTO roles (name) values('store_admin');
INSERT INTO roles (name) values('customer');

create table dues(id INTEGER PRIMARY KEY AUTO_INCREMENT, store_id INTEGER, amount_due INTEGER, commission_percentage INTEGER);

create table product_images(id INTEGER PRIMARY KEY AUTO_INCREMENT,storeid INTEGER, img varchar(100));