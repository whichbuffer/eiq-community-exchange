-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Hard drive status on Windows platforms
select
  round(free_space / 1073741824.0) | | ' GB' as free_space,
  round(size / 1073741824.0) | | ' GB' as size,
  round((free_space / (size * 1.0)) * 100) as '%_free',
  file_system,
  device_id,
  boot_partition,
  case
    when 1 then 'YES'
    when 0 then 'NO'
  end as boot_partition
from
  logical_drives;