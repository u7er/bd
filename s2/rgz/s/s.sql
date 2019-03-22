

drop table films;
drop table nominations;

create sequence nomin_seq start with 1 increment by 1;
create sequence films_seq start with 1 increment by 1;

create table nominations (
       nid number(3) not null,
       nname varchar2(50),
       
       constraint nid_uk unique (nid),
       constraint nname_pk primary key (nname)
);

create table films (
       fid number(3),
       fname varchar2(50),
       nid_nid number(3),
       
       constraint nid_nid_fk foreign key (nid_nid) references nominations(nid),
       constraint fid_pk primary key (fid)
);


create or replace package actions is
       procedure fill_tables;
       procedure clear_tables;
end;

create or replace package body actions is
       procedure fill_tables is
       begin
         insert into nominations values (nomin_seq.nextval, 'Nomination1');
         insert into films values (films_seq.nextval, 'Film1', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film2', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film3', nomin_seq.currval);

         insert into nominations values (nomin_seq.nextval, 'Nomination2');
         insert into films values (films_seq.nextval, 'Film1', nomin_seq.currval);
         
         insert into nominations values (nomin_seq.nextval, 'Nomination3');
         insert into films values (films_seq.nextval, 'Film1', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film2', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film3', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film4', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film5', nomin_seq.currval);
         
         insert into nominations values (nomin_seq.nextval, 'Nomination4');
         insert into films values (films_seq.nextval, 'Film1', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film2', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film3', nomin_seq.currval);
         
         insert into nominations values (nomin_seq.nextval, 'Nomination5');
         insert into films values (films_seq.nextval, 'Film1', nomin_seq.currval);
         
         insert into nominations values (nomin_seq.nextval, 'Nomination6');
         insert into films values (films_seq.nextval, 'Film1', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film2', nomin_seq.currval);
         
         insert into nominations values (nomin_seq.nextval, 'Nomination7');
         insert into films values (films_seq.nextval, 'Film1', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film2', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film3', nomin_seq.currval);
         
         insert into nominations values (nomin_seq.nextval, 'Nomination8');
         insert into films values (films_seq.nextval, 'Film1', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film2', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film3', nomin_seq.currval);
         insert into films values (films_seq.nextval, 'Film4', nomin_seq.currval);
         commit;
       end;
       
       procedure clear_tables is
       begin
         delete from films;
         delete from nominations;
         commit;
       end;
end;

begin
  actions.fill_tables;
end;

begin
  actions.clear_tables;
end;

select * from nominations;
select * from films;

create or replace trigger tr
before delete on films
declare
  no_work_time exception;
begin
  if to_char(sysdate, 'hh24/mi/ss') > to_char('20/00/00', 'hh24/mi/ss') or to_char(sysdate, 'hh24/mi/ss') < to_char('12/00/00', 'hh24/mi/ss') then
    raise no_work_time;
  end if;
exception
  when no_work_time then
    dbms_output.put_line('NO WORK TIME');
    raise;
    when others then
      dbms_output.put_line('Something error');
      raise;
end;



select * from nominations;
select * from films;

create or replace view qw_get as
       select
       decode()
       from films f, nominations n

select distinct
       f.fname,
       decode(n.nname, 'Nomination1', 'X', null) "Nomin1",
       decode(n.nname, 'Nomination2', 'X', null) "Nomin2",
       decode(n.nname, 'Nomination3', 'X', null) "Nomin3",
       decode(n.nname, 'Nomination4', 'X', null) "Nomin4",
       decode(n.nname, 'Nomination4', 'X', null) "Nomin5",
       decode(n.nname, 'Nomination4', 'X', null) "Nomin6",
       decode(n.nname, 'Nomination4', 'X', null) "Nomin7",
       decode(n.nname, 'Nomination4', 'X', null) "Nomin8"
from films f, nominations n;

select * from ranges;






  
