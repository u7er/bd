declare
  a_value number(3);
  a_index varchar2(50);
  type xx_city_type is table of number index by varchar2(50);
  our_cities xx_city_type;
  cursor sal_count is
    select distinct count(*), city from sal group by city;
begin
  open sal_count;
  loop
    fetch sal_count into a_value, a_index;
    our_cities(a_index) := a_value;
    exit when sal_count%notfound;
  end loop;
  
  dbms_output.put_line(our_cities('Barcelona'));
  
  close sal_count;
end;
