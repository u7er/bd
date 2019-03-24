
drop table company;
drop table os;


create sequence oid_seq start with 1 increment by 1;
create sequence cid_seq start with 1 increment by 1;

create table os (
       oid number(3) not null,
       oname varchar2(50),
       oyear varchar2(4),
       
       constraint oid_uk unique (oid),
       constraint oname_pk primary key (oname)
);

create table company (
       cid number(3),
       cname varchar2(50) not null,
       oid_oid number(3),
       
       constraint cid_pk primary key (cid),
       constraint oid_oid_fk foreign key (oid_oid) references os(oid)
);

create or replace package supp is
       procedure fill_tables;
       procedure clear_tables;
end;

create or replace package body supp is
       procedure fill_tables is
         begin
           insert into os values (oid_seq.nextval, 'Windows 95', '1995');
           insert into company values (cid_seq.nextval, 'Company1', oid_seq.currval);
           insert into company values (cid_seq.nextval, 'Company2', oid_seq.currval);
           insert into company values (cid_seq.nextval, 'Company3', oid_seq.currval);
           
           insert into os values (oid_seq.nextval, 'Windows 98', '1998');
           insert into company values (cid_seq.nextval, 'Company1', oid_seq.currval);
           insert into company values (cid_seq.nextval, 'Company2', oid_seq.currval);
           insert into company values (cid_seq.nextval, 'Company3', oid_seq.currval);
           
           insert into os values (oid_seq.nextval, 'Windows 2000', '2000');
           insert into company values (cid_seq.nextval, 'Company1', oid_seq.currval);
           
           insert into os values (oid_seq.nextval, 'Windows NT', '2001');
           insert into company values (cid_seq.nextval, 'Company1', oid_seq.currval);
           insert into company values (cid_seq.nextval, 'Company2', oid_seq.currval);
           insert into company values (cid_seq.nextval, 'Company3', oid_seq.currval);
           
           insert into os values (oid_seq.nextval, 'Windows XP', '2002');
           insert into company values (cid_seq.nextval, 'Company17', oid_seq.currval);
           
           insert into os values (oid_seq.nextval, 'Windows Vista', '2004');
           insert into company values (cid_seq.nextval, 'Company12', oid_seq.currval);
           
           insert into os values (oid_seq.nextval, 'Windows 7', '2007');
           insert into company values (cid_seq.nextval, 'Company1', oid_seq.currval);

           insert into os values (oid_seq.nextval, 'Windows 8', '2008');
           insert into company values (cid_seq.nextval, 'Company55', oid_seq.currval);
           
           insert into os values (oid_seq.nextval, 'Windows 10', '2010');
           insert into company values (cid_seq.nextval, 'Company66', oid_seq.currval);
           
           commit;
         end;

       procedure clear_tables is
         begin
           delete from company;
           delete from os;
           commit;
         end;
end;


begin
  supp.fill_tables;
end;

begin
  supp.clear_tables;
end;

select * from os;
select * from company;

-- trigger
create or replace trigger tr_xam
before update on os
declare
  p_owner varchar2(20) := 'empty';
  no_accept exception;
begin
  select owner into p_owner
  from all_objects
  where object_name = 'OS' and owner = user; 
  if p_owner = 'empty' then
    raise no_accept;
  end if;
exception
  when no_accept then
    dbms_output.put_line('You are not a owner');
    raise;
    when others then
      dbms_output.put_line('You are has not table OS');
      raise;
end;

-- view
create or replace view qw_company as
       select o.oname, c.cname
       from os o, company c
       where o.oid = c.oid_oid
       order by o.oname;

select * from qw_company;

-- two package
create or replace package puss is
       procedure fill;
       procedure clean;
       procedure single_rec;
end;

create or replace package body puss is
       procedure fill is
         begin
           supp.fill_tables;
         end;
       
       procedure clean is
         begin
           supp.clear_tables;
         end;

       procedure single_rec is     
         begin
           -- TODO: varray
         end;
end;

-- set priveleges for all users db
grant select on qw_company to public;
grant execute on supp to up1;

grant delete, select on os to up1;
grant delete, select on company to up1;






