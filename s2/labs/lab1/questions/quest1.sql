declare
  p_cnum number(10) := 2008;
  t_cnum number(10);
begin
  loop
    select cnum into t_cnum from cust where cnum = p_cnum;
     p_cnum := p_cnum + 1;
  end loop;
exception
  when others then
    dbms_output.put_line(p_cnum);
end;
/
select cnum from cust;
