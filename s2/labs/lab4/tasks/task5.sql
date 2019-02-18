
CREATE TABLE sal_copy AS SELECT * from sal;
CREATE TABLE cust_copy AS SELECT * from cust;
CREATE TABLE ord_copy AS SELECT * from ord;

delete from sal_copy;
delete from ord_copy;

select * from sal_copy;

truncate table cust_copy;
