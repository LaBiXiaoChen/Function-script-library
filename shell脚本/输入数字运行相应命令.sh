#!/bin/bash
##############################################################
#输入数字运行相应命令
##############################################################
echo "*cmd menu* 1-date 2-ls 3-who 4-pwd 0-exit "
while :
do
#捕获用户键入值
 read -p "please input number :" n
 n1=`echo $n|sed s'/[0-9]//'g`
#空输入检测
 if [ -z "$n" ]
 then
 continue
 fi
#非数字输入检测
 if [ -n "$n1" ]
 then
 exit 0
 fi
 break
done
case $n in
 1)
 date
 ;;
 2)
 ls
 ;;
 3)
 who
 ;;
 4)
 pwd
 ;;
 0)
 break
 ;;
 #输入数字非1-4的提示
 *)
 echo "please input number is [1-4]"
esac