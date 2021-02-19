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
    author_birthday date NOT NULL
);

CREATE TABLE author_book (
	author_id INT NOT NULL,
	book_id INT NOT NULL
);

ALTER TABLE author_book ADD foreign key (author_id)
	references author(id);
ALTER TABLE author_book ADD foreign key (book_id)
	references book(id);
    
INSERT INTO  category (name) 
	VALUES ('Fantasy'), ('Detectiv'), ('Romans');

INSERT INTO book (name, about, price, isbn, category_id)
	VALUES 
		('Lonely Instinct', 'Wow is the souls of our souls', 219.02, '0-1150-9258-7', 1),
		('Tried for Vice', 'Сapers dreadful sportive by not sun of York', 116.52, '0-8873-9053-6', 1),
		('The Cold Star', 'Into the alarums pleasing of a monuments', 513.84, '0-7154-3441-0', 2),
		('Perfect Duty', 'In bosom the deep of the buried', 274.26, '0-8841-6870-0', 2),
		('Licensed for Mercy', 'Now are our brows bound with victorious wreaths',  136.90, '0-5265-1932-0', 3);

INSERT INTO  author (name, surname, email, adress, author_birthday)
	VALUES
		('Stewart', 'Soto', 'amtryx7@worker.com', 'New-York', '1986-03-05'),
		('Charles', 'Hopper', 'ngorgan.sa@zpp.su', 'Kiev', '1968-06-05'),
		('Shoaib', 'Wu', 'vhlili.sattel.7w@googleappmail.com', 'Lviv', '1952-12-27'),
		('Melissa', 'Carter', '3shahria@cceee.net', 'Berlin', '1960-02-02');
        
INSERT INTO author_book (author_id, book_id)
	VALUES	(1, 1), (1, 2), (1, 3), (2, 3), (2, 4), (3, 5), (4, 1), (4, 4);
    
