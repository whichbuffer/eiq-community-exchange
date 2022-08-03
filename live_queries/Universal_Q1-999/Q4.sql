-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: BIOS details from Windows, macOS, and Linux platforms
select
    extra,   -- Platform specific information
    round(size / 1024.0) || ' KB' as bios_size,   -- Express BIOS size in KB 
    version,   -- BIOS version
    date,   -- Last update to BIOS
    revision,   -- BIOS major and minor version
    vendor   -- BIOS vendor
from
    platform_info;