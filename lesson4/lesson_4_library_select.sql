SELECT database();
USE library;

SELECT * FROM books;
UPDATE books SET author_surname = 'Ololo' WHERE id in (10, 15);
SELECT	count(*) FROM books WHERE author_award is not null;
SELECT name, about, date_public, category, isbn, numb_pages FROM books WHERE numb_pages	= (SELECT min(numb_pages) FROM books);
SELECT max(numb_pages) FROM books;
SELECT avg(price) FROM books;
SELECT count(*)  FROM books WHERE category = 'Horror';
SELECT min(price) FROM books;
SELECT * FROM books WHERE price = (SELECT min(price) FROM books);
SELECT id, name, category, about, round(price, 4)  FROM books ORDER BY name;
SELECT * FROM books ORDER BY date_public LIMIT 5, 5;
SELECT * FROM books ORDER BY date_public LIMIT 10, 6;
SELECT * FROM books WHERE author_birthday LIKE '199%';
SELECT * FROM books WHERE name LIKE 'The_%';
SELECT * FROM books WHERE author_email LIKE '%.com';
SELECT * FROM books WHERE price BETWEEN 50 and 120;
SELECT * FROM books WHERE price NOT BETWEEN 200 and 600;

DELETE FROM books WHERE id = 11;

SET sql_safe_updates = 0;
DELETE FROM books WHERE name = 'Wicked Dance';
SET sql_safe_updates = 1;

DELETE FROM books WHERE isbn = '0-9694-2139-7';