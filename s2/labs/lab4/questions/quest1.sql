create table l4q1_table(
  kto varchar2(20),
  kogda date,
  kak varchar2(50)
);

create or replace trigger l4q1_trigger
after insert on sal
declare
  p_owner varchar2(20);
  cursor cur is
         select owner
         from all_objects where object_name = 'SAL';
begin
  select owner into p_owner 
  from all_objects where object_name = 'SAL';
  if user != p_owner then
    insert into l4q1_table values (user, sysdate, 'insert');
  end if;
end;



drop table l4q1_table;
drop trigger l4q1_trigger;
