-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Hunts for references to Mustang Panda European Commission-Themed Lure based on filename
-- Outcome: Joins file events to process events in aim to provide more context
-- Attribution: ElecticIQ Threat Research
select
    f.action as file_action,
    f.eid as file_eid,
    f.eventid as file_eventid,
    f.hashed as file_hashed,
    f.md5 as file_md5,
    f.pe_file as file_pe,
    f.pid,
    f.process_guid,
    f.process_name as file_process_name,
    f.sha256 as file_sha256,
    f.target_path as file_target_path,
    f.time as file_time,
    f.uid as file_uid,
    f.utc_time as file_utc_time,
    p.action as process_action,
    p.cmdline as process_commandline,
    p.eid as process_eid,
    p.eventid as process_eventid,
    p.owner_uid as process_owner_uid,
    p.parent_path as process_parent_path,
    p.parent_pid as process_parent_pid,
    p.process_guid,
    p.path as process_path,
    p.time as process_time,
    p.utc_time as process_utc_time
from
    win_file_events as f
    join win_process_events as p on p.process_guid = f.process_guid
where
    f.target_path like '%draft letter to European Commission RUSSIAN OIL PRICE CAP sg de%'
