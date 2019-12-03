create table Customer
(
	id int primary key identity(1,1),
	nume varchar(50),
	email varchar(50)
)

create table Products
(
	id int primary key identity(1,1),
	nume varchar(50),
	categoryId int,
	descriere varchar(50),
	price float,
	constraint categoryId foreign key(categoryId) references Category(id)
)

create table Employee
(
	id int primary key identity(1,1),
	nume varchar(50),
	email varchar(50)
)
create table Category
(
	id int primary key identity(1,1),
	nume varchar(50),
	employeeId int,
	constraint employeeId foreign key(employeeId) references Employee(id)
)
create table OrderProduct
(
	orderId int primary key identity(1,1),
	productId int,
	numberOfProducts int,
	constraint orderId foreign key(orderId) references Orders(id)
)
	

create table Orders
(
	id int primary key identity(1,1),
	numar int,
	orderDate date,
	customerId int,
	statusOrder varchar(50),
	totalPrice varchar(50),
	constraint customerId foreign key(customerId) references Customer(id)
)


select * from Employee
select* from Customer
select * from Category
select * from OrderProduct
select * from Products
select * from Orders

insert into Customer(nume,email) values('popescu','wantsome')
insert into Customer(nume,email) values('ionescu','centric')
insert into Customer(nume,email) values('georgescu','wantsome')
insert into Customer(nume,email) values('gheorghe','cegeka')
insert into Customer(nume,email) values('alecsandri','xerox')

insert into Category(nume,employeeId) values('drinks',1)
insert into Category(nume,employeeId) values('snacks',1)
insert into Category(nume,employeeId) values('food',1)

insert into Employee(nume,email) values('employee1','yahoo.com')
insert into Employee(nume,email) values('employee2','wantsome')
insert into Employee(nume,email) values('employee3','gmail')
insert into Employee(nume,email) values('employee4','yahoo.com')
insert into Employee(nume,email) values('employee5','gmail')

insert into Products(nume,categoryId,descriere,price) values ('jack',1,'whisky',70)
insert into Products(nume,categoryId,descriere,price) values ('jb',1,'whisky',50)
insert into Products(nume,categoryId,descriere,price) values ('chivas',1,'whisky',100)
insert into Products(nume,categoryId,descriere,price) values ('lotto',2,'snack',4)
insert into Products(nume,categoryId,descriere,price) values ('lays',2,'snack',10)
insert into Products(nume,categoryId,descriere,price) values ('snickers',2,'snack',7)
insert into Products(nume,categoryId,descriere,price) values ('mars',2,'snack',5)
insert into Products(nume,categoryId,descriere,price) values ('salam',3,'sibiu',20)
insert into Products(nume,categoryId,descriere,price) values ('paine',3,'pambac',3)
insert into Products(nume,categoryId,descriere,price) values ('branza',3,'telemea',15)
insert into Products(nume,categoryId,descriere,price) values ('carne',3,'porc',30)
insert into Products(nume,categoryId,descriere,price) values ('lapte',3,'albalact',7)

insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(1,'2019-03-05',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(2,'2019-04-07',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(3,'2019-03-06',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(4,'2019-03-02',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(5,'2019-01-05',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(6,'2019-03-09',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(7,'2019-09-05',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(8,'2019-03-02',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(9,'2019-04-05',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(10,'2019-04-05',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(11,'2019-04-05',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(12,'2019-04-05',1,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(12,'2019-04-05',2,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(12,'2019-04-05',3,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(12,'2019-04-05',4,'aproved','aproved')
insert into Orders(numar,orderDate,customerId,statusOrder,totalPrice) values(12,'2019-04-05',5,'aproved','aproved')

insert into OrderProduct(productId,numberOfProducts) values(10,3)
insert into OrderProduct(productId,numberOfProducts) values(2,3)
insert into OrderProduct(productId,numberOfProducts) values(3,3)
insert into OrderProduct(productId,numberOfProducts) values(1,3)
insert into OrderProduct(productId,numberOfProducts) values(6,3)
insert into OrderProduct(productId,numberOfProducts) values(8,3)
insert into OrderProduct(productId,numberOfProducts) values(5,3)
insert into OrderProduct(productId,numberOfProducts) values(9,3)
insert into OrderProduct(productId,numberOfProducts) values(11,3)
insert into OrderProduct(productId,numberOfProducts) values(6,3)
insert into OrderProduct(productId,numberOfProducts) values(4,3)
insert into OrderProduct(productId,numberOfProducts) values(5,3)
insert into OrderProduct(productId,numberOfProducts) values(6,3)
insert into OrderProduct(productId,numberOfProducts) values(10,3)
insert into OrderProduct(productId,numberOfProducts) values(2,3)
insert into OrderProduct(productId,numberOfProducts) values(1,3)

--Afisati toti clientii care au in continutul email-ului @wantsome.com.
select * from Customer
where email = 'wantsome';

--Afisati suma preturilor pentru fiecare categorie in parte.
select SUM(price)  as  totalPriceForCat1
from Products
where categoryId = 1;

--Afisati suma preturilor pentru fiecare categorie in parte.
select SUM(price) as totalPriceForCat2
from Products 
where categoryId = 2;

--Afisati suma preturilor pentru fiecare categorie in parte.
select SUM(price) as totalPriceForCat3
from Products 
where categoryId = 3;

--Afisati clientii care au mai mult de 10 comenzi.
select customerId from Orders
where numar>10;

 --Clientii care au comandat produse in primele trei luni ale anului.
select customerId from Orders
where MONTH (orderDate) < 4;

--Creati o procedura care va modifica statusul unui Order. 
update Orders
set statusOrder = 'declined'
where customerId = 1;

--Creati un raport (select cu group by) pentru a afisa vanzarile pentru fiecare produs in parte.
select nume,MIN(numberOfProducts) as NrOfProd
from Products p, OrderProduct o
where p.id = o.productId
group by p.nume

--Creati o functie care va calcula pretul total pentru o anumita comanda.
select price*numberOfProducts
from Products p join OrderProduct o
on p.id = o.productId
where o.orderId = 3;


