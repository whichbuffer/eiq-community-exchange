-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: View installed certificates on all platforms
select
    serial,   -- Certificate serial number
    sha1,   -- SHA1 hash of the raw certificate contents
    path,   -- Path to Keychain or PEM bundle
    case
        self_signed
        when 1 then 'yes'
        when 0 then 'no'
        when -1 then 'no'
    end as self_signed,
    case
        ca
        when 1 then 'yes'
        when 0 then 'no'
        when -1 then 'no'
    end as certificate_authority,
    date(not_valid_after, 'unixepoch') as not_valid_after,
    username,   -- Username (only available for Windows devices)
    case
        date(not_valid_after, 'unixepoch') <= date('now')
        when 1 then 'expired'
        when 0 then 'good'
    end as cert_status,   -- Certificate expiration status
    issuer,   -- Certificate issuer
    common_name
from
    certificates;