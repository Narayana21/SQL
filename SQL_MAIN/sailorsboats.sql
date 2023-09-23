create table Sailors ( 
	sid int PRIMARY KEY, 
	sname varchar(20), 
	rating int, 
	age float); 

create table Boats ( 
	bid int PRIMARY KEY, 
	bname varchar(20), 
	color varchar(20) ); 

create table Reserves ( 
	sid int, 
	bid int, 
	day date, 
PRIMARY KEY (sid,bid,day), 
FOREIGN KEY (sid) REFERENCES Sailors(sid), 
FOREIGN KEY (bid) REFERENCES Boats(bid) ); 


insert into Sailors values (22, 'Dustin', 7, 45.0); 
insert into Sailors values (29, 'Brutus', 1, 33.0); 
insert into Sailors values (31, 'Lubber', 8, 55.0); 
insert into Sailors values (32, 'Andy', 8, 25.0); 
insert into Sailors values (58, 'Rusty', 10, 35.0); 
insert into Sailors values (64, 'Horatio', 7, 35.0); 
insert into Sailors values (71, 'Zorba', 10, 16.0); 
insert into Sailors values (74, 'Horatio', 9, 35.0); 
insert into Sailors values (85, 'Art', 3, 25.5); 
insert into Sailors values (95, 'Bob', 3, 63.5); 

insert into Boats values (101, 'Interlake', 'blue'); 
insert into Boats values (102, 'Interlake', 'red'); 
insert into Boats values (103, 'Clipper', 'green'); 
insert into Boats values (104, 'Marine', 'red'); 

insert into Reserves values (22, 101, '10/10/98'); 
insert into Reserves values (22, 102, '10/10/98'); 
insert into Reserves values (22, 103, '10/8/98'); 
insert into Reserves values (22, 104, '10/7/98'); 
insert into Reserves values (31, 102, '11/10/98'); 
insert into Reserves values (31, 103, '11/6/98'); 
insert into Reserves values (31, 104, '11/12/98'); 
insert into Reserves values (64, 101, '9/5/98'); 
insert into Reserves values (64, 102, '9/8/98'); 
insert into Reserves values (74, 103, '9/8/98'); 


select * from sailors;
select * from boats;
select * from reserves;