/*
   YARA Rule Set
   Author: EclecticIQ Researcher
   Date: 2023-01-10
*/
 
/* Rule Set ----------------------------------------------------------------- */
 
rule PlugX_variant_Mustang_Panda_APT {
   meta:
      description = "Detecting the PlugX loader variant used by Mustang Panda APT group"
      author = "EclecticIQ Researcher”
      date = "2023-01-10"
      hash1 = "ee2c8909089f53aafc421d9853c01856b0a9015eba12aa0382e98417d28aef3f"
   strings:
      $s1 = "LMIGuardianDll.dll" fullword ascii
      $s2 = "AppPolicyGetProcessTerminationMethod" fullword ascii
      $s3 = "D$ .dllP" fullword ascii
      $s4 = "LdrGetProcedureAMultiByteToWideCGetFileAttributeGetModuleFileNam" fullword ascii
      $s5 = "Escort2" fullword ascii
      $s6 = "__swift_1" fullword ascii
      $s7 = "QQSVj8j@" fullword ascii
      $s8 = "OffLoad" fullword ascii
      $s9 = "L$ YjLXj3f" fullword ascii
      $xor_decryption_routine = {A1 00 20 01 10 03 C2 A3 00 20 01 10 30 04 29 41 3B CF 72 EC}
   condition:
      uint16(0) == 0x5a4d and filesize < 200KB and
      8 of them or $xor_decryption_routine
}

/*
   YARA Rule Set
   Author: EclecticIQ Researcher
   Date: 2023-01-10
*/
 
/* Rule Set ----------------------------------------------------------------- */
 
rule LNK_file_execute_Plugx{
   meta:
      description = "Detecting malicious shortcut file used to execute PlugX malware"
      author = “EclecticIQ Researcher”
      date = "2023-01-10"
      hash1 = "2c0273394cda1b07680913edd70d3438a098bb4468f16eebf2f50d060cdf4e96"
   strings:
      $x1 = "C:\\Windows\\System32\\cmd.exe" fullword wide
      $x2 = "%SystemRoot%\\System32\\Shell32.dll" fullword wide
      $s3 = "'..\\..\\..\\..\\..\\Windows\\System32\\cmd.exe" fullword wide
      $s4 = "%cd%1/q /c \"System Volume Information\\" fullword wide
      $s5 = "System32 (C:\\Windows)" fullword wide
      $s6 = "\\test2022.ucp\"" fullword wide
      $s7 = "desktop-4n0n9ka" fullword ascii
      $s8 = ".\\iSsRFuZJGwxgCAjNKJmqfVC.doc" fullword wide
      $s9 = "4T,(uU" fullword ascii
      $s10 = "S-1-5-21-2594409652-1619913322-1397399257-1001" fullword wide
   condition:
      uint16(0) == 0x004c and filesize < 6KB and
      4 of them
}
