-- Comments are ignored. Copy and paste into EcelcticIQ Live Query.
-- Overview: SQL command to monitor for suspicious powershell cmdlets
-- Outcome: Detect suspicious cmdlets ran in powershell
-- Option: Add, change, remove cmdline like options as required 
-- Attribution: Jordan Durham @EclecticIQ
select *
from win_process_events
where name = 'powershell.exe' and (cmdline like '%-nop%' or cmdline like '%-noni%' or cmdline like '%invoke-expression%' or cmdline like '%iex%' or cmdline like '%.downloadstring%' or cmdline like '%downloadfile%')
