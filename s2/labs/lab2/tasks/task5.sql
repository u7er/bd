
create sequence brseq 
      increment by 2 
      start with 5000;

create table tb_tmp (snum_snum number(4) not null,
        sname varchar2(50) not null,
        amt number(7, 2) not null,
        seq number(6) not null,
        constraint fk_snum foreign key(snum_snum) references
        sal(snum),
        constraint pk_seq primary key (seq));

declare
  c_s_sname varchar2(50);
  c_s_snum  number(4);
  c_o_amt   number(7, 2);

  cursor set_new_table is
    select s.sname, s.snum, SUM(o.amt)
      from ord o, sal s
     where o.snum = s.snum
     group by s.sname, s.snum
     order by s.sname;
     
begin  
  open set_new_table;
  loop 
      fetch set_new_table into c_s_sname, c_s_snum, c_o_amt;
      insert into tb_tmp (snum_snum, sname, amt, seq)
          values (c_s_snum, c_s_sname, c_o_amt, brseq.nextval);
          dbms_output.put_line(c_s_snum || ' ' || c_s_sname || ' ' || c_o_amt || ' ' || brseq.currval);
      if set_new_table%NOTFOUND then
          exit;
          end if;
  end loop;
 close set_new_table;
end;



drop sequence brseq;
drop table tb_tmp;

-- select * from tb_tmp;
