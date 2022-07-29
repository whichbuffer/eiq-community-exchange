-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Kernel version from Windows, macOS, and Linux platforms
select
    version,
    device
from
    kernel_info;