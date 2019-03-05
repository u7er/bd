create table l4q1_table(
  kto varchar2(20),
  kogda date,
  kak varchar2(50)
);

create or replace trigger l4q1_trigger
after insert on sal
declare
  p_owner varchar2(20);
begin
  
  for it in (select owner from all_objects where object_name = 'SAL') loop
    if it.owner != user then
        insert into l4q1_table values (user, sysdate, 'insert');
    end if;
  end loop;
end;

insert into sal values (1109, 'Tedasd', 'NSK', 1.23);

grant insert on sal to up1;
select * from sal;
-- 2 u & 2 t
select * from l4q1_table;

select * from all_objects where object_name = 'SAL';



select * from up1.sal;

drop table l4q1_table;
drop trigger l4q1_trigger;
