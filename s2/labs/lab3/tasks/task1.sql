create table dep (
       department number not null,
       dep_name varchar2(50) not null,
       constraint pk_department primary key (department)
);

insert into dep (department, dep_name)
values (1, 'R and D');

insert into dep (department, dep_name)
values (2, 'Delivery');

insert into dep (department, dep_name)
values (3, 'Development');

insert into dep (department, dep_name)
values (4, 'Support');

commit;

create or replace procedure change_dep (prev_number in number, next_number in number) as
begin
  update dep 
    set department = next_number
    where department = prev_number;
end;

begin
  change_dep(5, 1);
end;

select * from dep; 
