
begin
  p_l3_t3.getSal('London');
  p_l3_t3.getCust('London');  
end;


create or replace package p_l3_t3 is
       procedure getSal(p_city in varchar2);
       procedure getCust(p_city in varchar2);
end p_l3_t3;

create or replace package body p_l3_t3 is
       cnt number;
       procedure getSal(p_city in varchar2) is
         cursor get_city_cur(c_p_city in varchar2) is
                select count(*) from sal s where s.city = c_p_city; 
       begin
         open get_city_cur(p_city);
         fetch get_city_cur into cnt;
         close get_city_cur;
         dbms_output.put_line(cnt || ' saler''s from ' || p_city);
       end;
       
       procedure getCust(p_city in varchar2) is
         cursor get_city_cur(c_p_city in varchar2) is
                select count(*) from cust c where c.city = c_p_city; 
       begin
         open get_city_cur(p_city);
         fetch get_city_cur into cnt;
         close get_city_cur;
         dbms_output.put_line(cnt || ' customer''s from ' || p_city);
       end;
end p_l3_t3;
