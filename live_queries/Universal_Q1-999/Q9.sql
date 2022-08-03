-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: List programs set to run at startup
select
    source,  -- Directory, registry, or plist contianing startup item 
    username,  -- User associated with startup item
    args,  -- Arguments provided to startup executable
    path,  -- Path location of startup item
    name  -- Name of program set to run at startup
from 
    startup_items;