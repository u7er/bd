declare
  p_city varchar2(50);
  cursor info_saler(c_city in varchar2) is
    select * from sal s where s.city = c_city;
begin
  p_city := '&p_city';
  for it in info_saler(p_city) loop
      dbms_output.put_line(it.snum || ' ' || it.sname || ' ' || it.city || ' ' || it.comm);
  end loop;
end;

