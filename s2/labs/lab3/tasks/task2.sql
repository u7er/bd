
begin
  dbms_output.put_line(f_task2(15.62));
  dbms_output.put_line(f_task2(5));
  dbms_output.put_line(f_task2(0));
  dbms_output.put_line(f_task2(.93));
end;

-- function
create or replace function f_task2(f_amt in number) return varchar2 is
  p_int_last  varchar2(1);
  p_frac_last varchar2(1);
  p_int       varchar2(16);
  p_frac      varchar2(16);
  p_res       varchar2(50);
begin
  p_res       := '';
  p_int       := to_char(floor(f_amt));
  p_frac      := ltrim(regexp_substr(to_char(f_amt), '(\W\d*)'), '.');
  p_int_last  := substr(p_int, -1, 1);
  p_frac_last := substr(p_frac, -1, 1);
  -- if only integer
  if (ceil(f_amt) = f_amt) then
     p_frac := '00';
  end if;
  -- if only fractional - auto fix
  p_res := p_res || p_int || ' ';
  if (p_int_last = '1') then
    p_res := p_res || 'rubl ';
  elsif (p_int_last = '2' or p_int_last = '3' or p_int_last = '4') then
    p_res := p_res || 'rublya ';
  else
    p_res := p_res || 'rubley ';
  end if;
  p_res := p_res || p_frac || ' ';
  if (p_frac_last = '1') then
    p_res := p_res || 'kopeyka ';
  elsif (p_frac_last = '2' or p_frac_last = '3' or p_frac_last = '4') then
    p_res := p_res || 'kopeyki ';
  else
    p_res := p_res || 'kopeek ';
  end if;
  return p_res;
end;
