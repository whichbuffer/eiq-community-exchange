# Packs <-> Use Cases
Packs are use cases and use cases are expressed as packs. Each pack includes a number of different queries all aligned to specific outcomes or use cases. 

Use the [pack index](pack_index.md) to locate the use case most valuable to your efforts.

# Packs overview
Packs group queries into a logical category for a specific outcome. Once defined, you can run all queries included in a pack simultaneously.

```
{
  "platform": "windows", 
  "queries": {
    "windows_programs": {
      "query" : "select * from programs;",
      "interval" : "86400",
      "platform" : "windows",
      "version" : "2.0.0",
      "description" : "Retrieves the list of products as they are installed by Windows Installer in the target Windows system.",
      "value" : "General security posture."
    },
    "windows_drivers": {
      "query" : "select * from drivers;",
      "interval" : "7200",
      "platform" : "windows",
      "version" : "2.2.0",
      "description" : "Retrieves all the information for the current windows drivers in the target Windows system."
    }
  }
}
```

## Optimization
By default, the EclecticIQ Endpoint client captures system events in real-time for a multitude of system activities and makes the telemetry available through a flexible SQL syntax.

Any system, even when idle, generates a high volume of events. Streaming these events from the endpoint to the server at regular intervals using scheduled queries, despite compressing data, can cause a burden on the network and server storage. Although a lot of the system activity is benign or irrelevant for incident reporting, it still results in a large volume of data. This is where filters come into play and help capture only relevant data and reduce noise.

EclecticIQ Endpoint includes seeded filters to reduce the volume of data you need to review to search for incidents of interest. Also, these filters reduce the burden on network and server resources.

Custom filtering allows for targeted filtering within your environment.

# Human Readable Ordered List (aka Index) Guidelines
Pack numbering follows the *(P + rule number)* format to make each pack easily referencable.

| Index Range | Topic |
| ----------- | ----- |
| 1-999 | Universal packs applicable to more than one operating system. |
| 1000 - 1999 | Windows packs only applicable to Microsoft Windows. |
| 2000 - 2999 | Linux packs generally applicable to any Linux distribution. |
| 3000 - 3999 | macOS packs only applicable to Apple macOS. |

Refer to the [pack index](pack_index.md) for desriptions of each query pack.

Each index is further broken down into specific sub-groups.
(i.e., P2174 would be list packs focused on process visibility only for Linux.)

| Index Grouping | Topic Group Description |
| -------------- | ----------------------- |
| 1 - 99 | System information |
| 100 - 199 | Process |
| 200 - 299 | Network |
| 300 - 399 | Monitoring Use cases |
| 400 - 499 | User |
| 500 - 599 | *undefined* |
| 600 - 699 | *undefined* |
| 700 - 799 | *undefined* |
| 800 - 899 | Threat hunting |
| 900 - 999 | Threat hunting *more* |