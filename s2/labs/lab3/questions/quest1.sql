create table ranges(
  rec_id number(10),
  group_id number(10),
  seq varchar2(7),
  p_count number(3)
);

create sequence seq_ranges
  minvalue 1
  start with 1
  increment by 1;

insert into ranges
values (seq_ranges.nextval, 512, 'abvgdee', 4);
insert into ranges
values (seq_ranges.nextval, 512, 'jziklmn', 3);
insert into ranges
values (seq_ranges.nextval, 512, 'noprstu', 6);
insert into ranges
values (seq_ranges.nextval, 512, 'fhc4hh-', 2);
insert into ranges
values (seq_ranges.nextval, 512, '---yy', 1);


insert into ranges
values (seq_ranges.nextval, 511, 'abvgdee', 4);
insert into ranges
values (seq_ranges.nextval, 511, 'jziklmn', 3);
insert into ranges
values (seq_ranges.nextval, 511, 'noprstu', 6);
insert into ranges
values (seq_ranges.nextval, 511, 'fhc4hh-', 2);
insert into ranges
values (seq_ranges.nextval, 511, '---yy', 1);

insert into ranges
values (seq_ranges.nextval, 513, 'abvgdee', 4);
insert into ranges
values (seq_ranges.nextval, 513, 'jziklmn', 3);
insert into ranges
values (seq_ranges.nextval, 513, 'noprstu', 6);
insert into ranges
values (seq_ranges.nextval, 513, 'fhc4hh-', 2);
insert into ranges
values (seq_ranges.nextval, 513, '---yy', 1);
commit;

select * from ranges;

drop table ranges;

