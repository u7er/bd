grant select on br23.sal to public;
grant select on br23.ord to up1;

-- only current_user
select * from user_sys_privs;

-- self
select * from user_tab_privs;
-- vse
select * from table_privileges where owner = 'BR23';

revoke select on br23.sal from up2;
revoke select on br23.ord from up1;


