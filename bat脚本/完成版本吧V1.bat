功能：实现同文件夹中的ip.txt文件中ip设置为本地ip

@echo off

@REM 提高内部权限，使用管理员身份运行
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

@REM 获取ip表中的需求ip的行数
set /p num=
echo %num%

@REM 使用num变量访问ip表截取需求ip
set ipAddress=""
for /f "skip=%num% tokens=2" %%a in (ip.txt) do (
    set ipAddress=%%a
    goto :Modify
    @REM goto到修改网络修改的功能行中
)

:Modify
echo 你修改的ip是：
echo %ipAddress%
netsh interface ip set address "WLAN" static %ipAddress% 255.255.255.0 0.0.0.0

@REM 暂停进行确认
pause