-- br23
-- 1
select * from dep;
-- 2
delete from br23.dep where department = 4;
-- up1
-- 3
select * from br23.dep;
-- 4
commit;
-- 5
-- up1
select * from br23.dep;
