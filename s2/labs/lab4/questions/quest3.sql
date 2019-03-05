
create sequence sdf
start with 2020
increment by 1;


create or replace trigger qwerty
before insert on cust
for each row
declare
begin
  :new.cnum := sdf.nextval;
end;

select * from cust;
drop trigger qwerty;
insert into cust (cnum, cname, city, rating, snum)
  values (null, 'Petr', 'NSK', 999, 1002);
  
  
select * from cust;
