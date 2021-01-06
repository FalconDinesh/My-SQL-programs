set serveroutput on;
set echo on;

declare
p products.price%type;
pidp products.pid%type;
flavourp products.flavour%type;
foodp products.food%type;
pricep products.price%type;

cursor c is  
select pid,flavour,food,price
from products
where (abs(price-p))<=(select min(abs(price-p))
						from products);
begin
 	dbms_output.put_line(' productid'||        ||'flavour'||        ||'food'||        ||'price');
 	dbms_output.put_line('--------------------------------------------------------------------');
 	open c;
 	loop
 			fetch c into pidp,flavourp,foodp,pricep;
 			exit when c%notfound;
 			dbms_output.put_line(pidp||        ||flavourp||        ||foodp||       ||pricep);
 			end loop;
 			dbms_output.put_line('--------------------------------------------------------------');
 			rowcount:=c%rowcount;
 			dbms_output.put_line('products found closest to given price:'||rowcount);
 			close c;
 end;
/


















select count(unique rno)
from item_list
where item in
(
				select pid
 				from products p1
 				where price > (
 				select avg(price)
				from products p
 				group by food
 				having p.food=p1.food
));




select c.*,r.rno,r.rdate
from customers c join receipts r
on(c.cid=r.cid)
where rdate=last_day(rdate);


select  i.rno
from item_list i join products p
on(i.item=p.pid)
where p.food='Twist'
group by(i.rno);




select  i.rno,sum(p.price)
from item_list i join products p
on(i.item=p.pid)
where i.rno in(
	select  i.rno
	from item_list i join products p
	on(i.item=p.pid)
	where p.food='Twist'
	group by(i.rno)
)
group by(i.rno)
having sum(price)>25 and count(*);




select c.cid,r.rno,i.item
from item_list i join receipts r
on(i.rno=r.rno)
join customers c on(r.cid=c.cid)
where i.item in(
select item from item_list
group by (item)
having count(item)<=all
(
select count(item) from item_list
group by item));






select c.*,r.rno
from customers c join receipts r
on(c.cid=r.cid)
where r.rno in (select r.rno from receipts);



select r.rno, c.*
from customers c join receipts r on r.cid =c.cid
where r.rno in
	(select i.rno
	from item_list i join products p on p.pid = i.item
	where food= 'Meringue'
	group by i.rno
	having count(distinct item) =
	(
		select count(*) 
		from products
		where food='Meringue'
	))
;

set serveroutput on;
declare
  
  dat varchar2(20);
begin
  dat:='&date';
  update receipts
  set rno = rno
  where rdate = dat;
  dbms_output.put_line('there are '|| (SQL%rowcount) ||'receipts on this date' );
  end;	
/

