set serveroutput on;
DECLARE
	d_date receipts.rdate%type;
	no_row number;
	begin
	 d_date:='&ddmmyyyy';
	 begin
	  update receipts
	  	set cid=1
	  	where rdate=d_date;
	  no_row:=sql%ROWCOUNT;
	  if sql%FOUND then 
	   dbms_output.put_line(no_row || 'receipts');
	  elsif sql%NOTFOUND  then
	   dbms_output.put_line('No receipts sold on' || d_date);
	  end if;
	 end;
	end;
/

declare
    	 p Products.price%type;
    	 pidp Products.pid%type;
  	     flavorp Products.flavor%type;
 	  	 foodp Products.food%type;
    	 pricep Products.price%type;
    	 rowcount number;
    	 begin
    		  p:=&p;
   		  declare
   			  cursor c_price is
   			  select pid, flavor, food, price
   			  from Products
   			  where (abs(Products.price-p))<=
   				  (select min(abs(Products.price-p))
   				   from Products);
   		  begin
   			  dbms_output.put_line ('PRODUCTID'|| rpad(' ',8,' ') ||'FLAVOR'|| rpad(' ',8,' ') ||'FOOD'|| rpad(' ',8,' ') ||'PRICE');
   			  dbms_output.put_line ('------------------------------------------------------------------');
   			  open c_price;
   			  loop
   				  fetch c_price into pidp, flavorp, foodp, pricep;
  				  exit when c_price%notfound;
   				  dbms_output.put_line (pidp|| rpad('  ',11,'  ') ||flavorp|| rpad('  ',9,'  ') ||foodp|| rpad('  ',8,'  ') ||pricep);
   			  end loop;
   		      dbms_output.put_line ('------------------------------------------------------------------');
   			  rowcount:=c_price%rowcount;
   			  dbms_output.put_line ('Product(s) found EQUAL/CLOSEST to given price: '||rowcount);
   		  close c_price;
 		  end;
   	end;
   
   /