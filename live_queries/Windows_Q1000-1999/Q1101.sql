-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Dynamic Link Libraries loaded for Windows platforms
select
  utc_time,  -- 
  image_memory_mode as kernel_or_user,  -- CPU mode of DLL
  pid,  -- Process ID of calling process
  md5,  -- MD5 of image
  image_path  -- Path to DLL
from
  win_image_load_process_map;