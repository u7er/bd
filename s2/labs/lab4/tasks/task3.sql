create or replace trigger trig_on_sal
after insert on sal
for each row
begin
  if :new.city = 'Rome' then
    raise_application_error(-22022, 'Warning. Saller from Rome.');
  end if;
end;

insert into sal values (1009, 'Name', 'Rome', 0.13);

drop trigger trig_on_sal;
