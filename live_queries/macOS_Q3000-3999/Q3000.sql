-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: Drive root mount information from macOS endpoints.
select 
    type,
    round((blocks_available * 1.0 / blocks * 1.0) * 100) AS percent_free,
    round(blocks_available * blocks_size * 10e-10) as gigs_free,
    round(blocks * blocks_size * 10e-10) as mount_size,
    path
from 
    mounts 
where 
    path='/';