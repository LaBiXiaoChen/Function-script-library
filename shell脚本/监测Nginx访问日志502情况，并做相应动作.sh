#假设服务器环境为lnmp，近期访问经常出现502现象，且502错误在重启php-fpm服务后消失，
#因此需要编写监控脚本，一旦出现502，则自动重启php-fpm服务。
#场景：
#1.访问日志文件的路径：/data/log/access.log
#2.脚本死循环，每10秒检测一次，10秒的日志条数为300条，出现502的比例不低于10%（30条）则需要重启php-fpm服务
#3.重启命令为：/etc/init.d/php-fpm restart
#!/bin/bash
###########################################################
#监测Nginx访问日志502情况，并做相应动作
###########################################################
log=/data/log/access.log
N=30 #设定阈值
while :
do
 #查看访问日志的最新300条，并统计502的次数
 err=`tail -n 300 $log |grep -c '502" '`
 if [ $err -ge $N ]
 then
 /etc/init.d/php-fpm restart 2> /dev/null
 #设定60s延迟防止脚本bug导致无限重启php-fpm服务
  sleep 60
 fi
 sleep 10
done