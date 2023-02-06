-- Comments are ignored. Copy and paste into EcelcticIQ Live Query.
-- Overview: Hunting for persistence technique used by Mustang Panda during European Commission-Themed Lure campaign
-- Outcome: Detection of registry key value set events on registry location used by campaign
-- Attribution: EclecticIQ Threat Research

select w.action,
    w.eid,
    w.event_type,
    w.eventid,
    w.family,
    w.local_address,
    w.local_port,
    w.pid,
    w.process_guid,
    w.process_name,
    w.protocol,
    w.remote_address,
    w.remote_port,
    w.time,
    w.utc_time,
    p.process_guid, -- remove for optimisation
    p.utc_time, -- remove for optimisation
    p.cmdline -- remove for optimisation
from win_socket_events as w
inner join win_process_events as p on w.process_guid = p.process_guid -- remove for optimisation
where w.process_name like '%System32\mshta.exe%' 
    and w.remote_address like '%194.180.174.%'