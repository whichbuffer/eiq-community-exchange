# YARA rule support overview
The EclecticIQ Endpoint Response platform provides YARA scan capabilities allowing you to scan the endpoints based on YARA rules. Although a YARA scan framework in included in the EclecticIQ Endpoint Response platform; no seeded or predefined YARA rules are available. Based on your requirements, you can manually define rules to specify characteristics for which to scan the endpoints in your environment.

## Example log4j YARA rule
```
rule log4jball {
  meta:
    author = "Tim Brown @timb_machine"
    description = "Hunts for references to Log4J balls"
    version = "1.1"
    creation_date = "2021-12-12"
    modification_date = "2021-12-15"
    classification = "TLP:WHITE"
  strings:
    $ballsrc = "PLACEHOLDER-STRING-TARBALL-MATCHES-NOT-POSSIBLE"
    $ballbin = "PLACEHOLDER-STRING-TARBALL-MATCHES-NOT-POSSIBLE"
    $balljar = "META-INF/log4j-provider.xml"
  condition:
    $ballsrc or $ballbin or $balljar
}
```

# Human Readable Ordered List (aka Index) Guidelines
Rules follow the *(Y + rule number)* format to make each rule easily referencable.

| Index Range | Topic |
| ----------- | ----- |
| 1-999 | Universal rules applicable to more than one operating system. |
| 1000 - 1999 | Windows rules only applicable to Microsoft Windows. |
| 2000 - 2999 | Linux rules generally applicable to any Linux distribution. |
| 3000 - 3999 | macOS rules only applicable to Apple macOS. |

Refer to the [yara index](yara_index.md) for desriptions of each yara rule.