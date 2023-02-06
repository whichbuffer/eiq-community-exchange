-- Comments are ignored. Copy and paste into EcelcticIQ Live Query.
-- Overview: Hunts for references to Gamaredon APT during Ukraine & NATO security services target campaign
-- Outcome: Detection of process and remote address used in campaign
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
