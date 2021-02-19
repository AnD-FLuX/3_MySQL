select database();

select * from book;
select * from book where id = 5 or id = 10 or id = 15;
select * from book where numb_pages > 150;
select * from book where author_age > 30;
select * from book where author_award is null;
select * from book where author_email = '3shahria@cceee.net';
select * from book where isbn = '0-5265-1932-0';
select * from book where category = 'Fantasy';
select * from book where numb_pages > 150 and author_age > 25;
select * from book where category = 'Classics' or category = 'Horror';
select * from book order by name asc;
select * from book order by author_email asc;
select * from book order by numb_pages desc;
select distinct category from book;
select distinct author_name from book;
select * from book where date_public > '2000-01-01';
select * from book where date_public < '2010-01-01';

