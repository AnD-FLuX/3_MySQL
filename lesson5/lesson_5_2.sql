DROP DATABASE IF EXISTS car_bazar;
CREATE DATABASE car_bazar CHAR SET utf8;
USE car_bazar;

CREATE TABLE type (
	id int NOT NULL primary key auto_increment,
    type VARCHAR(45) NOT NULL unique
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
	model_name VARCHAR(45) NOT NULL unique,
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
    type_id int,
   	region_id int,
	color_id int,
	price DECIMAL(6, 2) NOT NULL
);

ALTER TABLE car ADD foreign key (type_id)
	references type(id); 
    
ALTER TABLE car ADD foreign key (region_id)
	references region(id); 
    
ALTER TABLE car ADD foreign key (color_id)
	references color(id); 
    
