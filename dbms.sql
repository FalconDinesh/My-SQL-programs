drop table pincode;

create table pincode(
pc number(6),
location varchar(20),
constraint pc_pk primary key (pc));

desc pincode;

insert into pincode values
	(435142,'boston');
insert into pincode values
    (523234,'texas');
insert into pincode values
	(134686,'canberra');
insert into pincode values
	(002155,'newyork');

select * from pincode;

DROP TABLE employee;

CREATE TABLE employee(
empno NUMBER(3),
name VARCHAR(20),
dob DATE,
pc NUMBER(6),
city VARCHAR(20) );

desc employee;


INSERT into employee values
(321,'dinesh','29-jan-1943',625555,'chennai');

INSERT into employee values
(531,'sarathy','21-mar-1943',623434,'chennai');

INSERT into employee values
(337,'gokul','25-sep-1943',623234,'chennai');

INSERT into employee values
(111,'shanker','13-jul-1943',622224,'chennai');

INSERT into employee values
(310,'praba','07-jan-1943',626444,'chennai');

select * from employee;
