@echo off 
:Begin 
ping www.baidu.com 
if errorlevel 1 goto Reboot 
if errorlevel 0 goto Continue
:Continue
goto Begin: 
:Reboot 
netsh interface set interface WLAN disabled
netsh interface set interface WLAN enable
ping -n 8 127.0.0.1>nulecho %date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%   断网已重启。。。>>log.txt
goto Begin