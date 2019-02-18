grant update on br23.dep to lab4v;
grant select on br23.dep to lab4v;

grant lab4v to up1, up2;

select * from br23.dep;
select * from user_tab_privs;

update br23.dep set department = 1 where department = 5;


