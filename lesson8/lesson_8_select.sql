
UPDATE users SET is_deleted = true WHERE id in (5, 10, 15);

SELECT * FROM users WHERE is_deleted = false;

SELECT count(id) AS total_users 
	FROM users
		WHERE is_deleted = false;

SELECT  reg_date, 
		first_name, 
		last_name
	FROM users
		WHERE is_deleted = false
			ORDER by reg_date;
      
SELECT  first_name, 
		last_name, 
		nick_name, 
        reg_date
	FROM users
		WHERE first_name = 'Eva'
			AND is_deleted = false;
        
SELECT  first_name, 
		last_name, 
		nick_name, 
        min(reg_date) AS first_reg_user
	FROM users
		WHERE is_deleted = false;


UPDATE albums SET is_deleted = true WHERE id in (4, 5, 6);

SELECT * FROM albums WHERE is_deleted = false;

SELECT	u.nick_name, 
		a.name AS album_name
	FROM albums a
		JOIN users u ON a.user_id = u.id
			AND u.is_deleted = false
			AND a.is_deleted = false;

SELECT	u.first_name, 
		u.last_name, 
		count(a.id) AS total_albums
	FROM albums a
		JOIN users u ON a.user_id = u.id
			AND u.is_deleted = false
            AND a.is_deleted = false
			AND u.id = 1;


UPDATE photos SET is_deleted = true WHERE id in (5, 10, 15, 20, 25, 30, 35, 40, 45, 50);

SELECT * FROM photos
	WHERE is_deleted = false;

SELECT 	count(p.id) AS total_del_photo
       FROM photos p
			WHERE is_deleted = true;

SELECT 	u.nick_name,
		a.name AS album_name,
        p.name AS photo_name,
        p.url,
        p.create_date
	FROM photos p
		JOIN users u ON p.user_id = u.id
			AND u.is_deleted = false
        JOIN albums a ON p.album_id = a.id
			AND a.is_deleted = false
            AND p.is_deleted = false;

SELECT 	u.nick_name,
		p.name AS photo_name,
        p.url
	FROM photos p
		JOIN users u ON p.user_id = u.id
			AND u.is_deleted = false
        JOIN albums a ON p.album_id = a.id
			AND a.is_deleted = false
			AND p.is_deleted = false
            AND p.url like '%.com';

SELECT	u.nick_name, 	
		u.first_name,
		u.last_name,
		count(p.id) AS total_photo
	FROM photos p
		JOIN users u ON p.user_id = u.id
			AND u.is_deleted = false
        JOIN albums a ON p.album_id = a.id
			AND a.is_deleted = false
            AND p.is_deleted = false
			AND u.nick_name = 'Odessa2'; 
            
SELECT	u.nick_name, 	
		u.first_name,
		u.last_name,
		count(p.id) AS total_photo
	FROM photos p
		JOIN users u ON p.user_id = u.id
			AND u.is_deleted = false
        JOIN albums a ON p.album_id = a.id
			AND a.is_deleted = false
            AND p.is_deleted = false
				GROUP by u.nick_name; 
   
   
   
SELECT * FROM likes;
	
SELECT count(l.user_id) AS total_likes
	FROM likes l
		JOIN users u ON l.user_id = u.id
			AND u.is_deleted = false
        JOIN photos p ON l.photo_id = p.id
			AND p.is_deleted = false
		JOIN albums a ON p.album_id = a.id 
			AND a.is_deleted = false; 

SELECT count(l.user_id) AS total_day_likes
	FROM likes l
		JOIN users u ON l.user_id = u.id
			AND u.is_deleted = false
        JOIN photos p ON l.photo_id = p.id
			AND p.is_deleted = false
		JOIN albums a ON p.album_id = a.id 
			AND a.is_deleted = false
			AND created_at BETWEEN '2020-10-19' AND '2020-10-22'
            AND u.nick_name = 'Miller_A'; 
    
SELECT 	u.nick_name,
		l.created_at,
		p.name AS photo_name
	FROM likes l
		JOIN users u ON l.user_id = u.id
			AND u.is_deleted = false
        JOIN photos p ON l.photo_id = p.id
			AND p.is_deleted = false
		JOIN albums a ON p.album_id = a.id 
			AND a.is_deleted = false
				LIMIT 100, 10;  
    
SELECT 	u.nick_name,
		count(p.url) AS total_like
	FROM likes l
		JOIN users u ON l.user_id = u.id
			AND u.is_deleted = false
        JOIN photos p ON l.photo_id = p.id
			AND p.is_deleted = false
		JOIN albums a ON p.album_id = a.id 
			AND a.is_deleted = false		
				GROUP by u.nick_name
					ORDER by total_like DESC;

SELECT 	p.name AS photo_name,
		count(p.url) AS total_like
	FROM likes l
		JOIN users u ON l.user_id = u.id
			AND u.is_deleted = false
        JOIN photos p ON l.photo_id = p.id
			AND p.is_deleted = false
		JOIN albums a ON p.album_id = a.id 
			AND a.is_deleted = false		
				GROUP by p.name
					ORDER by total_like DESC;

UPDATE chat SET is_deleted = true WHERE id in (3, 6, 11, 15); 

SELECT * FROM chat
	WHERE is_deleted = false;
    
SELECT 	u.nick_name, 	
		c.name
	FROM chat c
		JOIN users u ON c.user_id = u.id
			AND u.is_deleted = false
            AND c.is_deleted = false;
        
SELECT 	u.nick_name, 	
		count(c.name) AS total_chat
	FROM chat c
		JOIN users u ON c.user_id = u.id
			AND u.is_deleted = false
            AND c.is_deleted = false
				GROUP by u.nick_name;


UPDATE messages SET is_deleted = true WHERE id in (2, 8, 9, 14, 18, 21, 26, 31, 38, 40); 

SELECT * FROM messages;

SELECT 	u.nick_name,
		count(m.text) AS total_message
	FROM messages m
		JOIN users u ON m.user_id = u.id
			AND u.is_deleted = false
		JOIN chat c ON m.chat_id = c.id
			AND c.is_deleted = false
            AND m.is_deleted = false
				GROUP by u.nick_name
					ORDER by total_message DESC;
  

SELECT 	u.nick_name,
		c.name AS chat_name,
		m.text AS message, 
        uu.nick_name AS to_user
	FROM messages m
		JOIN users u ON m.user_id = u.id
			AND u.is_deleted = false
		JOIN chat c ON m.chat_id = c.id
			AND c.is_deleted = false
            AND m.is_deleted = false
        JOIN users uu ON c.user_id = uu.id;


SELECT 	u.nick_name,
		m.text AS message
	FROM messages m
		JOIN users u ON m.user_id = u.id
        	AND u.is_deleted = false
		JOIN chat c ON m.chat_id = c.id
			AND c.is_deleted = false
            AND m.is_deleted = false
			AND text like '%you%';


      
        
        
        
        