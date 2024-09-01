use computer_shop;
CREATE TABLE Laptop (
	code int NOT NULL ,
	model varchar(4) NOT NULL ,
	speed decimal(4, 0) NOT NULL ,
	ram decimal(4, 0) NOT NULL ,
	hd decimal(3, 0) NOT NULL ,
	screen int NOT NULL , 
	price float NOT NULL 
); 

CREATE TABLE PC (
	code int NOT NULL ,
	model varchar (4) NOT NULL ,
	speed decimal(4, 0) NOT NULL ,
	ram decimal(4, 0) NOT NULL ,
	hd decimal(3, 0) NOT NULL ,
	cd varchar (3) NOT NULL ,
	price float NOT NULL 
);

CREATE TABLE Product (
	maker char(1) NOT NULL ,
	model varchar(4) NOT NULL ,
	type varchar(7) NOT NULL 
);

CREATE TABLE Printer (
	code int NOT NULL ,
	model varchar(4) NOT NULL ,
	color char(1) NOT NULL ,
	type varchar(6) NOT NULL ,
	price float NOT NULL 
);

ALTER TABLE Laptop ADD CONSTRAINT PK_Laptop PRIMARY KEY  NONCLUSTERED (code);

ALTER TABLE PC ADD CONSTRAINT PK_PC PRIMARY KEY  NONCLUSTERED (code);

ALTER TABLE Product ADD CONSTRAINT PK_Product PRIMARY KEY  NONCLUSTERED (model);

ALTER TABLE Printer ADD CONSTRAINT PK_Printer PRIMARY KEY  NONCLUSTERED (code);

ALTER TABLE Laptop ADD CONSTRAINT FK_Laptop_Product FOREIGN KEY (model) REFERENCES Product(model);

ALTER TABLE PC ADD CONSTRAINT FK_PC_Product FOREIGN KEY (model) REFERENCES Product(model);

ALTER TABLE Printer ADD CONSTRAINT FK_Printer_Product FOREIGN KEY (model) REFERENCES Product(model);
-- -------------Product 
insert into Product values('A','1001','PC');
insert into Product values('A','1002','PC');
insert into Product values('A','1003','PC');
insert into Product values('A','2004','laptop');
insert into Product values('A','2005','laptop');
insert into Product values('A','2006','laptop');
insert into Product values('B','1004','PC');
insert into Product values('B','1005','PC');
insert into Product values('B','1006','PC');
insert into Product values('B','2001','laptop');
insert into Product values('B','2002','laptop');
insert into Product values('B','2003','laptop');
insert into Product values('C','1007','PC');
insert into Product values('C','1008','PC');
insert into Product values('C','2008','Laptop');
insert into Product values('C','2009','Laptop');
insert into Product values('C','3002','Printer');
insert into Product values('C','3003','Printer');
insert into Product values('C','3006','Printer');
insert into Product values('D','1009','PC');
insert into Product values('D','1010','PC');
insert into Product values('D','1011','PC');
insert into Product values('D','2007','Laptop');
insert into Product values('E','1012','PC');
insert into Product values('E','1013','PC');
insert into Product values('E','2010','laptop');
insert into Product values('F','3001','Printer');
insert into Product values('F','3004','Printer');
insert into Product values('G','3005','Printer');
insert into Product values('H','3007','Printer');																												
-- PC------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into PC values(1,'1001',700,64,5,'12x',600);
insert into PC values(2,'1002',1500,128,14,'40x',1800);
insert into PC values(3,'1003',866,64,5,'12x',950);
insert into PC values(4,'1004',866,128,14,'40x',966);
insert into PC values(5,'1005',1000,128,20,'40x',850);
insert into PC values(6,'1005',1000,128,20,'50x',950);
insert into PC values(7,'1006',1400,64,20,'50x',2100);
insert into PC values(8,'1007',700,64,8,'24x',600);
insert into PC values(9,'1007',733,64,10,'24x',610);
insert into PC values(10,'1008',700,32,10,'12x',600);
insert into PC values(11,'1009',1200,128,40,'40x',980);
insert into PC values(12,'1010',750,128,40,'40x',980);
insert into PC values(13,'1011',1100,128,40,'40x',980);
insert into PC values(14,'1012',350,128,20,'40x',390);
insert into PC values(15,'1012',350,128,40,'40x',400);
insert into PC values(16,'1013',733,128,40,'40x',800);																																																												
-- Laptop------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into Laptop values(1,'2001',700,64,5,12.1,1448);
insert into Laptop values(2,'2002',800,96,10,15.1,2584);
insert into Laptop values(3,'2003',850,64,10,15.1,2738);
insert into Laptop values(4,'2002',800,96,10,15.1,2584);
insert into Laptop values(5,'2003',850,64,10,15.1,2738);
insert into Laptop values(6,'2004',550,32,5,12.1,999);
insert into Laptop values(7,'2005',600,64,6,12.1,2399);
insert into Laptop values(8,'2006',800,96,20,15.7,2999);
insert into Laptop values(9,'2007',850,128,20,15.0,3099);
insert into Laptop values(10,'2008',650,64,10,12.1,1249);
insert into Laptop values(11,'2009',750,256,20,15.1,2599);
insert into Laptop values(12,'2010',366,64,10,12.1,1499);
                                                                                                                                                                                                                                              
-- Printer------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
insert into printer values(1,'3001','y','Jet',400);
insert into Printer values(2,'3002','y','Jet',270);
insert into Printer values(3,'3003','n','Laser',290);
insert into Printer values(4,'3004','y','Jet',150);
insert into Printer values(5,'3005','y','Matrix',150);
insert into Printer values(6,'3006','y','Laser',270);
insert into Printer values(7,'3006','Y','Laser',150);
insert into Printer values(8,'3007','n','Laser',400);


describe product;
select count(*) from product;
select count(*) from pc;
select count(*) from Laptop;
select count(*) from printer;