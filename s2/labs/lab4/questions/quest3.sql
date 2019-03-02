
create or replace trigger trig_on_cust
before insert on cust
declare
  max_ind number(6);
begin
  select max(cnum) + 1 into max_ind
  from cust;
  
  insert into cust (cnum, cname, city, rating, snum)
  values (max_ind, :new.cname, :new.city, :new.rating, :new.snum);
end;

select * from cust;

insert into cust (cname, city, rating, snum)
  values ('John', 'NSK', 999, 1002);
  
  
