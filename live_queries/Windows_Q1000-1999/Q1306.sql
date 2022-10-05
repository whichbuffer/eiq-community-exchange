-- Comments are ignored. Copy and paste into EcelcticIQ Live Query.
-- Overview: SQL command to detect Mimikatz modules used in command lines 
-- Attribution: Jordan Durham @EclecticIQ
select cmdline from win_process_events
where cmdline like '%sekurlsa::%' or cmdline like '%kerberos::%' or cmdline like '%crypto::%' or cmdline like '%lsadump::%' or cmdline like '%vault::%' or cmdline like '%token::%'
