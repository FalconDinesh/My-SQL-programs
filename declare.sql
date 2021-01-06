DECLARE
      id products.pid%type;
      flavr products.flavor%type;
      ftype products.food%type;
      CURSOR c1 is select food from products where (food=ftype);
      CURSOR c2 is select food from products where (flavor=flavr);
      CURSOR c3 is select food,flavor from products where (flavor=flavr and food=ftype);
      BEGIN
            ftype:='&foodtype';
            flavr:='&flavor';
            open c3;
            fetch c3 into flavr,ftype;
            if c3%found then
                DBMS_OUTPUT.PUT_LINE('food and flavor combination is found');
            else
                open c1;
                 DBMS_OUTPUT.PUT_LINE('food and flavor combination is 
                 not found');
                 fetch c1 into ftype;
                 if c1%found then
                   DBMS_OUTPUT.PUT_LINE('food is found seperately');
                 else
                    DBMS_OUTPUT.PUT_LINE('food is not found');
                 end if;
                 close c1;
                 open c2;
                 fetch c2 into flavr;
                 if c2%found then
                     DBMS_OUTPUT.PUT_LINE('flavr is found seperately');
                 else
                     DBMS_OUTPUT.PUT_LINE('flavr is not found');
                 end if;
                 close c2;
                 end if;
                 close c3;
            END;
            /         