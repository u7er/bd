
declare
  p_snum sal.snum%type := 1008;
  p_sname sal.sname%type := 'Test';
  p_city sal.city%type := 'Gorod';
  p_comm sal.comm%type := 0.99;
begin
  execute immediate ('insert into sal values(' || p_snum || ', ''' || p_sname || ''', ''' || p_city || ''', ' || p_comm || ')');
end;

select * from sal;


