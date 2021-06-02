::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFEkHGlzbAE+/Fb4I5/jH+++UtgMYTOdf
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

@REM 提高内部权限，使用管理员身份运行
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

set MACHINE_TYPE=""
set VERSION_NUMBER=""
set MODEL_NAME=""
@REM :如下代码的效果就是把第一�?MACHINE_TYPE = 12 中的 12 取出�?
for /f "tokens=2-3" %%a in (ip.txt) do (
    set MACHINE_TYPE=%%a
    goto :Show
)
:Show
@REM :如下代码的效果就是把第二�?VERSION_NUMBER = 1.1.1 中的 1.1.1 取出�?
for /f "skip=1 tokens=2" %%b in (ip.txt) do (
    set VERSION_NUMBER=%%b
    goto :show1
)
:show1
@REM :如下代码的效果就是把第三�?MODEL_NAME = KK 中的 KK 取出�?
for /f "skip=2 tokens=2" %%b in (ip.txt) do (
    set MODEL_NAME=%%b
    goto :show2
)
:show2

ECHO %MACHINE_TYPE%
ECHO %VERSION_NUMBER%
ECHO %MODEL_NAME%

netsh interface ip set address "WLAN" static %MACHINE_TYPE% 255.255.255.0 0.0.0.0
pause