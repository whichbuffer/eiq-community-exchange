-- Comments are ignored. Copy and paste into EcelcticIQ Live Query. 
-- Outcome: CPU information from Windows, macOS, and Linux platforms
select
  feature,
  value,
  output_register,
  output_bit,
  input_eax
from
  cpuid;