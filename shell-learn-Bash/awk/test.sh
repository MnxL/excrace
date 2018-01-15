#!/bin/bash
echo "log.txt内容"
cat log.txt
echo “-----------------------------------”
# 每行按空格或TAB分割，输出文本中的1、4项
awk '{print $1,$4}' log.txt
# 格式化输出 
awk '{printf "%-8s %-10s\n",$1,$4}' log.txt
