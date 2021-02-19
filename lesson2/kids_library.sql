drop database if exists kids_library;
create database kids_library char set utf8;
use kids_library;

create table book (
	id int not null primary key auto_increment,
	book_name varchar(120) not null,
    about varchar(255) default 'Опис відсутній',
    date_public date not null default '2018-01-01',
    author varchar(60) not null,
    category varchar(30) not null
);

insert into book (book_name, about, date_public, author, category) 
values
	('Лис Тимко та його сад', 'Казкова розповідь від автора бестселерів за версією «Нью-Йорк Таймс»', '2019-01-09', 'Браян Л.', 'Дошкільнятам'),
    ('Мені не потрібен собака', 'Історія дружби хлопчика, який понад усе любив грати в комп’ютерні ігри, з покинутою собакою.', '2020-02-20', 'Золотковська Т.', 'Дошкільнятам'),
    ('Павучок без імені', 'Добра зворушлива повчальна казка, надрукована великим шрифтом.', '2019-11-19', 'Радушинська О.', 'Дошкільнятам'),
	('Чарлі і великий скляний ліфт', 'Дитячий фентезійний роман, продовження «Чарлі і шоколадна фабрика».', '2020-03-15', 'Дал Р.', 'Дошкільнятам');
    
insert into book (book_name, about, author, category) 
	values  
    ('Дракон із шоколадним серцем', 'Чарівна й пригодницька книжка, сповнена добра й справжньої дружби, номінант ріноманітних премій і рейтингів.', 'Берджис С.', 'Дітям середнього віку'),
    ('Бізнес для початківців', 'Посібник допоможе краще зрозуміти світові економічні процеси.', 'Браян Л.', 'Дітям середнього віку'),
     ('Інструкція до запасного серця', 'Надзвичайно чуттєвий роман про підлітків.', 'Мюррей Т.', 'Дітям середнього віку'),
	('Атлас монстрів і привидів', 'Атлас поділено на розділи, кожен із яких пов’язаний із певною частиною світу.', 'Маґрін Ф.', 'Дітям середнього віку');
    
insert into book (book_name, author, date_public, category) 
	values  
    ('Як витримати дорослих і не з’їхати з глузду', 'Чольвіньська-Школік А. ', '2020-05-20', 'Дітям старшого  віку'),
    ('Як витримати хлопців і не з’їхати з глузду', 'Чольвіньська-Школік А. ', '2020-05-21', 'Дітям старшого  віку');

select * from book;
    