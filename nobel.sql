drop table nobel;

CREATE TABLE nobel(
lecture_id NUMBER(3),
name VARCHAR(30) CONSTRAINT name_nn NOT NULL,
gender CHAR(1) CONSTRAINT gen check (gender in('m','f')),
category VARCHAR(3),
field VARCHAR(25),
year_award NUMBER(4),
aff_role VARCHAR(30),
dob DATE,
country VARCHAR(20),
CONSTRAINT nobel_id_pk PRIMARY KEY (lecture_id));

DESC nobel;

insert into nobel values(100,'Robert B. Laughlin','m','Phy','Condensed matter',1998,'Stanford University','01-nov-1950','USA');
insert into nobel values(101,'Horst L Stormer','m','Phy','Condensed matter',1998,'Columbia University','06-apr-1949','Germany');
insert into nobel values(102,'Daniel C. Tsui','m','Phy','Condensed matter',1998,'Princeton University','28-feb-1939','China');
insert into nobel values(103,'Walter Kohn','m','Che','Theoretical Chemistry',1998,'University of California','09-mar-1923','Austria');
insert into nobel values(104,'John Pople','m','Che','Theoretical Chemistry',1998,'North Western University','31-oct-1925','UK');
insert into nobel values(106,'John Hume','m','Pea','Negotiation',1998,'Labour party Leader','18-jan-1937','Ireland');
insert into nobel values(107,'David Trimble','m','Pea','Negotiation',1998,'Ulster Unionist party Leader','15-oct-1944','Ireland');
insert into nobel values(108,'Louis J Ignaroo','m','Med','Cardiovascular system',1998,'University of California','31-may-1941','USA');
insert into nobel values(109,'Amartya Sen','m','Eco','Welfare Economics',1998,'Trinity College','03-nov-1933','India');
insert into nobel values(110,'Jose Saramago','m','Lit','Portuguese',1998,null,'16-nov-1922','Portugal');

insert into nobel values(111,'Eric A Cornell','m','Phy','Atomic physics',2001,'University of Colorado','19-dec-1961','USA');
insert into nobel values(112,'Carl E Wieman','m','Phy','Atomic physics',2001,'University of Colorado','26-mar-1951','USA');
insert into nobel values(113,'Ryoji Noyori','m','Che','Organic Chemistry',2001,'Nagoya University','03-sep-1938','Japan');
insert into nobel values(114,'K Barry Sharpless','m','Che','Organic Chemistry',2001,'Scripps Research Institute','28-apr-1941','USA');
insert into nobel values(115,'Kofi Annan','m','Pea','World organizing',2001,'UN General','08-apr-1938','Ghana');
insert into nobel values(116,'Joerge A Akeriof','m','Eco','Economic of Information',2001,'University of California','17-jun-1940','USA');
insert into nobel values(117,'V S Naipaul','m','Lit','English',2001,null,'17-aug-1932','UK');

insert into nobel values(118,'Charles A Kao','m','Phy','Fiber technology',2009,'University of Hongkong','04-nov-1933','China');
insert into nobel values(119,'Willard S Boyle','m','Phy','Semiconductor technology',2009,'Bell Laboratories','19-aug-1924','Canada');
insert into nobel values(120,'George E Smith','m','Phy','Semiconductor technology',2009,'Bell Laboratories','10-may-1930','USA');
insert into nobel values(121,'Venkatraman Ramakrishnan','m','Che','Biochemistry',2009,'MRC Laboratory','19-aug-1952','India');
insert into nobel values(122,'Ada E Yonath','f','Che','Biochemistry',2009,'Weizmann Institute of Science','22-jun-1939','Isreal');
insert into nobel values(123,'Elizabeth H Blackburn','f','Med','Enzymes',2009,'University of California','26-nov-1948','Australia');
insert into nobel values(124,'Carol W Greider','f','Med','Enzymes',2009,'Johns Hopkins University','15-apr-1961','USA');
insert into nobel values(125,'Barack H Obama','m','Pea','World organizing',2009,'President of USA','04-aug-1961','USA');
insert into nobel values(126,'Oliver E Williamson','m','Eco','Economic governance',2009,'University of California','27-sep-1932','USA');
insert into nobel values(127,'Elinor Ostrom','m','Eco','Economic governance',2009,'Indiana University','07-aug-1933','USA');
insert into nobel values(128,'Herta Muller','f','Lit','German',2009,null,'17-aug-1953','Romania');

select name
from nobel
where dob>' 01-jul-1960';

select name,category,field,country,year_award
from nobel
where country='India' and category='Che';

select name,category,field,year_award
from nobel
where year_award between 2000 and 2005 and (category like 'Che' or category like 'Phy');

select name,year_award - EXTRACT(year from dob) as "age"
from nobel
where category='Pea';

select name,category,aff_role,country
from nobel
where (name like 'A%' or name like '%a') and country not like 'Isreal';

select name,aff_role,gender,dob as "born 1950's",country
from nobel
where EXTRACT(year from dob) between '1950' and '1960';

select name,gender,category,aff_role,country
from nobel
where (name like 'A%' or name like 'D%' or name like 'H%') and aff_role is not null
order by name;

select aff_role
from nobel
where aff_role like 'University%' or aff_role like '%University'
group by aff_role
having count(name)>=2;

select country,min(dob) as "Elder",max(dob) as "Younger"
from nobel
group by country
having count(name)>1
order by country;