-- Comments are ignored. Copy and paste into EcelcticIQ Live Query.
-- Overview: SQL query to decode powershell encoded commands (base64)
-- Outcome: Detect Powershell commands ran with -encodedcommand flag and decode the command passed 
-- Attribution: Jordan Durham @EclecticIQ
select cmdline,
regex_match(cmdline,'-e\w*\s(.*?)$', 1) as encoded_command,
from_base64(regex_match(cmdline,'-e\w*\s(.*?)$', 1)) as decoded_command
from win_process_events
where path like '%powershell%' and encoded_command is not null
