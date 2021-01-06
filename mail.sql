drop table order_details;
drop table orders;
drop table parts;
drop table customer;
drop table employee;
drop table pincod;



create table pincod(
pc number(6) constraint pin_pk primary key,
city varchar2(20));

desc pincod;
create table employee(
emp_no varchar2(7) constraint emp_pk primary key,
emp_name varchar2(20),
dob date,
pc number(6) constraint pinc_pk references pincod(pc),
constraint emp_c check(emp_no like 'e%'));

desc employee;

create table customer(
cust_no varchar2(7) constraint cust_pk primary key,
cust_name varchar2(20),
dob date,
ph_no number(10) constraint ph_no_check unique,
pc number(6) constraint p_fk references pincod(pc),
constraint cust_rk check(cust_no like 'c%'));

desc customer;

create table parts(
part_no varchar2(7) constraint part_pk primary key,
part_name varchar2(20),
price number(5),
quantity number(5),
constraint part_c check(part_no like 'p%'),
pc number(6) constraint pc_p references pincod(pc));

desc parts;

create table orders(
order_no varchar2(7) constraint ord_pk primary key,
order_name varchar2(20),
rec_date date,
ship_date date,
constraint shp_ds check(rec_date<ship_date),
constraint ord_no check(order_name like 'o%'),
cust_no varchar2(20) constraint cust_no_fk references customer(cust_no),
emp_no varchar2(20) constraint emp_no_fk references employee(emp_no));

desc orders;

create table order_details(
order_no varchar2(20),
part_no varchar2(20),
quantity number(10),
constraint order_no_fk foreign key(order_no) references orders(order_no),
constraint part_no_fk foreign key(part_no) references parts(part_no),
constraint order_no_pk primary key(order_no,part_no));

desc order_details;


insert into pincod values
	(623443,'chennai');

insert into pincod values
	(623022,'salem');

select * from pincod;

insert into employee values
	('e41219','harish','25-jun-2000',623443);
insert into employee values
	('e63596','rajesh','03-sep-2000',623022);

select * from employee;

insert into customer values
	('c6321','rajesh','03-sep-2000',123654892,623022);
insert into customer values
	('c4561','harish','25-jun-2000',213654893,623443);
select * from customer;

select * from customer;

alter table parts
add(reorder_lvl number(10));
desc parts;

alter table employee
add(hire_date date);
desc employee;

alter table customer
modify (cust_name varchar2(30));
desc customer;

alter table customer
drop column dob;
desc customer;

alter table orders
modify rec_date constraint
rec_date_c not null;
desc orders;

alter table order_details
drop constraint part_no_fk;

alter table order_details
drop constraint order_no_fk;

alter table order_details
add constraint part_no_fk foreign key(part_no) references parts(part_no) on delete cascade;
alter table order_details
add constraint order_no_fk foreign key(order_no) references orders(order_no) on delete cascade;


