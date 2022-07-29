-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Basic hardware information from Windows, macOS, and Linux platforms
SELECT
  uuid,
  hardware_serial,
  hostname,
  cpu_subtype,
  cpu_brand,
  physical_memory,
  hardware_vendor,
  hardware_model
FROM
  system_info;