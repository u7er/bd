declare
  p_comm number(4,4);
  cursor info_saler(c_comm in number) is
    select * from sal s where s.comm < c_comm;
begin
  select avg(s.comm) into p_comm
  from sal s;

  dbms_output.put_line('via cursor');

  for it in info_saler(p_comm) loop
      dbms_output.put_line(it.snum || ' ' || it.sname || ' ' || it.city || ' ' || it.comm);
  end loop;
  
  
  dbms_output.put_line('via loop');
  for it in (select * from sal s where s.comm < p_comm) loop
      dbms_output.put_line(it.snum || ' ' || it.sname || ' ' || it.city || ' ' || it.comm);
  end loop;

end;




