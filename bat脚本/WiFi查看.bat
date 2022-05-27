@echo off
netsh wlan show profile name="SPWH_H32_87B994_5G" key=clear
netsh wlan show profile name="HUAWEI nova lite 3" key=clear

netsh wlan show profiles
pause

set /p wifi-name=pls input your wifi name : 
netsh wlan show profile name="%wifi-name%" key=clear
pause>nul
