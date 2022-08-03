-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Operating System details from Windows, macOS, and Linux platforms
select
    build,   -- Build specific version
    version,   -- Full version
    major,   -- Major version
    arch,   -- Operating system architecture
    name,   -- Operating system distribution
    platform   -- Operating system platform
from
    os_version;