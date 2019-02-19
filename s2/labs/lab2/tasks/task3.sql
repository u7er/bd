
select
    snum,
    sum(decode(to_char(odate,'dd.mm.yyyy'),'03.01.2010',amt,null)) "3-e",
    sum(decode(to_char(odate,'dd.mm.yyyy'),'04.01.2010',amt,null)) "4-e",
    sum(decode(to_char(odate,'dd.mm.yyyy'),'05.01.2010',amt,null)) "5-e",
    sum(decode(to_char(odate,'dd.mm.yyyy'),'06.01.2010',amt,null)) "6-e"
from ord group by snum;

select * from ord;
   
select b.sname, SUM(a.amt) from ord a, sal b where a.snum = b.snum group by b.sname; 
