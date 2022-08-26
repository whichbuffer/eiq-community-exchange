-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Time since last reboot from Windows, macOS, and Linux platforms
select
    seconds,
    minutes,
    hours,
    days
from
    uptime;