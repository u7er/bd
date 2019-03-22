

drop table nominations;
drop table films;

create sequence nomin_seq start with 1 increment by 1;
create sequence films_seq start with 1 increment by 1;

create table nominations (
       nid number(3) not null,
       nname varchar2(50),
       
       constraint nid_pk primary key (nname)
);

create table films (
       fid number(3),
       fname varchar2(50),
       nname_nname varchar2(50),
       
       constraint nname_nname_fk foreign key (nname_nname) references nominations(nname),
       constraint fid_pk primary key (fid)
);



