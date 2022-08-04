-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Processes with username, size, time, and open sockets for all platforms
select  
    round( resident_size / 1048576.0) || ' MB' as priv_mem_space,
    round( wired_size / 1048576.0) || ' MB' as unpagable_mem_space,
    p.path, 
    p.cmdline, 
    pos.remote_address, 
    pos.remote_port, 
    pos.local_address, 
    pos.local_port, 
    p.system_time || ' ms' as cpu_time_kernel_space,
    p.user_time || ' ms'as cpu_time_user_space,
    u.username, 
    datetime(p.start_time, 'unixepoch') as start_time,
    p.parent as parent_pid,
    p.pid,
    p.name
from processes as p
    JOIN users u on u.uid=p.uid
    join process_open_sockets as pos on pos.pid=p.pid 
where pos.remote_port !='0' 
limit 1000;