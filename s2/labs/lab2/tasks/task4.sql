create sequence brseq 
  increment by 1 
  start with -1 
  maxvalue 100 
  minvalue -1;

create table tb_seq (
       col_name varchar2(20) not null,
       col_time date null,
       col_seq number(10) not null,
       constraint uq_col_seq unique (col_seq)
);

insert into tb_seq (col_name, col_time, col_seq)
values ('Pavel', to_date('20/10/2020', 'DD/MM/YYYY'), brseq.nextval);

insert into tb_seq (col_name, col_time, col_seq)
values ('Maxim', null, brseq.nextval);

insert into tb_seq (col_name, col_time, col_seq)
values ('Alexander', null, brseq.nextval);

commit;

select * from tb_seq;

drop sequence brseq;

drop table tb_seq;
    
