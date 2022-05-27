@echo off
rem @file:auto_connect_wifi.bat
rem @author:Genven_Liang
rem @date:2021.02.05
rem @note:for auto connect wifi
 
rem 要连接的wifi名称
set wifi_name=mywifi
set log_file=wifi.log
set try_cnt=1
 
rem 如果有参数1，就将参数1指定为wifi名称
if [%1] == [] (echo default_wifi>nul) || (
	set wifi_name=%1
)
 
echo [%date% %time%] Start connect wifi:%wifi_name% >>%log_file%
 
rem 主循环
:mainloop
	(netsh WLAN show interfaces | findStr %wifi_name% >nul && ( 
		echo already connected.
	)) || (
		set /a try_cnt+=1
		echo [%date% %time%] try to connect...[%try_cnt%]
		echo [%date% %time%] try to connect...[%try_cnt%] >>%log_file%
		netsh wlan connect ssid=%wifi_name% name=%wifi_name% >>%log_file%
	)
 
	choice /t 5 /d y /n >nul
 
goto mainloop