#!/bin/bash
echo "log.txt内容"
cat log.txt
echo -----------------------------------


# 用法一 awk '{[pattern] action}' {filenames} # 行匹配语句 awk '' 只能用单引号
echo 每行按空格或TAB分割，输出文本中的1、4项
awk '{print $1,$4}' log.txt
echo -----------------------------------

echo 格式化输出 
awk '{printf "%-8s %-10s\n",$1,$4}' log.txt
echo -----------------------------------

# 用法二 awk -F # -F相当于内置变量FS，指定分割字符
echo 使用“,”分割
awk -F, '{print $1,$2}' log.txt
echo -----------------------------------

echo 使用内置变量
awk 'BEGIN{FS=","} {print $1,$2}' log.txt
echo -----------------------------------

echo 使用多个分隔符，先用空格分隔，然后对分割结果再使用“,”分割
awk -F '[ ,]' '{print $1,$2,$5}' log.txt
echo -----------------------------------

# 用法三 awk -v # 设置变量
awk -va=1 '{print $1,$1+a}' log.txt
echo -----------------------------------

awk -va=1 -vb=s '{print $1,$1+a,$1b}' log.txt
echo -----------------------------------

# 用法四 awk -f {awk脚本} {文件名}
echo awk -f cal.awk log.txt
