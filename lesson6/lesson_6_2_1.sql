DROP DATABASE IF EXISTS car_bazar;
CREATE DATABASE car_bazar CHAR SET utf8;
USE car_bazar;

CREATE TABLE type (
	id int NOT NULL primary key auto_increment,
    name VARCHAR(45) NOT NULL unique
); 

CREATE TABLE manufacturer (
	id int NOT NULL primary key auto_increment,
	brand VARCHAR(45) NOT NULL unique,
    type_id int NOT NULL
);

ALTER TABLE manufacturer ADD foreign key (type_id)
	references type(id);

CREATE TABLE year(
	id int NOT NULL primary key auto_increment,
	year date NOT NULL,
    model_year VARCHAR(45) NOT NULL unique
);

 CREATE TABLE model (
	id int NOT NULL primary key auto_increment,
	model_name VARCHAR(45) NOT NULL,
	year_id int NOT NULL,
    manufacturer_id int NOT NULL
 );
 
ALTER TABLE model ADD foreign key (manufacturer_id)
	references manufacturer(id);
    
ALTER TABLE model ADD foreign key (year_id)
	references year(id);   
 
CREATE TABLE region (
	id int NOT NULL primary key auto_increment,
    country VARCHAR(45) NOT NULL unique
);

CREATE TABLE city (
	id int NOT NULL primary key auto_increment,
    city VARCHAR(45) NOT NULL unique,
    region_id int NOT NULL
);

ALTER TABLE city ADD foreign key (region_id)
	references region(id); 

CREATE TABLE color (
	id int NOT NULL primary key auto_increment,
    name VARCHAR(25) NOT NULL unique
);


CREATE TABLE car (
	id int NOT NULL primary key auto_increment,
    model_id int NOT NULL,
    city_id int NOT NULL,
	color_id int NOT NULL,
	price DECIMAL(10, 2) NOT NULL
);
    
ALTER TABLE car ADD foreign key (model_id)
	references model(id); 

ALTER TABLE car ADD foreign key (city_id)
	references city(id); 
    
ALTER TABLE car ADD foreign key (color_id)
	references color(id); 
    
    
    
INSERT INTO type (name) 
	VALUES  
		('auto'), ('moto'), ('bus'), ('truck');
    
INSERT INTO manufacturer (brand, type_id) 
	VALUES 	
		('BMW', 1), ('AUDI', 1), ('Mercedes-Benz', 1), 
        ('Ducati', 2), ('Honda', 2),
		('Bravia', 3), 
        ('MAN', 4);

INSERT INTO year (year, model_year)
	VALUES 	
		('2001-12-12', 'E46'), ('2005-12-12', 'E90'), ('2006-01-01', 'E60'), 
		('2020-01-01', 'B9'), ('2018-02-03', 'C8'), 
        ('1998-02-05', 'W220'), ('2005-08-04', 'W221'), 
        ('2014-04-04', 'Panigale'), ('2017-07-17', 'Panigale R'), ('2018-08-18', '650R'), ('2016-06-16', '1000RR'),
        ('2020-01-01', '636'), ('2020-02-20', '599'),
        ('2018-08-08', 'EfficientLine 3'), ('2020-10-10', 'D38');

INSERT INTO model (manufacturer_id, model_name, year_id)
	VALUES 
		(1, '320', 1), (1, '335', 2), (1, '530', 3),
		(2, 'A4', 4), (2, 'A6', 5), 
        (3, 'S500', 6), (3, 'S350', 7),
        (4, '1199', 8), (4, '1299', 8), (4, '1199', 9),
        (5, 'CBR', 10), (5, 'CBR', 11),
        (6, 'Swan', 12), (6, 'Swan', 13),
        (7, 'TGX', 14), (7, 'TGX', 15);
		
INSERT INTO region (country)
	VALUES 
		('Ukraine'), ('Poland'), ('Germany');
        
INSERT INTO city (city, region_id)
	VALUES 
		('Lutsk', 1), ('Lviv', 1),  ('Rivne', 1),
		('Warsaw', 2), ('Lublin', 2),  ('Krakiw', 2),
        ('Berlin', 3), ('Hamburg', 3),  ('Frankfurt', 3);
INSERT INTO color (name)
	VALUES ('Black'), ('White'), ('Red'), ('Silver');
 

INSERT INTO car (model_id, city_id, color_id, price)
	VALUES 
		(1, 1, 1, 8888.88),
        (1, 4, 2, 4800),
        (1, 7, 4, 7000),
        (1, 4, 2, 5500),
        (2, 3, 4, 15500.99),
        (2, 7, 1, 12500),
        (3, 7, 4, 11111),
        (3, 9, 2, 12200),
        (3, 5, 3, 5555.55),
        (4, 2, 1, 12345.50),
        (4, 6, 4, 9500),
        (5, 3, 3, 8500),
        (5, 4, 2, 52000),
        (6, 2, 1, 8888.88),
        (6, 1, 2, 11000),
        (7, 6, 4, 7000),
        (7, 3, 2, 6000),
        (8, 8, 4, 15500.99),
        (8, 5, 1, 12500),
        (9, 7, 1, 8800),
        (9, 1, 2, 5000),
        (10, 4, 4, 7000),
        (10, 2, 2, 4999.99),
        (11, 1, 4, 13999.99),
        (11, 2, 1, 12500),
		(12, 6, 2, 25000),
        (13, 5, 4, 197000),
        (14, 3, 2, 115000),
        (15, 4, 4, 95500.99),
        (16, 8, 1, 112500);










