# Query Overview

A query is a request for endpoint data from a database table or combination of tables.

The EclecticIQ endpoint client is based on osquery that exposes the operating system as a high-performance relational database that can be queried. Using SQL queries, you can extract and review operating system data, such as running processes, loaded kernel modules, open network connections, browser plugins, hardware events, and file hashes. The EclecticIQ endpoint client extends existing osquery features by adding real-time event collection.


## Query structure
All queries you define or use in the EclecticIQ Endpoint Response framework are defined using JSON syntax.
Query type Format

*All content should be tested in a lab environment before executing against anything in production.*

### Schedule Query type
Custom queries fetch specific data from the nodes. Queries can be configured to run at set intervals and the data is brought back to the EclecticIQ endpoint server.
```
{
  "table name": {                    
    "query": "select * from table  where column='value';",
    "interval": "number of seconds",  
    "platform": "operating system",    
    "version": "x.x.x",          
    "description": "describes the query",
    "value": "Process Events",
    "removed": false,
    }
}
```
### Schedule Query type example
```
{
  "win_process_events": {
    "query": "select * from win_process_events  where action='PROC_CREATE';",
    "interval": 30, 
    "platform": "windows", 
    "version": "2.9.0",
    "description": "Windows Process Events",
    "value": "Process Events", 
    "removed": false,
    }
}
```
### Live Query type
Live queries run on-demand and provides current snapshot of the endpoints. Live query results are only displayed on the UI after execution and are not stored in the database. 
```
select * from table  where column='value';"
```
### Live Query type example
```
select * from win_process_events where action='PROC_CREATE';
```
## Optimization
By default, the EclecticIQ Endpoint client captures system events in real-time for a multitude of system activities and makes the telemetry available through a flexible SQL syntax.

Any system, even when idle, generates a high volume of events. Streaming these events from the endpoint to the server at regular intervals using scheduled queries, despite compressing data, can cause a burden on the network and server storage. Although a lot of the system activity is benign or irrelevant for incident reporting, it still results in a large volume of data. This is where filters come into play and help capture only relevant data and reduce noise.

EclecticIQ Endpoint includes seeded filters to reduce the volume of data you need to review to search for incidents of interest. Also, these filters reduce the burden on network and server resources.

Custom filtering allows for targeted filtering within your environment.

# Human Readable Ordered List (aka Index) Guidelines
Query numbering follows the *(Q + rule number)* format to make each Live Query easily referencable.

| Index Range | Topic |
| ----------- | ----- |
| 1-9999 | Universal queries applicable to more than one operating system. |
| 1000 - 1999 | Windows queries only applicable to Microsoft Windows. |
| 2000 - 2999 | Linux queries generally applicable to any Linux distribution. |
| 3000 - 3999 | macOS queries only applicable to Apple macOS. |

Refer to the [query index](query_index.md) for desriptions of each Live Query.