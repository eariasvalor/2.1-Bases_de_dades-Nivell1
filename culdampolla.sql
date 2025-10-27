CREATE DATABASE culdampolla;
USE culdampolla;

CREATE TABLE address(
id INT AUTO_INCREMENT PRIMARY KEY,
street VARCHAR(80) NOT NULL,
house_number VARCHAR(5) NOT NULL,
floor VARCHAR(25) NOT NULL,
door VARCHAR(10) NOT NULL,
city VARCHAR(50) NOT NULL,
postal_code VARCHAR(15) NOT NULL,
country VARCHAR(59) NOT NULL
);

CREATE TABLE provider (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
address_id INT NOT NULL,
telephone VARCHAR(20),
fax VARCHAR(20),
NIF VARCHAR(10),
FOREIGN KEY (address_id) REFERENCES address(id)
);

CREATE TABLE brand (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
id_provider INT NOT NULL,
FOREIGN KEY (id_provider) REFERENCES provider(id)
ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE glasses (
id INT AUTO_INCREMENT PRIMARY KEY,
id_brand INT NOT NULL,
prescription_left FLOAT,
prescription_right FLOAT,
frame_type ENUM ("Rimless", "Plastic", "Metal"),
frame_color VARCHAR(20),
left_glass_color VARCHAR(20),
right_glass_color VARCHAR(20),
price FLOAT,
FOREIGN KEY (id_brand) REFERENCES brand(id)
ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE customer(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
address_id INT NOT NULL,
telephone VARCHAR(20),
email VARCHAR(120),
registration_date DATE,
FOREIGN KEY (address_id) REFERENCES address(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE customer
ADD id_referral INT NULL AFTER registration_date,
ADD CONSTRAINT fk_referral_customer
FOREIGN KEY (id_referral)
REFERENCES customer(id)
ON UPDATE CASCADE
ON DELETE SET NULL;

CREATE TABLE employee (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

CREATE TABLE sale (
id INT AUTO_INCREMENT PRIMARY KEY,
id_employee INT NOT NULL,
id_customer INT NOT NULL,
sale_date DATE NOT NULL,
FOREIGN KEY (id_employee) REFERENCES employee(id),
FOREIGN KEY (id_customer) REFERENCES customer(id)
);

CREATE TABLE sale_detail (
id_sale INT NOT NULL,
id_glasses INT NULL,
quantity INT DEFAULT 1,
price_unit FLOAT,
FOREIGN KEY (id_sale) REFERENCES sale(id)
ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (id_glasses) REFERENCES glasses(id)
ON UPDATE CASCADE ON DELETE SET NULL
);


