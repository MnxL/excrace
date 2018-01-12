#!/bin/bash

# 反引号
# 表达式和运算符之间要有空格，必须是2 + 2，2+2错误
val=`expr 2 + 2`
echo "两数之和为： $val"
a=10
b=20
echo '$a:'"$a" '$b:'"$b"
echo 'expr $a + $b' "`expr $a + $b`"
echo 'expr $a - $b' "`expr $a - $b`"
echo 'expr $a \* $b' "`expr $a \* $b`"
echo 'expr $b / $a' "`expr $b / $a`"
echo 'expr $b % $a' "`expr $b % $a`"
if [ $a == $b ]
then 
    echo "a 等于 b"
fi
if [ $a != $b ]
then 
    echo "a 不等于 b"
fi
# 关系运算符，只支持数字
# -eq [ $a -eq $b]
# -ne 不等于
# -gt 大于
# -lt 小于
# -ge 大于等于
# -le 小于等于

# 布尔运算符
# ! 非 [ ! false ]
# -o 或 [ $a -lt 20 -o $b -gt 100]
# -a 与

# 逻辑运算符
# && [[ $a -lt 100 && $b -gt 100 ]]
# ||

# 字符串运算符
# = 字符串是否相等
# != 
# -z 字符串长度是否为0
# -n 是否为0
# str 字符串是否为空

stra="abc"
strb="efg"

if [ $stra = $strb ]
then
    echo "$stra = $strb : stra 等于 strb"
else
    echo "$stra = $strb : stra 不等于 strb"
fi
if [ -z $stra ]
then 
    echo "-z $stra : stra 长度为0"
else
    echo "-z $stra : stra 长度不为0"
fi
if [ $stra ]
then
    echo "$stra : 字符串不为空"
else
    echo "$stra : 字符串为空"
fi


# 文件测试运算符
# -b file 快设备文件
# -c file 字符设备文件
# -d file 目录
# -f file 普通文件（既不是目录，也不是设备文件）
# -g file 是否设置了SGID位
# -k file 是否设置了粘着位（Sticky Bit）
# -p file 是否是有名管道
# -u file 是否设置了SUID位
# -r/w/x file 是否可读可写可执行
# -s file 文件是否为空（文件大小是否大于0）
# -e file 文件（目录）是否存在
