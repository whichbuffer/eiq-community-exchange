-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Windows Login events with the Logon type translated
-- Attribution: Jon Nelson @VMware
select
  json_extract(
    windows_eventlog.data,
    '$.EventData.TargetUserSid'
  ) as 'sid',
  json_extract(windows_eventlog.data, '$.EventData.IpAddress') as 'ip_address',
  json_extract(windows_eventlog.data, '$.EventData.IpPort') as 'ip_port',
  eventid,
  json_extract(windows_eventlog.data, '$.EventData.LogonType') as 'logon_type',
  case
    json_extract(windows_eventlog.data, '$.EventData.LogonType')
    when '2' then 'INTERACTIVE'
    when '3' then 'NETWORK'
    when '4' then 'BATCH'
    when '5' then 'SERVICE'
    when '7' then 'UNLOCK'
    when '8' then 'NETWORK_CLEAR_TEXT'
    when '9' then 'NEW_CREDENTIALS'
    when '10' then 'REMOTE_INTERACTIVE'
    when '11' then 'CACHED_INTERACTIVE'
  end 'logon_type_description',
  json_extract(windows_eventlog.data, '$.EventData.TargetUserName') as 'username',
  datetime
from
  windows_eventlog
where
  channel = 'Security'
  and eventid = '4624'
  and (
    data not like '%"LogonType":"4"%'
    and data not like '%"LogonType":"5"%'
  );