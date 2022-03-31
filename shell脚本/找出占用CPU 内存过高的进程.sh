#!/bin/bash
echo "-------------------CUP占用前10排序--------------------------------"
ps -eo user,pid,pcpu,pmem,args --sort=-pcpu  |head -n 10
echo "-------------------内存占用前10排序--------------------------------"
ps -eo user,pid,pcpu,pmem,args --sort=-pmem  |head -n 10