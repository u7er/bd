-- not done
create or replace package body p_l3_t4_abstr is
  chert_count number(10) := 5;
  procedure getMinChert(pchert in Chert) is
    naim number(5) := 1;
    onech varchar2(20);
  begin
    onech := pchert(1);
    
    for i in 2..5 loop
      if (length(pchert(i)) < length(onech)) then
        onech := pchert(i);
        naim := i;
      end if;
    end loop;
    dbms_output.put_line(onech || ' ' || naim);
    --return onech;
  end;
end;

create or replace package p_l3_t4_abstr is
  chert_count number(10) := 5;
  type Chert is varray(5) of varchar2(20);
  
  procedure getMinChert(pchert in Chert);
end p_l3_t4_abstr;


declare
  type Chert is varray(5) of varchar2(20);
  cherti Chert := Chert('One', 'Two', 'Three', 'Four', 'Five');  
begin 
  p_l3_t4_abstr.getMinChert(cherti);
end;
