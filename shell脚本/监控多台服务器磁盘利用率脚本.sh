#!/bin/bash
HOST_INFO=host.info
for IP in $(awk '/^[^#]/{print $1}' $HOST_INFO); do
 #取出用户名和端口
    USER=$(awk -v ip=$IP 'ip==$1{print $2}' $HOST_INFO)
    PORT=$(awk -v ip=$IP 'ip==$1{print $3}' $HOST_INFO)
 #创建临时文件，保存信息
    TMP_FILE=/tmp/disk.tmp
 #通过公钥登录获取主机磁盘信息
    ssh -p $PORT $USER@$IP 'df -h' > $TMP_FILE
 #分析磁盘占用空间
    USE_RATE_LIST=$(awk 'BEGIN{OFS="="}/^\/dev/{print $NF,int($5)}' $TMP_FILE)
 #循环磁盘列表，进行判断
    for USE_RATE in $USE_RATE_LIST; do
  #取出等号（=）右边的值 挂载点名称
        PART_NAME=${USE_RATE%=*}
  #取出等号（=）左边的值  磁盘利用率
        USE_RATE=${USE_RATE#*=}
  #进行判断
        if [ $USE_RATE -ge 80 ]; then
            echo "Warning: $PART_NAME Partition usage $USE_RATE%!"
    echo "服务器$IP的磁盘空间占用过高，请及时处理" | mail -s "空间不足警告" 你的qq@qq.com
  else
   echo "服务器$IP的$PART_NAME目录空间良好"
        fi
    done
done