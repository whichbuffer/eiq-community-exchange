-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: View users configured on all platforms
select 
    uid as user_id,   -- User ID
    gid as group_id,   -- Group ID
    shell as default_shell,   -- User's configured default shell
    description,   -- Optional description of user
    datetime(time, 'unixepoch') as last_login,   -- Time of last logging_driver
    username
from 
    users
left join
    logged_in_users
    on users.username=logged_in_users.user;