
create or replace view sal_view as
  select b.sname, a.amt 
  from ord a, sal b 
  where a.snum = b.snum; 
--  group by b.sname; ?? add to a.amt func sum()

grant select on br23.sal_view to public;
grant select on br23.ord to up2;
grant select on br23.sal to up2;
grant select on br23.cust to up2; 
