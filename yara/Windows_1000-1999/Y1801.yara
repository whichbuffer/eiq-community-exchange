/*
   YARA Rule Set
   Author:[CB3][CB4][MOU5]
   Date: 2022-11-29
   Identifier: Qakbot Malware
   
*/
/* Rule Set ----------------------------------------------------------------- */
rule qakbot_malware {
   meta:
      description = "Qakbot Malware - file resemblance.tmp"
      author = "EclecticIQ Threat Research Team "[PF6][AB7]
      date = "2022-11-29"
      hash1 = "8ca16991684f7384c12b6622b8d1bcd23bc27f186f499c2059770ddd3031f274"[PF8][AB9]
   strings:
      $s1 = "GDSC.exe" fullword wide
      $s2 = "fwpolicyiomgr.dll" fullword ascii
      $s3 = "6KAQAsOGxhWjAwQHbgEHbtEBQSAIC0LIAP0CB27JA4QAnAABQaH/CIMk6NOLQotZvAa8EwEcyTH+hewA4bU0118DLCi8hdYBieI4lQd8udQRAihIzukCqADbRsP2Aijc" ascii
      $s4 = "DdwL7mDuptEUhl8Onn5CsVr25Fan5Ml5U4wwgfwJjR54cbvJBWMW5nEbyPZSw+XZpjtDLlspXpGf0RdpcES6RgSsjKF5njH+/eEPJgA5AK//8I4mBqHkmQnRev+lPBmw" ascii
      $s5 = "xAdSFPwrAitJZwHe2RbviOgDOCjk3BJI/bX/P70ortmk2f43rSQoQTLYAFcOrxsDMCg9BxrZJcICfTPEAMn/AShJ/wEMtPzf6eWsv7yun/9fAo7AArThzf3k+xU86r23" ascii
      $s6 = "/BCIAcGsAAatMUPOqtSLMdor/YWwAhQR7tEL2fwBMkh4ufYC8y7N9gKLWQt8S9n2zxEHBp6D9LPUrQKLNr77MLIyFvEYr+oGT+tZnov8C56JAYXJAoMBITERDlLTFQLz" ascii
      $s7 = "/InM3BDLLf0Iz31JreLaXonZ/NA0/AQoMM+dpKkvyGIIszes3ATPKNu/p7YdAbmKjwE+ygH++a0EB3x1pu4CzQh76mE9mzwChYl/PWE9AeDOzcQtrh0B3dvGwkgCTy0Y" ascii
   condition:
      uint16(0) == 0x5a4d and filesize < 2000KB and
      1 of ($s*) and 4 of them
}

/*
   YARA Rule Set
   Author: 
   Date: 2022-11-29
   Identifier: QakBot Loader
  
*/
/* Rule Set ----------------------------------------------------------------- */
rule qakbot_loader {
   meta:
      description = "qakbot loader - file WW.js"
      author = "EclecticIQ Threat Research Team"
      date = "2022-11-29"
      hash1 = "c5df8f8328103380943d8ead5345ca9fe8a9d495634db53cf9ea3266e353a3b1"
   strings:
      $s1 = "s.shellexecute(\"regS\"+content, \"port\\\\resemblance.tmp\", \"\", \"open\", 1);" fullword ascii
      $s2 = "var content = WScript.CreateObject(\"Scripting.FileSystemObject\").OpenTextFile(\"data.txt\", 1).ReadAll();" fullword ascii
      $s3 = "var s = WScript.CreateObject(\"shell.application\");" fullword ascii
      $s4 = "// SIG // kfFY2pbnF13DvPG3LVxrrk1Daq6tsskeyXyIaMiJ3iYa" fullword ascii
      $s5 = "// SIG // 3kSPNrrfN2sRzFYsNfrFaWz8YOdU254qNZQfd9O/VjxZ" fullword ascii
      $s6 = "// SIG // bS9TZWN0aWdvUHVibGljQ29kZVNpZ25pbmdDQVIzNi5j" fullword ascii
      $s7 = "// SIG // X5X6KYFKxAXcUee9UjzpnQvBt6n8P/ofwIQ0cnqVrB1e" fullword ascii
      $s8 = "// SIG // k7RgVZSNNqfJionWlBYwDQYJKoZIhvcNAQEMBQAwezEL" fullword ascii
      $s9 = "// SIG // CWaZWFwpo7kMpjA4PNBGNjV8nLruw9X5Cnb6fgUbQMqS" fullword ascii
      $s10 = "// SIG // aWdvLmNvbS9TZWN0aWdvUHVibGljQ29kZVNpZ25pbmdS" fullword ascii
      $s11 = "// SIG // AAIBAAIBAAIBADAhMAkGBSsOAwIaBQAEFPERsxo2fxFs" fullword ascii
      $s12 = "// SIG // VR0gBEMwQTA1BgwrBgEEAbIxAQIBAwIwJTAjBggrBgEF" fullword ascii
      $s13 = "// SIG // KCFEzS2PTiVwu5efksVCCFzw8w5LXEFuqHKfnbrjOacF" fullword ascii
      $s14 = "// SIG // fbY2lBpq7YQvNHjuY8aqC7luOzFWYg4xvd2E3UORn5ol" fullword ascii
      $s15 = "// SIG // nTgkKjhQOPMedU1KZW3r8Hm40HGzKLdo0PxmK8YzFzbx" fullword ascii
      $s16 = "// SIG // NRN3BTNPYy64LeG/ZacEaxjYcfrMCPJtiZkQsa3bPizk" fullword ascii
      $s17 = "// SIG // NenVetG1fwCuqZCqxX8BnBCxFvzMbhjcb2L+plCnuHu4" fullword ascii
      $s18 = "// SIG // cQrHXD8SS1UbjifrmAmZyI2mz3fLYAwYXg2Llsp1EwV9" fullword ascii
      $s19 = "// SIG // ZWQxKzApBgNVBAMTIlNlY3RpZ28gUHVibGljIENvZGUg" fullword ascii
      $s20 = "// SIG // BggrBgEFBQcwAoY4aHR0cDovL2NydC5zZWN0aWdvLmNv" fullword ascii
   condition:
      uint16(0) == 0x2a2f and filesize < 30KB and
      1 of ($s*) and 4 of them
}

*/
/* Rule Set ----------------------------------------------------------------- */
rule QakBot_OneNote {
    meta:
    author = "EclecticIQ Researcher"
    creation_date = "2023-02-06" 
    filetype = "OneNote"
    description = "Detects QakBot Malware Delivered by OneNote" 
    classification = "TLP:WHITE"
    version = "1.0"
    md5 = "7f2c68afd0d99d634813c305dae67a1b"
   strings:
      $ = "' https://www.instructables.com/How-to-Make-a-message-box-using-VBScript/" fullword ascii
      $ = "WshShell.RegWrite \"HKCU\\SOFTWARE\\Firm\\Soft\\Name\", content, \"REG_SZ\"" fullword ascii
      $ = "Z:\\build\\one\\attachment.hta" fullword wide
      $ = "var content = document.getElementById(\"content\").innerText;" fullword ascii
      $ = "attachment.hta" fullword wide
      $ = "WshShell.RegDelete(\"HKCU\\SOFTWARE\\Firm\\Soft\\Name\")" fullword ascii
      $ = "<div id=\"content\">f30ku30kn30kc30kt30ki30ko30kn30k 30ks30kl30ke30ke30kp30k(30km30ki30kl30kl30ki30ks30k)30k{30kv30ka30kr30k 30k" ascii
      /* GUID FileDataStoreObject https://blog.didierstevens.com/ */
      $ = {E7 16 E3 BD 65 26 11 45 A4 C4 8D 4D 0B 7A 9E AC 4D 0A 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 3C 68 74 6D 6C 3E}
   	  $ = "Z:\\build\\one\\Open.hta" fullword wide
      $ = "Open.hta" fullword wide
      $ = "double click" fullword wide
      $ = /<script language="(vbscript|javascript)/ nocase wide ascii
   condition:
      ( uint16(0) == 0x52e4 and filesize < 500KB and ( 4 of them )
      ) or ( all of them )
}
