
CREATE TABLE sal_copy AS SELECT * from sal;
CREATE TABLE cust_copy AS SELECT * from cust;
CREATE TABLE ord_copy AS SELECT * from ord;

select * from sal_copy;
select * from cust_copy;
select * from ord_copy;

delete from sal_copy;
delete from ord_copy;

truncate table cust_copy;

rollback;

select * from sal_copy;
select * from cust_copy;
select * from ord_copy;

drop table sal_copy;
drop table cust_copy;
drop table ord_copy;
