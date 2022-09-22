-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Hard drive status on Windows platforms
select
  round(free_space / 1073741824.0) || ' GB' as free_space,   -- Express free space in GB 
  round(size / 1073741824.0) || ' GB' as size,   -- Express total drive size in GB
  round((free_space / (size * 1.0)) * 100) as '%_free',   -- Calculate % of free space
  file_system,   -- File system format
  case
    boot_partition
    when 1 then 'YES'
    when 0 then 'NO'
  end as boot_partition,
  device_id
from
  logical_drives;