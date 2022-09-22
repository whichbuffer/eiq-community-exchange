-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Firewall status on Windows platforms
SELECT
  CASE
    DATA
    WHEN 0 THEN 'TRUE'
    WHEN 1 THEN 'FALSE'
  END 'Firewall Disabled',
  DATETIME(mtime, 'unixepoch', 'localtime') AS 'Last Modified'   -- Calculate last change to firewall
FROM
  registry
WHERE
  KEY = 'HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile'
  AND name = 'EnableFirewall';