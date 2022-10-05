# Event Filters Overview
By default, the EclecticIQ Endpoint client captures system events in real-time for a multitude of system activities and makes the telemetry available through a flexible SQL syntax.

Any system, even when idle, generates a high volume of events. Streaming these events from the endpoint to the server at regular intervals using scheduled filters, despite compressing data, can cause a burden on the network and server storage. Although a lot of the system activity is benign or irrelevant for incident reporting, it still results in a large volume of data. This is where filters come into play and help capture only relevant data and reduce noise.

EclecticIQ Endpoint includes seeded filters to reduce the volume of data you need to review to search for incidents of interest. Also, these filters reduce the burden on network and server resources.

Custom filtering allows for targeted filtering within your environment.

*All content should be tested in a lab environment before executing against anything in production.*

### Example Exclude Filter Type
```
  "win_process_events": {
    "cmdline": {
      "exclude" : {
        "values":[
          "C:\\Windows\\system32\\DllHost.exe /Processid*", "C:\\Windows\\system32\\SearchIndexer.exe /Embedding", "C:\\windows\\system32\\wermgr.exe -queuereporting",
          ]
          }
      }
  }
```

### Example Include Filter Type
```
"win_registry_events": {
  "target_name": {
    "include": {
      "values": [
        "*CurrentVersion\\Run*",
        "*Policies\\Explorer\\Run*",
        "*Group Policy\\Scripts*",
        "*Windows\\System\\Scripts*",
        ]
    }
  }
}
```

### Example Combined Exclude & Include Filter Type
```
"win_process_events": {
  "cmdline": {
    "exclude" : {
      "values": [
        "C:\\Windows\\system32\\DllHost.exe /Processid*",
        ]
    }
    "include": {
      "values": [
        "C:\\Windows\\system32\\SearchIndexer.exe /Embedding", "C:\\windows\\system32\\wermgr.exe -queuereporting",
        ]
    } 
  }
}
```

# Human Readable Ordered List (aka Index) Guidelines
Event Filter numbering follows the *(F + rule number)* format to make each Event Filter easily referencable.

| Index Range | Topic |
| ----------- | ----- |
| 1-999 | Universal filters applicable to more than one operating system. |
| 1000 - 1999 | Windows filters only applicable to Microsoft Windows. |
| 2000 - 2999 | Linux filters generally applicable to any Linux distribution. |
| 3000 - 3999 | macOS filters only applicable to Apple macOS. |

Refer to the [event filter index](filter_index.md) for desriptions of each Event Filter

Each index is further broken down into specific sub-groups.
(i.e., F2174 would be an event filter focused on process filtering only for Linux.)

| Index Grouping | Topic Group Description |
| -------------- | ----------------------- |
| 1 - 99 | System information |
| 100 - 199 | Process |
| 200 - 299 | Network |
| 300 - 399 | File |
| 400 - 499 | User |
| 500 - 599 | *undefined* |
| 600 - 699 | *undefined* |
| 700 - 799 | *undefined* |
| 800 - 899 | *undefined* |
| 900 - 999 | *undefined* |
