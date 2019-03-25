

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
      dbms_output.put_line('Something error' || sqlerrm);
      raise;
end;

delete from films where films.fid = 2;

select * from nominations;
select * from films;

create or replace view qw_get as
       select distinct
          f.fid, f.fname, n.nname
       from films f, nominations n;

-- TODO: 2 paket
create or replace package paket is
       procedure act_clear_tables;
       procedure act_fill_tables;
       procedure get_films_without_nomin(c_nomin_name in varchar2);
       procedure delete_nomin(c_nomin_name in varchar2);
end;


-- TODO: func for change data in something table
         -- and add exception
create or replace package body paket is
       procedure act_clear_tables is
         begin
           actions.clear_tables;
         exception
           when others then
             dbms_output.put_line('Unknown error in act_clear_tables');
         end;
       
       procedure act_fill_tables is
         begin
           actions.fill_tables;
         exception
           when others then
             dbms_output.put_line('Unknown error in act_fill_tables');
         end;
         
       procedure get_films_without_nomin(c_nomin_name in varchar2) is
         type t_fid                         is table of films.fid%type;
         type t_fname                       is table of films.fname%type;
         type t_nname                       is table of nominations.nname%type;

         p_fid                              t_fid;
         p_fname                            t_fname;
         p_nname                            t_nname;
         
         --             select distinct
         --                    f.fid, f.fname, n.nname
         --             from films f, nominations n 
         --             where n.nname != 'Nomination1';
         
         cursor get_films(a_nomin_name in varchar2) is
           select
                  f.fid, f.fname, n.nname
           from films f, nominations n
           where n.nname != a_nomin_name and n.nid = f.nid_nid;
           
         begin
           open get_films(c_nomin_name);
           fetch get_films bulk collect into p_fid, p_fname, p_nname;
           close get_films;
           
           dbms_output.put_line('Film id ' || ' ' || 'Name of film' || ' ' || 'Name of nomination');           
           for it in p_fid.first..p_fid.last
             loop
               dbms_output.put_line(p_fid(it) || '       ' || p_fname(it) || '       ' || p_nname(it));
             end loop;
         exception
           when others then
             dbms_output.put_line('Unknown error in get_films_without_nomin');
         end; 

       procedure delete_nomin(c_nomin_name in varchar2) is
         begin
           delete from nominations
           where nominations.nname = c_nomin_name;
           commit;
         end;
end;

select * from nominations;

-- TODO: set priveleges for all users db
grant select on qw_get to public;
grant execute on paket to up1;

grant delete, select on films to up1;
grant delete, select on nominations to up1;

begin
  anyc.get_films_without_nomin('Nomination1');
end;




  
