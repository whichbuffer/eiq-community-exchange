-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Active network interfaces all platforms
SELECT
    case
        last_change
        when -1 then 'n/a'
        when >= 1 then datetime(last_change, 'unixepoch') as last_change,
    case
        d.type
        when 1 then 'other'
        when 4 then 'DDN X.25'
        when 6 then 'Ethernet'
        when 24 then 'Loopback'
        when 55 then '100BaseVG (IEEE 802.12)'
        when 57 then 'HIPPI Interface'
        when 62 then 'Fast Ethernet'
        when 71 then 'wireless'
        when 117 then 'Gigabit Ethernet'
        when 209 then 'bridge'
    end as NDIS_type,
    d.mac,
    a.address,
    a.friendly_name
FROM
  interface_addresses a
  JOIN interface_details d USING (interface)
WHERE
  address not in ('127.0.0.1', '::1');