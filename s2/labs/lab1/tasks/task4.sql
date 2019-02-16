declare
  last_name varchar2(20);
begin
  select sname into last_name from sal where snum = 5000;
exception    
  when OTHERS then
    dbms_output.put_line('No data');
  
end;
