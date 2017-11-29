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
