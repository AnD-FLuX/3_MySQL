DROP DATABASE IF EXISTS library;
CREATE DATABASE library CHAR SET utf8;
USE library;

CREATE TABLE category (
	id int NOT NULL primary key auto_increment,
	name VARCHAR(120) NOT NULL unique
);

CREATE TABLE book (
	id int NOT NULL primary key auto_increment,
	name VARCHAR(120) NOT NULL,
    about TEXT,
	price DECIMAL(6, 2) NOT NULL,
	isbn varchar(20) NOT NULL unique,
    category_id INT NOT NULL
);

ALTER TABLE book ADD foreign key (category_id)
	references category(id);
    
CREATE TABLE author (
	id int NOT NULL primary key auto_increment,
	name VARCHAR(45) NOT NULL,
    surname VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL unique,
	adress VARCHAR(120),
    author_birthday date NOT NULL,
    book_id INT NOT NULL
);

ALTER TABLE author ADD foreign key (book_id)
	references book(id);





