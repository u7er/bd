declare
  bad_rating exception;
  p_rating varchar2(20);
begin
  select rating into p_rating from cust where cnum = 2001;

  if p_rating < 200 then
    raise bad_rating;
  end if;

exception
  when bad_rating then
    dbms_output.put_line('Рейтинг покупателя меньше 200');
  when others then
    dbms_output.put_line('Неопределенная ошибка');
  
end;
