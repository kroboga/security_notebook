## Windows Forensic Best Practices

#### Tools:
* Sysinternals Suite 
	* XP - https://web.archive.org/web/20140625160755if_/http://download.sysinternals.com/files/SysinternalsSuite.zip
	* Vista and later - https://download.sysinternals.com/files/SysinternalsSuite.zip
* Netcat - https://eternallybored.org/misc/netcat/netcat-win32-1.12.zip


#### Handy scripts:
**Best to have these baked on a CD**

### `startup.cmd`

```batch
@echo off
set PATH=%~dp0\bin;%PATH%
echo.
echo "Run 'set NCHOST=192.168.1.1' and 'set NCPORT=12345'"
echo "After setting those, you can run 'ncrun <command>' to send the output across netcat"
echo.
```
Run this from a command prompt to setup your environment

### `ncrun.cmd`

```batch
@echo off
echo ##############################################################  | %~dp0\nc.exe %NCHOST% %NCPORT% -w 1
echo %DATE% %TIME% - %* | %~dp0\nc.exe %NCHOST% %NCPORT% -w 1
%* | %~dp0\nc.exe %NCHOST% %NCPORT% -w 1
```
After running `startup.cmd` and setting the environment variables `NCHOST` and `NCPORT`, you can run any command with `ncrun` in front of it, and the timestamp, command and all output will be sent over the netcat tunnel. Ex: `ncrun ipconfig /all`


#### Forensic commands (in order to run)
1. `date /t` - Get current date
2. `time /t` - Get current time
3. `at` - Get scheduled tasks
4. `schtasks /query` - Get other scheduled tasks
5. `netstat -a -b -n` - Get current connections, as well as listening processes
6. `tasklist /v` - Get running processes
7. `tasklist /svc` - Get service to process mapping
8. `pslist -t` - Gets process tree (From Sysinternals Suite, note: **adds registry key**)
9. `handle -a` - Gets all open file handles (From Sysinternals Suite, note: **adds registry key**)
10. `psloggedon` - Gets all logged on users (From Sysinternals Suite, note: **adds registry key**)
11. `ipconfig /all` - Gets MAC and IP addresses, DHCP, DNS servers
12. `route print` - Gets routing table
13. `net start` - Shows running services
14. `ver` - Gets windows version
15. `netstat -an` - Gets current connections, easier to read than previous
16. `nbtstat -c` - Gets NetBIOS hostname cache
17. `psservice` - Gets extra info about services (From Sysinternals Suite, note: **adds registry key**)
18. `procdump -ma explorer.exe` - Gets process dump of the given process and saves it to User's home folder (From Sysinternals Suite, note: **adds registry key**)
