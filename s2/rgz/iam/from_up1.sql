select * from br23.qw_builder;
select * from br23.builders;

delete from br23.build_types where build_id = 33;


begin
  br23.anyc.smth_change('Builder2');
end;


 select owner
  from all_objects
  where object_name = 'BUILD_TYPES' and owner = user;
  
