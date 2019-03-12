-- part 1

drop table build_types;
drop table builders;
drop sequence bldr_seq;
drop sequence tps_seq;
drop view qw_builder;

create sequence bldr_seq start with 1 increment by 1;
create sequence tps_seq start with 1 increment by 1;

create table builders (
       builder_id number(10) not null,
       builder_name varchar2(50) not null,
       
       constraint builder_pk primary key (builder_id)
);

create table build_types (
       build_id number(10),
       builder_builder_id number(10) not null,
       build_type varchar2(50) not null,
       builder_city varchar2(50) null,
       
       constraint builder_id_fk foreign key (builder_builder_id) references builders(builder_id),
       constraint build_id_pk primary key (build_id)
);

create or replace package actions is
       procedure fill_tables;
       procedure clear_tables;
end;

create or replace package body actions is
       procedure fill_tables is
       begin
         insert into builders values (bldr_seq.nextval, 'Builder1');
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type1', null);
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type2', null);
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type3', null);
         
         insert into builders values (bldr_seq.nextval, 'Builder2');
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type1', null);

         insert into builders values (bldr_seq.nextval, 'Builder3');
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type1', null);
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type2', null);
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type3', null);
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type4', null);
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type5', null);

         insert into builders values (bldr_seq.nextval, 'Builder4');
        insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type1', null);
        insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type2', null);
        insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type3', null);

         insert into builders values (bldr_seq.nextval, 'Builder5');
        insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type1', null);
         
         insert into builders values (bldr_seq.nextval, 'Builder6');
        insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type1', null);
        insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type2', null);

         insert into builders values (bldr_seq.nextval, 'Builder7');
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type1', null);
        insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type2', null);
        insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type3', null);
         insert into builders values (bldr_seq.nextval, 'Builder8');
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type1', null);
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type2', null);
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type3', null);
         insert into build_types values (tps_seq.nextval, bldr_seq.currval, 'Type4', null);


         commit;
       end;
       
       procedure clear_tables is
       begin
         delete from build_types;
         delete from builders;
         commit;
       end;
end;

begin
  actions.fill_tables;
end;

begin
  actions.clear_tables;
end;

select * from builders;
select * from build_types;

-- trigger
delete from br23.build_types where build_id = 33;

create or replace trigger tr_del_from_build_types
before delete on build_types
declare
  p_owner varchar2(20) := 'empty';
  no_accept exception;
begin
  select owner into p_owner
  from all_objects
  where object_name = 'BUILD_TYPES' and owner = user; 
  if p_owner = 'empty' then
    raise no_accept;
  end if;
exception
  when no_accept then
    dbms_output.put_line('You are not a owner');
    raise;
    when others then
      dbms_output.put_line('You are has not table BUILD_TYPES');
      raise;
end;

create or replace view qw_builder as
       select distinct builder_name, build_id, build_type, builder_city
       from builders b, build_types t
       where b.builder_id != 10;

select * from qw_builder;

-- two's package

create or replace package anyc is
       procedure act_clear_tables;
       procedure act_fill_tables;
       procedure smth_change(c_builder_name in varchar2);
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

grant select on qw_builder to public;
grant execute on anyc to up1;

grant delete, select on builders to up1;
grant delete, select on build_types to up1;

begin
  anyc.smth_change('Builder1');
end;
