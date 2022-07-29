-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: BIOS details from Windows, macOS, and Linux platforms
select
    extra,
    version,
    date,
    revision,
    vendor
from
    platform_info;