-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Operating System details from Windows, macOS, and Linux platforms
select
    arch,
    build,
    version,
    major,
    platform,
    name
from
    os_version;