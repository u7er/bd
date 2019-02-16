select
    count(decode(to_char(odate,'dd.mm.yy'),'03.01.2006',onum,null)) "3-e",
    count(decode(to_char(odate,'dd.mm.yy'),'04.01.2006',onum,null)) "4-e"
from ord;
   
select b.sname, SUM(a.amt) from ord a, sal b where a.snum = b.snum group by b.sname; 