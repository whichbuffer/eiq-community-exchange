-- Comments are ignored. Copy and paste into EcelcticIQ Live Query.
-- Overview: SQL command to detect potential SSH tunnels (ssh sourcing web port traffic) and pulling back username used and source host
-- Options: Adjust ports checked for as required in where statement
-- Attribution: Jordan Durham @EclecticIQ
select
    socket_events.pid,
    socket_events.path,
    socket_events.remote_address,
    socket_events.remote_port,
    processes.cmdline,
    logged_in_users.host,
    regex_match (processes.cmdline, 'sshd:\s.*?\@(.*?)$', 1) as terminalused,
    regex_match (processes.cmdline, 'sshd:\s(.*?)@', 1) as username
from
    socket_events
    inner join processes on socket_events.pid = processes.pid
    inner join logged_in_users on terminalused = logged_in_users.tty
where
    socket_events.path like '%ssh%'
    and socket_events.remote_port in ('80', '443', '8080')
