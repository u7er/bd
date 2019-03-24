
drop table os;
drop table company;

create table os (
       oid number(3) not null,
       oname varchar2(50),
       oyear varchar2(4),
       
       constraint oid_uk unique (oid),
       constraint oname_pk primary key (oname)
);

create table company (
       cid number(3),
       cname varchar2(50),
       oid_oid number(3),
       
       constraint cid_uk unique (cid),
       constraint cname_pk primary key (cname),
       constraint oid_oid_fk foreign key (oid_oid) references os(oid)
);
