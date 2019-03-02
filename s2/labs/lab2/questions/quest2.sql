declare
  v1 number(5);
  v2 varchar2(50);
  v3 varchar2(50);
  v4 number(4,4);
  p_comm number(4,4);
  cursor info_saler(c_comm in number) is
    select * from sal s where s.comm < c_comm and rownum < 5;
begin
  select avg(s.comm) into p_comm
  from sal s;

  dbms_output.put_line('via cursor');
  open info_saler(p_comm);
  loop
    fetch info_saler into v1, v2, v3, v4;
    exit when info_saler%notfound;
    dbms_output.put_line(v1 || ' ' || v2 || ' ' || v3 || ' ' || v4);
  end loop;
  close info_saler;
  
  dbms_output.put_line('via loop');
  for it in (select * from sal s where s.comm < p_comm) loop
      dbms_output.put_line(it.snum || ' ' || it.sname || ' ' || it.city || ' ' || it.comm);
  end loop;

end;





