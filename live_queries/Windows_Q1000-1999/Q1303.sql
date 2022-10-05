-- Comments are ignored. Copy and paste into EcelcticIQ Live Query.
-- Overview: SQL query determine if high volume of suspicious characters are detected in commandline arguments, this can indicate an encoded command
-- Outcome: Detect commands with high volumes of the same suspicous characters
-- Option: Change characters as required in the select statement; ['^','+','$','%','A'] are currently used
-- Option: Increase / decrease thresholds in the where statement
-- Attribution: Jordan Durham @EclecticIQ
select
  LENGTH (cmdline) - LENGTH (REPLACE (cmdline, '^', '')) as suspicious1,
  LENGTH (cmdline) - LENGTH (REPLACE (cmdline, '+', '')) as suspicious2,
  LENGTH (cmdline) - LENGTH (REPLACE (cmdline, '$', '')) as suspicious3,
  LENGTH (cmdline) - LENGTH (REPLACE (cmdline, '%', '')) as suspicious4,
  LENGTH (cmdline) - LENGTH (REPLACE (cmdline, 'A', '')) as suspicious5,
  cmdline
from
  win_process_events
where
  suspicious1 > 10
  or suspicious2 > 10
  or suspicious3 > 10
  or suspicious4 > 10
  or suspicious5 > 10
