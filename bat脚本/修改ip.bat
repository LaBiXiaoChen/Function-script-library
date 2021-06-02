

set /p ip=

netsh interface ip set address "WLAN" static %ip% 255.255.255.0 0.0.0.0
