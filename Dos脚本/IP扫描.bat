@echo off
FOR /L %%I in (1,1,25) do ping 192.168.50.%%I -n 1 -w 100
arp -a >H:\代码\扫描结果.txt
exit