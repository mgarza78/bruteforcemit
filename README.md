# Blocking bruteforce attacks forwarded from Office365 to DUO dag. Using IIS redirects

Attacks coming outside of the US were locking out users because authentication moved to DUO dag. Which talked to DC's on prem.
Modern Auth disabled.


### Prerequisites

On prem AD, DUO Dag, Office365 Federation, Graylog server for reading IIS and Dag logs. Dashboards containing information about attacking IPs.
task manager to run all of the scripts.

```
Rulegen takes a file dropped off from the a graylog pull script. 
A script on an approved Dag IP list to watch the DUO page and report if down
A script to revive the webserver
```



## Author

* **Mike G** *
