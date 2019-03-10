
create table tbl1(
       cust_id number(10) not null,
       cust_name varchar2(50) not null,
       
       constraint cust_pk primary key (cust_id)
);

create table tbl2(
       cust_cust_id number(10) not null,
       cust_name varchar2(50) not null,
       cust_city varchar2(50) not null,
       
       constraint cust_fk foreign key (cust_cust_id) references tbl1(cust_id)
);

drop table tbl1;
drop table tbl2;

