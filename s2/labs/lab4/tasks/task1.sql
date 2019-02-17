
create table trigg (
       uname varchar2(20),
       ucomm varchar2(20),
       utabl varchar2(20)
);

create table tr_tmp (
       something varchar2(2000)
);

create or replace trigger trigger_tmp
after insert on tr_tmp
for each row
  when(length(new.something) > 0)
begin
  insert into trigg
  values (user, 'insert', 'tr_tmp');
end;

insert into tr_tmp values ('Something string');
insert into tr_tmp values ('');
commit;

select * from trigg;

drop trigger trigger_tmp;
drop table tr_tmp;
drop table trigg;
