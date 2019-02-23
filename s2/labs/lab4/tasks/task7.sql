create role lab4;

grant update on br23.dep to lab4;
grant select on br23.dep to lab4;

grant lab4 to up1, up2;

select * from br23.dep;
select * from table_privileges where owner = 'BR23';
revoke update on br23.dep from lab4;

update br23.dep set department = 1 where department = 5;


