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
create or replace trigger tr_del_from_builders
after delete on builders 
declare
  p_owner varchar2(20);
begin
  select owner into p_owner
  from all_objects
  where object_name = 'BUILDERS' and owner = user; 
  if p_owner != user then
    raise no_accept;
  end if;
exception
  when no_accept then
    dmbs_output.put_line('You are not a owner');
    when others then
      dmbs_output.put_line('You are has not table BUILDERS');
end;

create or replace view qw_builder as
       select * from builders b, build_types t
       where b.builder_id = t.builder_builder_id;
       
select count(*) from qw_builder;
