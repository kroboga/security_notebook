## Linux Forensic Best Practices

#### Tools:


#### Handy Scripts:
** Best to have these baked on a CD **

### `startup.sh`

```bash
#! /bin/bash
read -p "Netcat host: " NCHOST
read -p "Netcat port: " NCPORT
export NCHOST=${NCHOST}
export NCPORT=${NCPORT}
export PATH=$(pwd)/bin
ash
```

### `ncrun`

```bash
#! /bin/bash
echo "##############################################################" | ./nc ${NCHOST} ${NCPORT} -w 1
echo "$(./date) - '$@' " | ./nc ${NCHOST} ${NCPORT} -w 1
"$@" | ./nc ${NCHOST} ${NCPORT} -w 1
```

#### Forensic commands (in order to run):
1. `date` - get date and time
2. `cat /etc/passwd` - get list of users
3. `crontab -l -u <user>` - for each user, lists scheduled tasks
4. `sudo atq` - lists at jobs for all users
5. `sudo netstat -tulpn` - get listening ports and processes
6. `sudo netstat -anp` - get existing connections and processes
7. `w` - get logged on users
8. `netstat -rn` - get routing table
9. `ps aux` - get all running processes and command lines
10. `service --status-all` - get status of SysV services
11. `sudo initctl list` - get status of Upstart services
12. `sudo lsof` - get list of open file handles
13. `sudo lsmod` - get list of kernel modules
14. `sudo gcore <pid>` - get memory core dump of process
