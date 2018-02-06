@echo off
echo ##############################################################  | %~dp0\nc.exe %NCHOST% %NCPORT% -w 1
echo %DATE% %TIME% - %* | %~dp0\nc.exe %NCHOST% %NCPORT% -w 1
%* | %~dp0\nc.exe %NCHOST% %NCPORT% -w 1