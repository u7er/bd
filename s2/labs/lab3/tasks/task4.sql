-- backend body
create or replace package body p_l3_t4_abstr is
  procedure getMinChert(rab1 in varchar2, rab2 in varchar2, rab3 in varchar2) is
  begin
    if length(rab1) < length(rab2) and length(rab1) < length(rab3) then
      dbms_output.put_line(rab1);
    elsif length(rab2) < length(rab3) then
      dbms_output.put_line(rab2);
    else
      dbms_output.put_line(rab3);
    end if;
  end;
  
  procedure getMaxChert(rab1 in varchar2, rab2 in varchar2, rab3 in varchar2) is
  begin
    if length(rab1) > length(rab2) and length(rab1) > length(rab3) then
      dbms_output.put_line(rab1);
    elsif length(rab2) > length(rab3) then
      dbms_output.put_line(rab2);
    else
      dbms_output.put_line(rab3);
    end if;
  end;
end;
-- backend spec
create or replace package p_l3_t4_abstr is
  procedure getMinChert(rab1 in varchar2, rab2 in varchar2, rab3 in varchar2);
  procedure getMaxChert(rab1 in varchar2, rab2 in varchar2, rab3 in varchar2);
end p_l3_t4_abstr;

-- frontend body
create or replace package body p_l3_t4 is
  procedure getMinRab(rab1 in varchar2, rab2 in varchar2, rab3 in varchar2) is
  begin
    p_l3_t4_abstr.getMinChert(rab1, rab2, rab3);
  end;
  
  procedure getMaxRab(rab1 in varchar2, rab2 in varchar2, rab3 in varchar2) is
  begin
    p_l3_t4_abstr.getMaxChert(rab1, rab2, rab3);
  end;
end;

-- frontend spec
create or replace package p_l3_t4 is
  procedure getMinRab(rab1 in varchar2, rab2 in varchar2, rab3 in varchar2);
  procedure getMaxRab(rab1 in varchar2, rab2 in varchar2, rab3 in varchar2);
end p_l3_t4;

-- call getMax and getMin
begin 
  p_l3_t4.getMinRab('Short', 'Middle', 'Long');
  p_l3_t4.getMaxRab('Short', 'Middle', 'Long');
end;
