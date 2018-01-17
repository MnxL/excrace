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
echo -----------------------------------


echo 过滤第一列大于2的行
awk '$1>2' log.txt
echo -----------------------------------

echo 过滤第一列等于2的行，输出1、3列
awk '$1==2 {print $1, $3}' log.txt
echo -----------------------------------

echo 过滤第一列大于2并且第二列等于‘Are’的列，输出1、2、3列
awk '$1>2 && $2=="Are" {print $1,$2,$3}' log.txt
echo -----------------------------------

echo 内建变量
awk 'BEGIN{printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n","FILENAME","ARGC","FNR","FS","NF","NR","OFS","ORS","RS";printf "-----------------------------------\n"} {printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n",FILENAME,ARGC,FNR,FS,NF,NR,OFS,ORS,RS}' log.txt

awk -F\' 'BEGIN{printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n","FILENAME","ARGC","FNR","FS","NF","NR","OFS","ORS","RS";printf "-----------------------------------\n"} {printf "%4s %4s %4s %4s %4s %4s %4s %4s %4s\n",FILENAME,ARGC,FNR,FS,NF,NR,OFS,ORS,RS}' log.txt
echo 指定输出分隔符为$
awk '{print $1,$2,$5}' OFS=" $ " log.txt

echo -----------------------------------
echo \n正则匹配
echo 输出第二列包含"th"，并打印第二列与第四列
awk '$2 ~ /th/ {print $2,$4}' log.txt
echo -----------------------------------
echo 输出包含“re”的行
awk '/re/ ' log.txt
echo -----------------------------------
echo 忽略大小写
awk 'BEGIN{IGNORECASE=1} /this/' log.txt
echo -----------------------------------
echo 模式取反
echo 第二列不包含“th”，打印二四列
awk '$2 !~ /th/ {print $2,$4}' log.txt
echo -----------------------------------
echo 不包含“re”的行
awk '!/re/' log.txt


echo -----------------------------------
echo 计算文件大小
ls -l *.txt | awk '{sum+=$5} END {print sum}'

echo 长度大于15的行
awk 'length>15' log.txt

echo 打印九九乘法表
seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"\n":"\t")} END{print "------------------------------\n"}'

