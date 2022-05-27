功能：实现将ip.txt中ip全部录入到tcp/ip高级目录中

@echo off

@REM 提高权限
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

@REM 访问ip表，获取第二列和第三列，写入本地中
for /f "tokens=2-3" %%a in (ip.txt) do (
    echo %%a %%b
    netsh int ip add address "WLAN" %%a %%b
)

pause