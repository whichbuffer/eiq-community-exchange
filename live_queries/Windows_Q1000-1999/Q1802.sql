-- Comments are ignored. Copy and paste into EcelcticIQ Live Query.
-- Overview: Hunting for persistence technique used by Mustang Panda during European Commission-Themed Lure campaign
-- Outcome: Detection of registry key value set events on registry location used by campaign
-- Attribution: EclecticIQ Threat Research

select 
    action,
    eid,
    eventid,
    owner_uid,
    pid,
    process_guid,
    process_name,
    target_name,
    target_new_name,
    time,
    utc_time,
    value_data,
    value_type
from 
    win_registry_events
where 
    action = 'REG_SETVALUE' and target_name = 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Run\LMIGuardian Update'