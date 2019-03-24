

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
       select distinct
          f.fid, f.fname, n.nname
       from films f, nominations n;

-- TODO: 2 paket
create or replace package paket is
       procedure act_clear_tables;
       procedure act_fill_tables;
       procedure get_films_without_nomin(c_nomin_name in varchar2);
end;

create or replace package body anyc is
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
         
       procedure smth_change(c_builder_name in varchar2) is
         type t_builder_builder_id is table of build_types.builder_builder_id%type;
         type t_build_id is table of     build_types.build_id%type;
         type t_build_type is table of   build_types.build_type%type;
         type t_builder_city is table of build_types.builder_city%type;
         p_builder_builder_id t_builder_builder_id;
         p_build_id t_build_id;
         p_build_type t_build_type;
         p_builder_city t_builder_city;
         
         cursor get_smeta(a_builder_name in varchar2) is
           select t.build_id, t.builder_builder_id, t.build_type, t.builder_city
           from build_types t
           where t.builder_builder_id in (select builder_id from builders where builder_name != a_builder_name);
           
         begin
           open get_smeta(c_builder_name);
           fetch get_smeta bulk collect into p_build_id, p_builder_builder_id, p_build_type, p_builder_city;
           close get_smeta;
           
           dbms_output.put_line('Builder name ' || ' ' || 'Build id' || ' ' || 'Build type' || ' ' || 'Builder city');           
           for it in p_build_id.first..p_build_id.last
             loop
               dbms_output.put_line(p_builder_builder_id(it) || '            ' || p_build_id(it) || '       ' || p_build_type(it) || '          ' || p_builder_city(it));
             end loop;
         exception
           when others then
             dbms_output.put_line('Unknown error in smth_change');
         end; 
end;

-- TODO: func for change data in something table
         -- and add exception
-- TODO: set priveleges for all users db





  
