declare
  n_date date;
begin
  select max(odate) into n_date from ord;
  dbms_output.put_line(n_date);
end;
