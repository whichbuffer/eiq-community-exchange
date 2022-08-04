-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: CPU information from Windows, macOS, and Linux platforms
-- x86 systems only. Does not work on non-x86 chipset like the Apple M1
select
  value,   -- Value related to feature flag (i.e., Intel or Intel i7)
  feature   -- Feature flag (i.e., Vendor or product name)
from
  cpuid;
