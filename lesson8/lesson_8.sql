DROP DATABASE IF EXISTS social_network;
CREATE DATABASE social_network CHAR SET utf8;
USE social_network;
SELECT database();

CREATE TABLE users(
	id INT NOT NULL primary key auto_increment,
	nick_name VARCHAR(25) NOT NULL unique,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
    reg_date TIMESTAMP DEFAULT NOW(),
    is_deleted BOOLEAN default false
);

CREATE TABLE albums(
	id INT NOT NULL primary key auto_increment,
	name VARCHAR(255) NOT NULL,
	user_id INT NOT NULL,
    is_deleted BOOLEAN default false
);

CREATE TABLE photos(
	id INT NOT NULL primary key auto_increment,
	name VARCHAR(255),
	url VARCHAR(255) NOT NULL,
    album_id INT NOT NULL,
	user_id	INT NOT NULL,
    create_date TIMESTAMP DEFAULT NOW(),
    is_deleted BOOLEAN default false
    );

CREATE TABLE likes(
	user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY(user_id, photo_id)
);

CREATE TABLE chat(
	id INT NOT NULL primary key auto_increment,
	name VARCHAR(50),
	user_id INT NOT NULL,
    is_deleted BOOLEAN default false
);

CREATE TABLE messages(
	id INT NOT NULL primary key auto_increment,
	chat_id INT NOT NULL,
	user_id INT NOT NULL,
    text TEXT,
	date TIMESTAMP DEFAULT NOW(),
    is_deleted BOOLEAN default false
  );
 
CREATE INDEX idx_nick_name ON users(nick_name);
  
ALTER TABLE albums ADD FOREIGN KEY (user_id) REFERENCES users(id);  
ALTER TABLE photos ADD FOREIGN KEY (user_id) REFERENCES users(id); 
ALTER TABLE photos ADD FOREIGN KEY (album_id) REFERENCES albums(id); 
ALTER TABLE likes ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE likes ADD FOREIGN KEY (photo_id) REFERENCES photos(id);
ALTER TABLE chat ADD FOREIGN KEY (user_id) REFERENCES users(id); 
ALTER TABLE messages ADD FOREIGN KEY (chat_id) REFERENCES chat(id);
ALTER TABLE messages ADD FOREIGN KEY (user_id) REFERENCES users(id); 
 
INSERT INTO users(nick_name, first_name, last_name, reg_date) 
	VALUES
		('Jaclyn81', 'Robert', 'May', '2017-04-02 17:11:21.417'), 
		('Arely_Bogan63', 'Patrick', 'Christensen', '2016-08-13 01:28:43.085'), 
		('Miller_A', 'Andre', 'Miller', '2016-12-07 01:04:39.298'), 
		('Travon.Waters', 'Paul', 'Stewart', '2017-04-30 13:26:14.496'), 
		('Kasandra_Homenick', 'Richard', 'Gonzales', '2016-12-12 06:50:07.996'), 
		('Gus93', 'Tammy', 'Allen', '2016-06-24 19:36:30.978'), 
		('Dereck65', 'Eva', 'Hall', '2017-01-19 01:34:14.296'), 
		('Alexandro35', 'Robert', 'Williams', '2017-03-29 17:09:02.344'), 
		('Esther.Zulauf61', 'Crystal', 'Howell', '2017-02-06 23:29:16.394'),
		('Billy52', 'James', 'Price', '2016-10-05 14:10:20.453'), 
		('Odessa2', 'Constance', 'Barnes', '2016-10-21 18:16:56.390'), 
		('Hailee26', 'Matthew', 'Payne', '2017-04-29 18:53:39.650'), 
		('Delpha.Kihn', 'Dawn', 'Schwartz', '2016-08-31 02:42:30.288'), 
		('Aniya_Hackett', 'John', 'Miles', '2017-01-23 11:51:15.467'),
		('Kenneth64', 'Matthew ', 'Barnett', '2016-12-27 09:48:17.380');

INSERT INTO albums(name, user_id) 
	VALUES 
		('Harlaszloan', 1), ('Belle', 1), ('Vonawanislaw', 2), ('Inat', 3),
		('Hueyahto', 4), ('Geliese', 5), ('Brianella', 6), ('Ximel', 6),
		('Rielairellac', 7), ('Reyne', 8), ('Yle', 9), ('Eavandonoral', 10),
		('Uyle', 11), ('Mle', 12), ('Ynishan', 12), ('Lannabeldasa', 12),
		('Barylliann', 13), ('Ssa', 14), ('Landi', 15), ('Deniamha', 15);

INSERT INTO photos(name, url, album_id, user_id) 
	VALUES 
		('Orcor', 'http://elijah.biz', 1, 1), ('Wealdu', 'https://shanon.org', 1, 1), 
		('Gerey', 'http://vicky.biz', 1, 1), ('Wyne', 'http://oleta.net', 2, 1), 
		('Gyles', 'https://jennings.biz', 2, 1), ('Reyny', 'https://quinn.biz', 3, 2), 
		('Helmod', 'https://selina.name', 3, 2), ('Aeglorht', 'http://malvina.org', 3, 2), 
		('Helmaer', 'https://branson.biz', 3, 2), ('Angert', 'https://elenor.name', 4, 3), 
		('Lafa', 'https://marcelino.com', 4, 3), ('Wulfa', 'http://felicity.name', 4, 3), 
		('Arthugh', 'https://fred.com', 4, 3), ('Arkell', 'https://gerhard.biz', 5, 4), 
		('Cynsi', 'https://sherwood.net', 5, 4), ('Wyny', 'https://maudie.org', 5, 4), 
		('Thelmund', 'http://annamae.name', 7, 6), ('Beorhtio', 'https://mac.org', 7, 6), 
		('Ryany', 'http://miracle.info', 8, 6), ('Eamartas', 'http://emmet.com', 8, 6),
		('Altartas', 'https://lisa.com', 8, 6), ('Findanye', 'https://brooklyn.name', 10, 8), 
		('Ebriatiel', 'http://madison.net', 10, 8), ('Finde', 'http://annie.name', 10, 8), 
		('Laserie', 'http://darron.info', 10, 8), ('Nellothel', 'http://saige.com', 11, 9), 
		('Serielye', 'https://reece.net', 11, 9), ('Gilminye', 'http://vance.org', 11, 9), 
		('Nelotie', 'http://ignacio.net', 11, 9), ('Acer', 'http://kenny.com', 12, 10), 
		('Ilikal', 'http://remington.name', 12, 10), ('Amubar', 'http://kurtis.info', 12, 10), 
		('Nusuma', 'https://alisha.com', 13, 11), ('Ningoni', 'https://henderson.com', 13, 11), 
		('Akin', 'http://bonnie.info', 13, 11), ('Dukuru', 'http://kennith.net', 13, 11),
		('Namzuu', 'http://camille.name', 13, 11), ('Dituubta', 'http://alena.net', 14, 12), 
		('Ilikal', 'http://ralph.name', 14, 12), ('Zeramma', 'https://tyshawn.com', 15, 12), 
		('Aresuuk', 'https://adella.net', 16, 12), ('Nergirsu', 'https://easter.net', 17, 13), 
		('Gezaba', 'http://golden.org', 17, 13), ('Heanunna', 'http://kendall.biz', 17, 13),
		('Sacesu', 'https://glenda.info', 17, 13), ('Tecatu', 'http://tomacit.ziz', 18, 14),
        ('Berabu', 'http://dominic.biz', 19, 15), ('Enlirsuh', 'http://tressie.info', 20, 15), 
        ('Sumubi', 'http://estevan.org', 20, 15), ('Sangirsu', 'http://zena.com', 20, 15);
        
INSERT INTO likes(user_id, photo_id) 
	VALUES 
		(2, 1), (5, 1), (9, 1), (10, 1), (11, 1), (14, 1), 
		(3, 2), (5, 2), (6, 2), (8, 2), (14, 2), 
		(4, 3), (5, 3), (12, 3), (14, 3), (15, 3), 
		(2, 4), (4, 4), (5, 4), (10, 4), (11, 4), (12, 4), (13, 4), (14, 4), (15, 4), 
		(1, 5), (3, 1), (4, 5), (5, 5), (6, 5), (11, 5), (14, 5), (15, 5),
		(4, 6), (5, 6), (14, 6),
		(3, 7), (4, 7), (5, 7), (9, 7), (12, 7), (14, 7), 
		(2, 8), (5, 8), (14, 8), 
		(2, 9), (3, 9), (5, 9), (6, 9), (14, 9), (15, 9), 
		(2, 10), (4, 10), (5, 10), (9, 10), (10, 10), (14, 10), 
		(2, 11), (5, 11), (6, 11), (10, 11), (14, 11),
		(2, 12), (5, 12), (12, 12), (13, 12), (14, 12), 
		(2, 13), (5, 13), (6, 13), (11, 13), (13, 13), (14, 13), 
		(5, 14), (11, 14), (13, 14), (14, 14), (15, 14), 
		(2, 15), (5, 15), (10, 15), (14, 15), (15, 15), 
		(5, 16), (8, 16), (10, 16), (14, 16), 
		(4, 17), (5, 17), (11, 17), (14, 17), 
		(5, 18), (10, 18), (12, 18), (14, 18), 
		(4, 19), (5, 19), (6, 19), (10, 19), (13, 19), (14, 19), 
		(4, 20), (5, 20), (9, 20), (12, 20), (14, 20), 
		(5, 21), (9, 21), (10, 21), (14, 21), 
		(4, 22), (5, 22), (8, 22), (13, 22), (14, 22), 
		(2, 23), (3, 23), (5, 23), (9, 23), (12, 23), (14, 23), (15, 23), 
		(4, 24), (5, 24), (6, 24), (14, 24), (15, 24), 
		(2, 25), (5, 25), (10, 25), (13, 25), (14, 25), (15, 25),
		(3, 26), (5, 26), (8, 26), (14, 26), (15, 26), 
		(2, 27), (5, 27), (9, 27), (10, 27), (11, 27), (14, 27), 
		(3, 28), (5, 28), (6, 28), (9, 28), (12, 28), (13, 28), (14, 28), 
		(3, 29), (4, 29), (5, 29), (6, 29), (8, 29), (12, 29), (14, 29), 
		(2, 30), (3, 30), (5, 30), (6, 30), (8, 30), (9, 30), (14, 30),
		(4, 31), (5, 31), (9, 31), (13, 31), (14, 31), (15, 31), 
		(5, 32), (8, 32), (11, 32), (14, 32), 
		(5, 33), (10, 33), (11, 33), (12, 33), (14, 33), (15, 33),
		(2, 34), (5, 34), (14, 34), 
		(5, 35), (8, 35), (14, 35), (15, 35), 
		(2, 36), (3, 36), (5, 36), (6, 36), (8, 36), (9, 36), (14, 36), 
		(4, 37), (5, 37), (6, 37), (11, 37), (12, 37), (14, 37), 
		(3, 38), (5, 38), (8, 38), (10, 38), (11, 38), (14, 38), 
		(2, 39), (4, 39), (5, 39), (11, 39), (14, 39), (15, 39), 
		(5, 40), (6, 40), (9, 40), (10, 40), (11, 40), (13, 40), (14, 40), 
		(2, 41), (3, 41), (5, 41), (6, 41), (12, 41), (13, 41), (14, 41), 
		(4, 42), (5, 42), (8, 42), (10, 42), (11, 42), (14, 42), 
		(2, 43), (4, 43), (5, 43), (6, 43), (12, 43), (13, 43), (14, 43), (15, 43), 
		(5, 44), (10, 44), (14, 44), 
		(2, 45), (5, 45), (6, 45), (8, 45), (9, 45), (11, 45), (12, 45), (14, 45), 
		(4, 46), (5, 46), (12, 46), (14, 46), (15, 46), 
		(4, 47), (5, 47), (6, 47), (9, 47), (13, 47), (14, 47), 
		(2, 48), (4, 48), (5, 48), (9, 48), (11, 48), (12, 48), (14, 48), 
		(2, 49), (3, 49), (4, 49), (5, 49), (11, 49), (12, 49), (14, 49), (15, 49), 
		(2, 50), (5, 50), (6, 50), (8, 50), (12, 50), (14, 50);


INSERT INTO chat(name, user_id) 
	VALUES 
		('group', 1),	('pick', 1), ('crypt', 1), ('cast', 2), ('final', 4), 
		('gunplay', 5), ('positive', 6), ('academy', 6), ('norm', 7), ('drip', 9),
		('forty', 11), ('water', 12), ('hatch', 13), ('flaw', 14), ('fraction', 15);


INSERT INTO messages(chat_id, user_id, text) 
	VALUES 
		(1, 2, 'Do you like Cheese Whiz?'), (1, 2, 'Spray tan?'), (1, 2, 'Fake eyelashes?'), 
        (1, 2, 'as it will always have a place'), (1, 2, 'in the web workers toolbox'), 
        (2, 4, 'That what is Lorem Ipsum to many—it'), 
        (2, 4, 'rubs them the wrong way all the way.'), (3, 5, 'Its unreal, uncanny'), (3, 5, 'Makes you wonder if something is wrong'), 
        (3, 5, 'It seems to seek your attention for all the wrong reasons.'), (3, 5, 'Usually, we prefer the real thing'), 
        (4, 7, 'Wine without sulfur based preservatives'), (4, 7, 'Real butter, not margarine'), 
        (5, 2, 'And so we like our layouts'), (5, 2, 'but it comes in a deserved second.'),  
        (5, 2, 'Anyway, you still use Lorem Ipsum and rightly so'), (6, 2, 'and designs to be filled with real words'), 
        (6, 2, 'with thoughts that count'), (6, 2, 'information that has value.'),
        (7, 11, 'The toppings you may chose for that TV'), 
        (8, 12, 'Dinner pizza slice when you forgot to shop for foods'), (8, 12, 'The paint you may slap on your face'),
        (9, 13, 'to impress the new boss is your business.'), 
        (10, 14, 'But what about your daily bread?' ), (10, 14, 'Design comps, layouts, wireframes—will your'),
        (10, 14, 'clients accept that you go about things the facile way?'), 
        (11, 1, 'Authorities in our business will tell'), 
        (12, 2, 'in no uncertain terms that Lorem'), (12, 2, 'Ipsum is that huge, huge no no to forswear forever.'), 
        (13, 3, 'Not so fast'), (13, 3, 'I say, there are some redeeming factors' ), (13, 3, 'in favor of greeking text'), 
        (13, 3, 'as its use is merely the symptom'),
        (14, 4, 'a worse problem to take into consideration.'), (14, 4, 'You begin with a text'), (14, 4, 'you sculpt information'),
        (14, 4, 'you chisel away whats not needed'), (14, 4, 'you come to the point, make things clear'),
        (15, 5, 'add value, youre a content person, you like words.'), (15, 5, 'Design is no afterthought far from it');

