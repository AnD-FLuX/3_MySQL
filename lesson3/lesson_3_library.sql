drop database if exists library;
create database library char set utf8;
use library;

create table book (
	id int not null primary key auto_increment,
	name varchar(120) not null,
    about text,
    date_public date not null default '2018-01-01',
    category varchar(30) not null,
	isbn varchar(20) not null unique,
	numb_pages int not null,
    author_name varchar(45) not null,
    author_surname varchar(45) not null,
    author_email varchar(45) not null unique,
    author_age int not null,
    author_birthday date not null,
    author_award varchar(120)
);

insert into book (name, about, date_public, category, isbn, numb_pages, author_name, author_surname, author_email, author_age, author_birthday, author_award) 
values
	('Lonely Instinct', 'Wow is the souls of our souls', '2000-07-24', 'Classics', '0-1150-9258-7', 690, 'Lydia', 'Kaiser', 'qnishith143p@nvapplelab.com', 62, '1957-11-22', 'Eric Hoffer Book Award'),
	('Tried for Vice', 'Сapers dreadful sportive by not sun of York', '2015-08-15', 'Horror', '0-8873-9053-6', 396, 'Emelia', 'Long', 'vwa.lc123455@colevillecapital.com', 34, '1986-03-05', 'Writers Digest Self-Published Ebook Award'),
	('The Cold Star', 'Into the alarums pleasing of a monuments', '2001-08-25', 'Fantasy', '0-7154-3441-0', 448, 'Maysa', 'Werner', 'vhliattel.7w@googppmail.com', 28, '1982-12-27', NULL),
	('Perfect Duty', 'In bosom the deep of the buried', '2001-11-10', 'Historical', '0-8841-6870-0', 724, 'Aalia', 'Lord', '3aline.arisigome4@posisiku.pw', 61, '1958-12-11', 'The IndieReaders Discovery Award'),
	('Licensed for Mercy', 'Now are our brows bound with victorious wreaths', '1997-02-23', 'Fantasy', '0-5265-1932-0', 365, 'Elias', 'Mccormick', 'gxamtryx7@levelupworker.com', 39, '1981-07-06', 'The Best Indie Book Award '),
	('Strike the Snake', 'Our bruised arms hung up for monuments', '2007-05-16', 'Classics', '0-4592-9156-4', 59, 'Stewart', 'Soto', 'amtryx7@worker.com', 34, '1986-03-05', NULL),
	('Cold Trap', 'Hi lascivious alarums epapers to merry', '2003-09-22', 'Horror', '0-5094-6014-3', 315, 'Charles', 'Hopper', 'ngorgan.sa@zpp.su', 52, '1968-06-05', NULL),
	('Strange Game', 'Your fright marches to arms bound', '2011-02-28', 'Fantasy', '0-4477-6347-4', 198, 'Lylah', 'Talley', 'helen.kelly.3364@xxxsx.site', 67, '1953-05-09', 'Eric Hoffer Book Award'),
	('Swords Curse', 'Grim-visaged war hath smoothd his wrinkled front', '2014-07-15', 'Fantasy', '0-9745-9495-4', 89, 'Jeanette', 'Hills', '6abdhay_z@optoseo.com', 35, '1985-08-29', NULL),
	('The Gilded Land', 'And now instead of mounting barded steeds', '2018-08-06', 'Fantasy', '0-5426-6456-9', 399, 'Albie', 'Arias', 'hsayan.rexz@jowabols.com', 29, '1990-03-29', 'The Independent Publisher Book Awards'),
	('The Last Stone', 'To fright the souls of fearful adversaries', '2007-05-24', 'Classics', '0-3529-7996-8', 407, 'Anisa', 'Morley', 'wmaibleo@gvwconsulting.com', 23, '1997-07-07', 'Eric Hoffer Book Award'),
	('Touch of Grace', 'In visaged  nimbly in a marches chamber', '2016-10-01', 'Detective', '0-1033-9319-6', 319, 'Ubaid', 'Avalos', 'ibleo@onsulting.com', 41, '1979-06-01', 'Eric Hoffer Book Award'),
	('The Buried Orb', 'We shaped lascivious  of a lute', '2009-08-25', 'Horror', '0-9454-3451-0', 148, 'Shoaib', 'Wu', 'vhlili.sattel.7w@googleappmail.com', 58, '1952-12-27', NULL),
	('The Crystal in the Dark', 'Our dreadful marches to delightful measures', '2009-12-25', 'Detective', '0-2022-7373-3', 121, 'Loui', 'Bentley', 'esemyatu.kamar@mrdevilstore.com', 45, '1975-08-17', 'The Best Indie Book Award '),
	('Oath of Legend', 'But I that am not shaped for sportive tricks', '2016-02-06', 'Detective', '0-5282-1864-6', 308, 'Maysa', 'Bloggs', 'mali.rgad.9@gmailvn.net', 22, '1998-06-16', NULL),
	('The Revenant Star', 'Bruised the stern pleasing of a ladys', '1985-12-31', 'Fantasy', '0-9694-2139-7', 56, 'Melissa', 'Carter', '3shahria@cceee.net', 60, '1960-02-02', NULL),
	('The Heart of the Titan', 'Our stern alarums changed to merry meetings', '2017-05-21', 'Fantasy', '0-7646-9011-6', 264, 'Theodora', 'Greer', 'emarcos.zickaad@usabrains.us', 64, '1956-01-16', 'Eric Hoffer Book Award'),
	('The Dawn of the Nameless', 'He capers nimbly in a ladys chamber', '1998-12-19', 'Classics', '0-3754-8461-2', 431, 'Scarlett-Rose', 'Butler', '4ehea@iatarget.com', 36, '1984-09-29', 'Writer’s Digest Self-Published Ebook Award'),
	('Mystery of the Silent Juror', 'To the lascivious pleasing of a lute', '2002-02-17', 'Historical', '0-3073-6778-9', 168, 'Mandeep', 'Houston', 'zwww200913@coronagg.com', 28, '1992-10-10', NULL),
	('The Screaming Shack', 'Еpapers made to nimbly an amorous fright-glass', '2000-04-03', 'Historical', '0-5798-8810-X', 288, 'Sanah', 'Reynolds', 'krajesh.thakur.5q@fanpoosh.net', 36, '1984-10-05', NULL),
	('To Hook a Star', 'Nor made to court an amorous looking-glass', '2003-08-10', 'Horror', '0-4285-7376-2', 493, 'Danni', 'Joseph', 'hmaream.sallam.9@xxxu.fun', 52, '1968-05-07', 'Rubery Book Prize'),
	('Playground Illusion', 'To strut before a wanton ambling nymph', '2007-11-13', 'Horror', '0-6337-9522-4', 218, 'Shaan', 'Werner', '1e24052013ar@fanpoosh.net', 38, '1982-04-30', 'Rubery Book Prize'),
	('Impossible Bride', 'Now is the winter of our discontent', '2009-04-22', 'Fantasy', '0-9966-3270-0', 287, 'Allison', 'Berry', '5yosrasas@iatarget.com', 31, '1989-05-10', NULL),
	('Wicked Dance', 'Made glorious summer by this sun of York', '2015-09-25', 'Classics', '0-9485-0538-9', 77, 'Rheanna', 'Tanner', 'hmohsin_baig27u@o0i.es', 63, '1957-01-12', NULL),
	('The Daughters of Zion', 'In the deep bosom of the ocean buried', '2012-12-08', 'Historical', '0-9924-1279-X', 442, 'Poppy-Rose', 'Boyd', 'steven.nicholaso@arkansasvalentine.com', 68, '1952-11-21', 'Eric Hoffer Book Award');
	
