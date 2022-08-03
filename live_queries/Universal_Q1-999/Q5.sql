-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Kernel version from Windows, macOS, and Linux platforms
select
    arguments,   -- Runtime parameters passed to the kernel
    path,   -- Location of kernel on harddrive
    version   -- Kernel version
from
    kernel_info;