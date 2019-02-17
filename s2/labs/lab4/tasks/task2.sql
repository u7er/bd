
create table trigg (
       uname varchar2(20),
       ucomm varchar2(20),
       utabl varchar2(20)
);

create table tr_tmp (
       something varchar2(2000)
);

create or replace trigger trigger_tmp
after insert or update or delete on tr_tmp
begin
  if inserting then
    insert into trigg
    values (user, 'insert', 'tr_tmp');    
  end if;  
  if updating then
    insert into trigg
    values (user, 'update', 'tr_tmp');
  end if;
  if deleting then
    insert into trigg
    values (user, 'delete', 'tr_tmp');
  end if;
end;

insert into tr_tmp values ('Something string');
update tr_tmp set something = 'Updated something string' where something = 'Something string';
delete from tr_tmp where something = 'Updated something string';
commit;

select * from trigg;
select * from tr_tmp;

drop trigger trigger_tmp;
drop table tr_tmp;
drop table trigg;
