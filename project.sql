use sql34;
create table author(authorid int primary key,name varchar(25),country varchar(10));
insert into author values(101,'J.K Rowling','UK'),(102,'George R.R. Martin','USA'),(103,'Dan Brown','USA'),(104,'Agatha Christie','UK');
create table books(booksid int primary key,title varchar(30),authorid int,foreign key(authorid) references author(authorid),price decimal(4,2),stock int);
insert into books values(1,'Harry potter 1',101,20.99,50),(2,'Harry potter 2',101,22.99,40),(3,'Game of Thorens',102,25.5,30),(4,'infero',103,18.75,20),(5,'Murder on the orient',104,15.0,35);
create table customer(customerid int primary key,name varchar(20),email varchar(40));
insert into customer values(201,'alice','alice@gmail.com'),(202,'bob','bob@gmail.com'),(203,'carol','carol@gmail.com'),(204,'dave','dave@gmail.com'),(205,'eve','eve@gmail.com');
create table orders(orderid int primary key,customerid int,foreign key(customerid) references customer(customerid),orderdate date);
insert into orders values(301,201,'2025-12-01'),(302,202,'2025-12-03'),(303,201,'2025-12-04'),(304,203,'2025-12-05');
create table orderdetailstable(orderdetailsid int primary key,orderid int,foreign key(orderid) references orders(orderid),booksid int,foreign key(booksid) references books(booksid),quantity int);
insert into orderdetailstable values(401,301,1,2),(402,301,3,1),(403,302,2,1),(404,303,5,2),(405,304,4,1);
#CRUD Operations
insert into author values(105,'J.R.R. Tolkien','UK');
insert into books values(6,'The Hobbit',105,19.99,25);
update books set stock=60 where booksid=101;
delete from customer where customerid=205;
insert into orders values(305,202,'2025-12-10');
insert into orderdetailstable values(406,305,4,1);
#JOIN Quries
SELECT title,name AS author_name FROM books INNER JOIN author ON authorid = authorid;
#AGGREGATIONS
select authorid, count(*) as total_books from books group by authorid;
select authorid,sum(price) as totalprice from books group by authorid;
select avg(price) from books;
select orderid,count(*) as totalorders from orderdetailstable group by orderid;
#Filtering
select * from books where price>20;
select authorid,count(*) as morethanonebook from books group by authorid having count(*) >1;
select orderid,count(*) as morethanoneorder from orderdetailstable group by orderid having count(*) >1;
select * from orders where orderdate>'2025-12-02';
#sorting
select * from books order by price desc;
select customerid, count(*) as totalorders from orders group by customerid order by totalorders desc limit 3;
select * from books order by title asc;
select * from orders order by orderdate desc;




