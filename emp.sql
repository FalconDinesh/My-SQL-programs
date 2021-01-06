DROP TABLE employee;

CREATE TABLE employee(
empno NUMBER(3),
name VARCHAR(20),
dob DATE,
pc NUMBER(6),
city VARCHAR(20));

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

ALTER TABLE employee
ADD(ph_no NUMBER(10));

ALTER TABLE employee
MODIFY (name VARCHAR(30));

desc employee;
