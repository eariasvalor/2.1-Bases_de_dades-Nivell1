CREATE DATABASE culdampolla_optics;
USE culdampolla_optics;
CREATE TABLE provider (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
address VARCHAR(100),
telephone VARCHAR(20),
fax VARCHAR(20),
NIF VARCHAR(10)
);
CREATE TABLE glasses (
id INT AUTO_INCREMENT PRIMARY KEY,
brand VARCHAR(50) NOT NULL,
prescription_left FLOAT,
prescription_right FLOAT,
frame_type ENUM ("Rimless", "Plastic", "Metal"),
frame_color VARCHAR(20),
left_glass_color VARCHAR(20),
right_glass_color VARCHAR(20),
price FLOAT,
id_provider INT,
FOREIGN KEY (id_provider) REFERENCES provider(id)
);

CREATE TABLE customer(
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
address VARCHAR(120),
telephone VARCHAR(20),
email VARCHAR(120),
registration_date DATE
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


