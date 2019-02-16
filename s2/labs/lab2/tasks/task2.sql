declare
 c_date date := to_date('1/4/2010', 'MM/DD/YYYY');
 cursor get_orders(o_date date) is
       select * from ord where odate > o_date;
begin
   for c_it in get_orders(c_date) loop
    dbms_output.put_line('N order''s ''' || c_it.onum || ''' date ''' || c_it.odate || '''');
  end loop;
end;
