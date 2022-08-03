-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: MAC Address table from ARP and NDP
select
    address,   -- IPv4 target address
    interface,   -- Interface of the network for the MAC
    mac,   -- MAC address of broadcasted address
    case
        permanent  -- Static or dynamic address
        when 1 then 'Static'
        when 0 then 'Dynamic'
    end as mac_table_entry
from
    arp_cache;