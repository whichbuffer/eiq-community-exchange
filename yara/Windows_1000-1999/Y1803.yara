/*
   YARA Rule Set
   Author: EclecticIQ Researcher
   Date: 2023-01-23
*/
 
/* Rule Set ----------------------------------------------------------------- */

rule GAMAREDON_HTMLSmuggling_Attachment {
    meta:
        threat_actor = "Gamaredon APT"
        description = "Detects Gamaredon HTMLSmuggling attachment"
        Author = "EclecticIQ Researcher" 
        creation_date = "2023-01-23"
        classification = "TLP:WHITE"
    strings:
        $ = "['at'+'ob'](" ascii
        $ = "['ev'+'al'](" ascii
        $ = "document.querySelectorAll('[" ascii
        $ = "[0].innerHTML.split(' ').join('')))" ascii
    condition:
        filesize < 1MB and
        2 of them
}


rule GAMAREDON_HTMLSmuggling_stage2 {
    meta:
        threat_actor = "Gamaredon APT"
        description = "Detects Gamaredon HTMLSmuggling attachment"
        Author = "EclecticIQ Researcher" 
        creation_date = "2023-01-23"
        classification = "TLP:WHITE"
    strings:
        $ = ") == -1) die();" ascii 
        $ = "'data:application/x-rar-compressed;base64, ' +" ascii 
        $ = ".appendChild(img);" ascii 
        $ = "['Win32', 'Win64', 'Windows', 'WinCE'].indexOf(" ascii 
        $ = " = navigator[\"platform\"];" ascii 
    condition:
        4 of them and filesize < 1MB
}

rule Gamaredon_MaliciousLNK {
    meta:
        threat_actor = "Gamaredon APT"
        description = "Detects Malicous LNK File"
        Author = "EclecticIQ Researcher" 
        creation_date = "2022-01-23"
        classification = "TLP:WHITE"
    strings:
    	$mshta = "System32\\mshta.exe"
        $trait = { 0D 0A ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 0D 0A }
    condition:
        uint32be(0) == 0x4c000000 and
        #trait > 100 and $mshta and
        filesize > 100KB and filesize < 400KB
}

rule Gamaredon_LNKs_hostnames{
    meta:
        threat_actor = "Gamaredon APT"
        description = "Detects some hostname used in Gamaredon LNKs"
        Author = "EclecticIQ Researcher" 
        creation_date = "2023-01-23"
        classification = "TLP:WHITE"
    strings:
        $ = "desktop-farl139"
        $ = "desktop-a4jk6la"
    condition:
        uint32be(0) == 0x4c000000
        and any of them 
        and filesize < 10KB
}
