#!/bin/bash

MON_DIR=/opt
inotifywait -mqr --format %f -e create $MON_DIR |\
while read files; do
   #同步文件
   rsync -avz /opt /tmp/opt
  #检测文件是否被修改
   #echo "$(date +'%F %T') create $files" | mail -s "dir monitor" xxx@163.com
done