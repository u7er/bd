declare
  bad_avg exception;
  p_ord     number(10);
  p_cnum    varchar2(2000);
  p_ord_tmp number(10);
begin
  select avg(amt) into p_ord from ord;
    raise bad_avg;
exception
  when bad_avg then
    select CNAME
      into p_cnum
      from CUST
     where cnum in (select cnum
                      from ord
                     where p_ord < amt
                       and ROWNUM = 1);
    dbms_output.put_line(p_cnum);
end;
/
  select * from ord;
