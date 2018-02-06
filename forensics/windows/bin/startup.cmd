@echo off
set PATH=%~dp0\bin;%PATH%
echo.
echo "Run 'set NCHOST=192.168.1.1' and 'set NCPORT=12345'"
echo "After setting those, you can run 'ncrun <command>' to send the output across netcat"
echo.