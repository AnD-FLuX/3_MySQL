SELECT * FROM book;

SELECT 	b.name, 
		b.about,
        c.name AS category
	FROM book b
    JOIN category c
    ON b.category_id = c.id;
    
SELECT 	a.name AS author_name, 
		a.surname AS author_suname, 
		b.name AS book_name, 
		b.about
	FROM author_book ab
	JOIN author a ON ab.author_id = a.id
    JOIN book b ON ab.book_id = b.id; 
    
SELECT 	b.name AS book_name, 
		b.about AS book_about,
        c.name AS category,
        a.name AS author_name, 
		a.surname AS author_suname
	FROM author_book ab
	JOIN author a ON ab.author_id = a.id
    JOIN category c ON b.category_id = c.id
    JOIN book b ON ab.book_id = b.id
	ORDER BY b.name; 