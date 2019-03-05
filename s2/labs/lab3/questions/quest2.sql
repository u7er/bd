
drop table tbl2;

create table tbl2 (
  group_group_id number(10),
  seq1 number(4),
    seq2 number(4),
      seq3 number(4),
        seq4 number(4),
          seq5 number(4)
);


create or replace package pkg is
  procedure prcd1;
end;

create or replace package body pkg is
procedure prcd1 is
  gr_id number(10);
  seq1 number(4);
    seq2 number(4);
      seq3 number(4);
        seq4 number(4);
          seq5 number(4);
begin
  for it in (select 
      group_id,
      sum(decode(seq, 'abvgdee', p_count, null)) "a",
      sum(decode(seq, 'jziklmn', p_count, null)) "b",
      sum(decode(seq, 'noprstu', p_count, null)) "c",
      sum(decode(seq, 'fhc4hh-', p_count, null)) "d",
      sum(decode(seq, '---yy', p_count, null)) "t"
  from ranges group by group_id) loop
    insert into tbl2 values (it.group_id, it."a", it."b", it."c", it."d", it."t");
  end loop;  
end;
END;

begin
  pkg.prcd1;
end;

select * from tbl2;
