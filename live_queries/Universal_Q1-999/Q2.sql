-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Basic hardware information from Windows, macOS, and Linux platforms
SELECT
  uuid,   -- Unique system ID
  hardware_serial,   -- Device serial number
  cpu_subtype,
  cpu_brand,
  round( physical_memory / 1073741824.0) || ' GB' as physical_memory,   -- Express RAM in GB 
  hardware_model, 
  hardware_vendor, 
  hostname   -- Hostname including domain if applicable
FROM
  system_info
union
select
  (((total_seconds/60)/60)/24) as days_since_reboot, -- Time since last reboot expressed in day(s)
from
  uptime;