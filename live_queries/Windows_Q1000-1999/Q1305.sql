-- Comments are ignored. Copy and paste into EcelcticIQ Live Query.
-- Overview: SQL command to detect 'base64' as a string in a powershell command
-- Outcome: Detect instances of the string 'base64' used in powershell commands
-- Attribution: Jordan Durham @EclecticIQ
select * from win_process_events
where name = "powershell.exe" and cmdline like '%base64%'
