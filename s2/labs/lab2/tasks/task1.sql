declare
cursor get_name_comm is
       select s.sname, s.comm from sal s where s.city not like 'London' and rownum in (1,2);
begin
  for c_it in get_name_comm loop
    dbms_output.put_line('Name ''' || c_it.sname || ''' and comm ''' || c_it.comm || '''');
  end loop;            
end;
