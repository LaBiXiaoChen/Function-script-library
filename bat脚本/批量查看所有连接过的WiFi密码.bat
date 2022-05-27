@echo off

chcp 437 >nul

for /f "tokens=1* delims=:" %%i in ('netsh wlan show profiles ^| findstr /c:"All User Profile"') do (

    call :GetPass %%j

)

pause

goto :eof

:GetPass

echo WiFi : %*

for /f "delims=" %%a in ('netsh wlan show profile name^="%*" key^=clear ^| findstr /c:"Key Content"') do (

    echo %%a

)

goto :eof