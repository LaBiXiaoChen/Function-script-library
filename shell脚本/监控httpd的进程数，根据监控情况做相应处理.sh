#!/bin/bash
###############################################################################################################################
#需求：
#1.每隔10s监控httpd的进程数，若进程数大于等于500，则自动重启Apache服务，并检测服务是否重启成功
#2.若未成功则需要再次启动，若重启5次依旧没有成功，则向管理员发送告警邮件，并退出检测
#3.如果启动成功，则等待1分钟后再次检测httpd进程数，若进程数正常，则恢复正常检测（10s一次），否则放弃重启并向管理员发送告警邮件，并退出检测
###############################################################################################################################
#计数器函数
check_service()
{
 j=0
 for i in `seq 1 5`
 do
 #重启Apache的命令
 /usr/local/apache2/bin/apachectl restart 2> /var/log/httpderr.log
 #判断服务是否重启成功
 if [ $? -eq 0 ]
 then
 break
 else
 j=$[$j+1]
 fi
 #判断服务是否已尝试重启5次
 if [ $j -eq 5 ]
 then
 mail.py
 exit
 fi
 done
}
while :
do
 n=`pgrep -l httpd|wc -l`
 #判断httpd服务进程数是否超过500
 if [ $n -gt 500 ]
 then
 /usr/local/apache2/bin/apachectl restart
 if [ $? -ne 0 ]
 then
 check_service
 else
 sleep 60
 n2=`pgrep -l httpd|wc -l`
 #判断重启后是否依旧超过500
    if [ $n2 -gt 500 ]
 then
 mail.py
 exit
 fi
 fi
 fi
 #每隔10s检测一次
 sleep 10
done